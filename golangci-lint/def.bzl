# All analyzers in golangci-lint.
#
# Generate this list by running:
#
#   > bazel run //golangci-lint/cmd/list_analyzers
#
# TODO: not all analyzer work right now. We need to
# call goanalysis.Linter.preRun after initialize the analyzer.
# Possibly this needs some way to parse and pass down the YAML config file of golangci-lint.
ANALYZERS = [
    "asciicheck",
    "bodyclose",
    "containedctx",
    "contextcheck",
    "deadcode",
    # "depguard",
    # "dogsled",
    # "dupl",
    "durationcheck",
    "err113",
    # "errcheck",
    "errname",
    "execinquery",
    "exportloopref",
    # "forbidigo",
    "forcetypeassert",
    # "funlen",
    "gochecknoglobals",
    "gochecknoinits",
    # "goconst",
    # "gocritic",
    # "gocyclo",
    # "godot",
    # "godox",
    # "gofmt",
    # "gofumpt",
    # "goheader",
    # "goimports",
    # "golint",
    "goprintffuncname",
    "ineffassign",
    # "interfacer",
    # "lll",
    # "makezero",
    # "maligned",
    # "misspell",
    # "nakedret",
    "nilerr",
    "noctx",
    # "nolintlint",
    "nonamedreturns",
    "nosprintfhostport",
    "paralleltest",
    # "prealloc",
    # "promlinter",
    "rowserrcheck",
    # "scopelint",
    "sqlclosecheck",
    # "structcheck",
    # "the_only_name",
    "tparallel",
    "typecheck",
    # "unconvert",
    # "unparam",
    # "varcheck",
    "wastedassign",
    # "whitespace",
]

def golangci_lint_analyzers(analyzers, prefix_path = "@com_github_sluongng_nogo_analyzer//golangci-lint"):
    """A helper function that make it easier/cleaner to declare these analyers in nogo target.

    Instead of:
        nogo(
            name = "nogo",
            deps = TOOLS_NOGO + [
                "@com_github_sluongng_nogo_analyzer//golangci-lint:gofumpt",
                "@com_github_sluongng_nogo_analyzer//golangci-lint:misspell",
            ],
            visibility = ["//visibility:public"],
        )

    We can write it as:
        nogo(
            name = "nogo",
            deps = TOOLS_NOGO + golangci_lint_analyzers(["gofumpt", "misspell"]),
            visibility = ["//visibility:public"],
        )

    To enable all golangci-lint analyzers:
        load("@com_github_sluongng_nogo_analyzer//golangci-lint:def.bzl", "ANALYZERS")

        nogo(
            name = "nogo",
            deps = TOOLS_NOGO + golangci_lint_analyzers([ANALYZERS]),
            visibility = ["//visibility:public"],
        )
    """
    return [prefix_path + ":" + a for a in analyzers]
