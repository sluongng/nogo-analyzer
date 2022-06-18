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
			"@com_github_sluongng_nogo_analyzer//goci-lint/gofmt",
		],
    visibility = ["//visibility:public"],
)

go_library(
    name = "gofmt_fail",
    srcs = ["gofmt_fail.go"],
    importpath = "gofmt/fail",
)

go_library(
    name = "gofmt_ok",
    srcs = ["gofmt_ok.go"],
    importpath = "gofmt/ok",
)

-- gofmt_fail.go --
package fail

func foo( ) {}
-- gofmt_ok.go --
package ok

func foo() {}
`,
		WorkspaceSuffix: `
load("@com_github_sluongng_nogo_analyzer//goci-lint/gofmt:deps.bzl",  "gofmt_deps")

gofmt_deps()

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
			target:      "//:gofmt_fail",
			wantSuccess: true,
		},
		{
			desc:        "nogo enable, lint ok",
			nogo:        "@//:nogo",
			target:      "//:gofmt_ok",
			wantSuccess: true,
		},
		{
			desc:        "nogo enable, lint fail",
			nogo:        "@//:nogo",
			target:      "//:gofmt_fail",
			wantSuccess: false,
			includes: []string{
				// Notes that these regexp are equal to litteral matches of these:
				//   -func foo( ) {}
				//   +func foo() {}
				`-func foo\( \) \{\}`,
				`\+func foo\(\) \{\}`,
				"(gofmt)",
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
