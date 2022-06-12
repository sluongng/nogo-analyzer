# nogo-analyzer

A collection of Go popular static analyzers. 

Designed to be used with Bazel rules_go's `nogo` static analysis framework.
Aimed to be easy to use and customize.


## Project Status

1. [staticcheck](./staticcheck/README.md): Stable and ready to be used

1. [golangci-lint](./golangci-lint/README.md): POC-only. Should NOT be used except for research purposes.

1. [goci-lint](./goci-lint/README.md): An attempt to skim down `golangci-lint` to make it more suitable while using with `nogo`.


## How to use

Add this into your WORKSPACE project

```
http_archive(
    name = "com_github_sluongng_nogo_analyzer",
    sha256 = "ab9ab7936b6d490ff92bb8e3e03bc3ace3406f0b4d1625cc0720d0e9e81a369a",
    strip_prefix = "nogo-analyzer-0.0.1",
    urls = [
        "https://github.com/sluongng/nogo-analyzer/archive/refs/tags/v0.0.1.tar.gz",
    ],
)
```

And follow instructions in specific README file of each analyzer collections.
