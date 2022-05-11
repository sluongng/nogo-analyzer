# nogo analyzer

A collection of Go popular static analyzers which is meant to be used with Bazel's rules_go's `nogo` static analysis framework.

Aimed to be easy to use and consume.

## How to use

Add this into your WORKSPACE project

```
http_archive(
    name = "com_github_sluongng_nogo_analyzer",
    sha256 = "<replace-with-release-sha>",
    urls = [
        "https://github.com/sluongng/nogo-analyzer/releases/download/<release-tag>/nogo-analyzer-<release-tag>.zip",
    ],
)
```

And follow instructions in specific README file of each analyzer collections:

1. [staticcheck](./staticcheck/README.md)
1. [golangci-lint](./golangci/README.md)
