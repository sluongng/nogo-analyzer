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
    sha256 = "0dc6b5e86094d081e05bcd0c3e41fc275a2398c64e545376166139412181f150",
    strip_prefix = "nogo-analyzer-0.0.3",
    urls = [
        "https://github.com/sluongng/nogo-analyzer/archive/refs/tags/v0.0.3.tar.gz",
    ],
)
```

And follow instructions in specific README file of each analyzer collections.
