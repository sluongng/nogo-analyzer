ANALYZERS = [
    "asciicheck",
    "bodyclose",
    "canonicalheader",
    "containedctx",
    "contextcheck",
    "durationcheck",
    "err113",
    "errname",
    "execinquery",
    "exportloopref",
    "fatcontext",
    "forcetypeassert",
    "gocheckcompilerdirectives",
    "gochecknoglobals",
    "gochecknoinits",
    "gochecksumtype",
    "goprintffuncname",
    "ineffassign",
    "intrange",
    "mirror",
    "nilerr",
    "noctx",
    "nosprintfhostport",
    "sqlclosecheck",
    "testableexamples",
    "tparallel",
    "zerologlint",
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
