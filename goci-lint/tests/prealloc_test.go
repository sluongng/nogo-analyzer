package goci_test

import (
	"bytes"
	"fmt"
	"io/ioutil"
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
			"@com_github_sluongng_nogo_analyzer//goci-lint/prealloc",
		],
    visibility = ["//visibility:public"],
)

go_library(
    name = "prealloc_fail",
    srcs = ["prealloc_fail.go"],
    importpath = "prealloc/fail",
)

go_library(
    name = "prealloc_ok",
    srcs = ["prealloc_ok.go"],
    importpath = "prealloc/ok",
)

-- prealloc_fail.go --
package fail

func foo() {
	fixedSize := []int{1,2,3,4,5}
	var notPreAlloc []int

	for _, v := range fixedSize {
		notPreAlloc = append(notPreAlloc, v)
	}
}
-- prealloc_ok.go --
package ok

func foo() {
	fixedSize := []int{1,2,3,4,5}
	isPreAlloc := make([]int, 0, len(fixedSize))

	for _, v := range fixedSize {
		isPreAlloc = append(isPreAlloc, v)
	}
}
`,
		WorkspaceSuffix: `
load("@com_github_sluongng_nogo_analyzer//goci-lint/prealloc:deps.bzl",  "prealloc_deps")

prealloc_deps()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()
`,
	})
}

func TestPrealloc(t *testing.T) {
	for _, test := range []struct {
		desc, nogo, target string
		wantSuccess        bool
		includes, excludes []string
	}{
		{
			desc:        "nogo disable, no lint run",
			nogo:        "",
			target:      "//:prealloc_fail",
			wantSuccess: true,
		},
		{
			desc:        "nogo enable, lint ok",
			nogo:        "@//:nogo",
			target:      "//:prealloc_ok",
			wantSuccess: true,
		},
		{
			desc:        "nogo enable, lint fail",
			nogo:        "@//:nogo",
			target:      "//:prealloc_fail",
			wantSuccess: false,
			includes: []string{
				`prealloc_fail\.go.*Consider preallocating notPreAlloc`,
				`\(prealloc\)`,
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
