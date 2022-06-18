package goci_test

import (
	"bytes"
	"fmt"
	"regexp"
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
			"@com_github_sluongng_nogo_analyzer//goci-lint/errcheck",
		],
    visibility = ["//visibility:public"],
)

go_library(
    name = "errcheck_fail",
    srcs = ["errcheck_fail.go"],
    importpath = "errcheck/fail",
)

go_library(
    name = "errcheck_ok",
    srcs = ["errcheck_ok.go"],
    importpath = "errcheck/ok",
)
-- errcheck_fail.go --
package fail

import "fmt"

func foo() error {
	return fmt.Errorf("blah")
}

func bar() {
	foo()
}
-- errcheck_ok.go --
package ok

import "fmt"

func foo() error {
	return fmt.Errorf("blah")
}

func bar() {
	if err := foo(); err != nil {
		// Do something
	}
}
`,
		WorkspaceSuffix: `
# gazelle:repository go_repository name=org_golang_x_tools importpath=golang.org/x/tools

load("@com_github_sluongng_nogo_analyzer//goci-lint/errcheck:deps.bzl",  "errcheck_deps")

errcheck_deps()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()
`,
	})
}

func TestErrcheck(t *testing.T) {
	for _, test := range []struct {
		desc, nogo, target string
		wantSuccess        bool
		includes, excludes []string
	}{
		{
			desc:        "nogo disable, no lint run",
			nogo:        "",
			target:      "//:errcheck_fail",
			wantSuccess: true,
		},
		{
			desc:        "nogo enable, lint ok",
			nogo:        "@//:nogo",
			target:      "//:errcheck_ok",
			wantSuccess: true,
		},
		{
			desc:        "nogo enable, lint fail",
			nogo:        "@//:nogo",
			target:      "//:errcheck_fail",
			wantSuccess: false,
			includes: []string{
				"errcheck",
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
				if matched, err := regexp.Match(pattern, stderr.Bytes()); err != nil {
					t.Fatal(err)
				} else if !matched {
					t.Errorf("output did not contain pattern: %s\n", pattern)
				}
			}
			for _, pattern := range test.excludes {
				if matched, err := regexp.Match(pattern, stderr.Bytes()); err != nil {
					t.Fatal(err)
				} else if matched {
					t.Errorf("output contained pattern: %s", pattern)
				}
			}
		})
	}
}
