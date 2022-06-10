package goci_test

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"strings"
	"testing"

	"github.com/bazelbuild/rules_go/go/tools/bazel_testing"
)

func TestMain(m *testing.M) {
	bazel_testing.TestMain(m, bazel_testing.Args{
		Main: `
-- BUILD.bazel --
load("@io_bazel_rules_go//go:def.bzl", "go_library", "go_tool_library", "nogo")

nogo(
    name = "nogo",
		deps = [
			"@com_github_sluongng_nogo_analyzer//goci-lint/goimports",
		],
		config = "config.json",
    visibility = ["//visibility:public"],
)

go_library(
    name = "goimports_fail",
    srcs = ["goimports_fail.go"],
    importpath = "goimports/fail",
)

go_library(
    name = "goimports_fail_import",
    srcs = ["goimports_fail_import.go"],
    importpath = "goimports/fail_import",
    deps = [
        "@org_golang_x_tools//imports",
		]
)

go_library(
    name = "goimports_ok",
    srcs = ["goimports_ok.go"],
    importpath = "goimports/ok",
)

-- goimports_fail.go --
package fail

func foo( ) {}
-- goimports_fail_import.go --
package fail_import

import (
	"golang.org/x/tools/imports"
	"os"
	"fmt"
)

func bar() {
	_ = fmt.Printf
	_ = os.Getwd
	_ = imports.Process
}
-- goimports_ok.go --
package ok

func foo() {}
-- config.json --
{
	"goimports": {
		"exclude_files": {
			"external/.*": "ignore external dependencies"
		}
	}
}
`,
		WorkspaceSuffix: `
# gazelle:repository go_repository name=org_golang_x_tools importpath=golang.org/x/tools

load("@com_github_sluongng_nogo_analyzer//goci-lint/goimports:deps.bzl",  "goimports_deps")

goimports_deps()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()
`,
	})
}

func TestGofmt(t *testing.T) {
	for _, test := range []struct {
		desc, nogo, target string
		wantSuccess        bool
		includes, excludes []string
	}{
		{
			desc:        "nogo disable, no lint run",
			nogo:        "",
			target:      "//:goimports_fail",
			wantSuccess: true,
		},
		{
			desc:        "nogo enable, lint ok",
			nogo:        "@//:nogo",
			target:      "//:goimports_ok",
			wantSuccess: true,
		},
		{
			desc:        "nogo enable, lint fail due to formatting",
			nogo:        "@//:nogo",
			target:      "//:goimports_fail",
			wantSuccess: false,
			includes: []string{
				`
@@ -1,3 +1,3 @@
 package fail
 
-func foo( ) {}
+func foo() {}
 (goimports)`,
			},
		},
		{
			desc:        "nogo enable, lint fail due to extra import",
			nogo:        "@//:nogo",
			target:      "//:goimports_fail_import",
			wantSuccess: false,
			includes: []string{
				`
@@ -1,9 +1,10 @@
 package fail_import
 
 import (
-	"golang.org/x/tools/imports"
-	"os"
 	"fmt"
+	"os"
+
+	"golang.org/x/tools/imports"
 )
 
 func bar() {
 (goimports)`,
			},
		},
	} {
		t.Run(test.desc, func(t *testing.T) {
			// ensure nogo is configured
			if test.nogo != "" {
				origRegister := "go_register_toolchains()"
				customRegister := fmt.Sprintf("go_register_toolchains(nogo = %q)", test.nogo)
				if err := replaceInFile("WORKSPACE", origRegister, customRegister, false); err != nil {
					t.Fatal(err)
				}
				defer replaceInFile("WORKSPACE", customRegister, origRegister, false)
			}

			// run bazel build
			cmd := bazel_testing.BazelCmd("build", test.target)
			stderr := &bytes.Buffer{}
			cmd.Stderr = stderr
			if err := cmd.Run(); err == nil && !test.wantSuccess {
				t.Fatal("unexpected success")
			} else if err != nil && test.wantSuccess {
				t.Logf("output: %s\n", stderr.Bytes())
				t.Fatalf("unexpected error: %v", err)
			}
			t.Logf("output: %s\n", stderr.Bytes())

			// check content of stderr
			for _, pattern := range test.includes {
				if !strings.Contains(stderr.String(), pattern) {
					t.Errorf("output contained pattern: %s", pattern)
				}
			}
			for _, pattern := range test.excludes {
				if strings.Contains(stderr.String(), pattern) {
					t.Errorf("output contained pattern: %s", pattern)
				}
			}
		})
	}
}

func replaceInFile(path, old, new string, once bool) error {
	data, err := ioutil.ReadFile(path)
	if err != nil {
		return err
	}
	if once {
		data = bytes.Replace(data, []byte(old), []byte(new), 1)
	} else {
		data = bytes.ReplaceAll(data, []byte(old), []byte(new))
	}
	return ioutil.WriteFile(path, data, 0o666)
}
