package golangci_lint_test

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"regexp"
	"strings"
	"testing"

	"github.com/bazelbuild/rules_go/go/tools/bazel_testing"
)

func TestMain(m *testing.M) {
	bazel_testing.TestMain(m, bazel_testing.Args{
		Main: `
-- BUILD.bazel --
load("@io_bazel_rules_go//go:def.bzl", "go_library", "go_tool_library", "nogo")
load("@com_github_sluongng_nogo_analyzer//golangci-lint:def.bzl", "golangci_lint_analyzers")

nogo(
    name = "nogo",
		deps = golangci_lint_analyzers(["NOGO_ANALYZER_PLACEHOLDER"]), # to be replaced in test data
    visibility = ["//visibility:public"],
)

go_library(
    name = "bodyclose_fail",
    srcs = ["bodyclose_fail.go"],
    importpath = "bodyclose/fail",
)

go_library(
    name = "bodyclose_ok",
    srcs = ["bodyclose_ok.go"],
    importpath = "bodyclose/ok",
)

-- bodyclose_fail.go --
package fail

import (
	"io/ioutil"
	"net/http"
)

func foo( ) {
	resp, err := http.Get("http://example.com/") // Wrong case
	if err != nil {
	}
	if _, err := ioutil.ReadAll(resp.Body); err != nil {
	}
}
-- bodyclose_ok.go --
package ok

import (
	"io/ioutil"
	"net/http"
)

func foo() {
	resp, err := http.Get("http://example.com/") // Wrong case
	if err != nil {
	}
	defer resp.Body.Close()
	if _, err := ioutil.ReadAll(resp.Body); err != nil {
	}
}
`,
		WorkspaceSuffix: `
load("@com_github_sluongng_nogo_analyzer//golangci-lint:deps.bzl",  "golangci_lint_deps")

golangci_lint_deps()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()
`,
	})
}

func Test(t *testing.T) {
	for _, test := range []struct {
		desc, nogo, target            string
		wantSuccess                   bool
		analyzers, includes, excludes []string
	}{
		{
			desc:        "nogo disable, no lint run",
			nogo:        "",
			analyzers:   []string{"bodyclose"},
			target:      "//:bodyclose_ok",
			wantSuccess: true,
		},
		{
			desc:        "has no doc, lint fail",
			nogo:        "@//:nogo",
			analyzers:   []string{"bodyclose"},
			target:      "//:bodyclose_fail",
			wantSuccess: false,
			includes: []string{
				"response body must be closed",
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

			// ensure golangci-lint analyzer is configured in nogo
			if len(test.analyzers) == 0 {
				t.Fatal("enabling nogo requires at least one analyzer configured")
			}
			analyzerStr := strings.Join(test.analyzers, `", "`)
			if err := replaceInFile("BUILD.bazel", "NOGO_ANALYZER_PLACEHOLDER", analyzerStr, true); err != nil {
				t.Fatal(err)
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

			// return the BUILD.bazel nogo to original template for next test
			if err := replaceInFile("BUILD.bazel", analyzerStr, "NOGO_ANALYZER_PLACEHOLDER", true); err != nil {
				t.Fatal(err)
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
