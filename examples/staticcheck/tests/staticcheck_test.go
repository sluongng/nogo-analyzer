package staticcheck_test

import (
	"bytes"
	"fmt"
	"os"
	"regexp"
	"strings"
	"testing"

	"github.com/bazelbuild/rules_go/go/tools/bazel_testing"
)

func TestMain(m *testing.M) {
	bazel_testing.TestMain(m, bazel_testing.Args{
		Main: `
-- BUILD.bazel --
load("@bazel_gazelle//:def.bzl", "gazelle")
load("@com_github_sluongng_nogo_analyzer//staticcheck:def.bzl", "staticcheck_analyzers")
load("@com_github_sluongng_nogo_analyzer//:def.bzl", "nogo_config")
load("@io_bazel_rules_go//go:def.bzl", "go_library", "nogo")

# gazelle:prefix github.com/sluongng/nogo-analyzer/examples/staticcheck
gazelle(name = "gazelle")

gazelle(
    name = "deps",
    args = [
        "-from_file=go.mod",
        "-to_macro=go_deps.bzl%%go_deps",
        "-prune",
    ],
    command = "update-repos",
)

SA1 = [
  "SA1002", # Invalid format in time.Parse
  "SA1004", # Suspiciously small untyped constant in time.Sleep
]

SA4 = [
  "SA4013", # Negating a boolean twice (!!b) is the same as writing b. This is either redundant, or a typo.
]

STATICCHECK_ANALYZERS = SA1 + SA4

STATICCHECK_OVERRIDE = {
  "SA4013": {
    "exclude_files": {
      "/": "excluded",
    }
  },
}

nogo_config(
    name = "nogo_config",
    out = "nogo_config.json",
    analyzers = STATICCHECK_ANALYZERS,
    override = STATICCHECK_OVERRIDE,
)

nogo(
    name = "nogo",
    config = ":nogo_config.json",
    visibility = ["//visibility:public"],
    deps = staticcheck_analyzers(STATICCHECK_ANALYZERS),
)

go_library(
    name = "failed",
    srcs = ["failed.go"],
    importpath = "failed",
)

go_library(
    name = "ok",
    srcs = ["ok.go"],
    importpath = "ok",
)

-- failed.go --
package main

import "time"

func main() {
	_, _ = time.Parse("01-01-2023", "2023-01-01")
	if !!true {
		time.Sleep(1)
	}
}

-- ok.go --
package main

import (
	"fmt"
	"time"
)

func main() {
	d, err := time.Parse("01-02-2006", "01-01-2023")
	if err != nil {
		panic(err)
	}

	fmt.Printf("date: %%s\n", d)
}
`,
		WorkspaceSuffix: `
load("@com_github_sluongng_nogo_analyzer//staticcheck:deps.bzl", "staticcheck")

staticcheck()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()
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
			desc:        "fails for some checks",
			nogo:        "@//:nogo",
			analyzers:   []string{"ST1002", "ST1004", "SA4013"},
			target:      "//:failed",
			wantSuccess: false,
			includes: []string{
				"compilepkg: nogo: errors found by nogo during build-time code analysis:",
				`failed.go:6:20: parsing time "01-01-2023" as "01-01-2023": cannot parse "" as "3" \(SA1002\)`,
				`failed.go:8:14: sleeping for 1 nanoseconds is probably a bug; be explicit if it isn't \(SA1004\)`,
			},
		}, {
			desc:        "pass",
			nogo:        "@//:nogo",
			analyzers:   []string{"ST1002", "ST1004", "SA4013"},
			target:      "//:ok",
			wantSuccess: true,
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

			// ensure staticcheck analyzer is configured in nogo
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
	data, err := os.ReadFile(path)
	if err != nil {
		return err
	}
	if once {
		data = bytes.Replace(data, []byte(old), []byte(new), 1)
	} else {
		data = bytes.ReplaceAll(data, []byte(old), []byte(new))
	}
	return os.WriteFile(path, data, 0o666)
}
