# goci-lint

An attempt to rewrite analyzers in golangci-lint one by one while removing all the bloats.

## Note on 'unused' linters

`nogo` runs per-package. Meaning that it's the same with cd into each of the sub-directories and run the linter once.
For this reason, it's not possible to detect whether or not some code was used outside of the package context.

Most unused linters accomplised their checks by running on the global context of the repository, build up a map
in-memory of what was used, and what was not used.  `nogo` does not have access to this global context of the entire
repository thus most `unused` linters will be inaccurate.

## How to use

Users should consider loading the `deps.bzl` file inside each individual linter in their WORKSPACE file.
These `deps.bzl` files often contains the `go_repository` targets required for the linter to function properly.

To ensure that the correct version of these linters are used, you should consider loading them before
other dependencies.

For example:

```
load("@com_github_sluongng_nogo_analyzer//goci-lint/gofmt:deps.bzl",  "gofmt_deps")

gofmt_deps()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()
```

For more examples, check out the [integration tests](./tests) setup.

## Rewrite status of golangci linters

### Default linters

- [X] errcheck
- [X] ineffassign
- [X] govet
      (Note: provided by `nogo`)
- [X] staticcheck
      (Note: provided by `//staticcheck`)
- [X] unused
      (Note: provided by `//staticcheck`)
- [X] gosimple
      (Note: provided by `//staticcheck`)
- [ ] deadcode
      (Note: will not be implemented. Unused check is not effective with `nogo`)
- [ ] structcheck
      (Note: will not be implemented. Unused check is not effective with `nogo`)
- [ ] varcheck
      (Note: will not be implemented. Unused check is not effective with `nogo`)
- [ ] typecheck
      (Note: will not be implemented. Already checked by go compiler)

### Disabled by default

- [ ] asciicheck
- [ ] bidichk
- [ ] bodyclose
- [ ] containedctx
- [ ] contextcheck
- [ ] cyclop
- [ ] decorder
- [ ] depguard
- [ ] dogsled
- [ ] dupl
- [ ] durationcheck
- [ ] errchkjson
- [ ] errname
- [ ] errorlint
- [ ] execinquery
- [ ] exhaustive
- [ ] exhaustivestruct
- [ ] exhaustruct
- [ ] exportloopref
- [ ] forbidigo
- [ ] forcetypeassert
- [ ] funlen
- [ ] gci
- [ ] gochecknoglobals
- [ ] gochecknoinits
- [ ] gocognit
- [ ] goconst
- [ ] gocritic
- [ ] gocyclo
- [ ] godot
- [ ] godox
- [ ] goerr113
- [X] gofmt
- [ ] gofumpt
- [ ] goheader
- [ ] goimports
- [ ] golint
- [ ] gomnd
- [ ] gomoddirectives
- [ ] gomodguard
- [ ] goprintffuncname
- [ ] gosec
- [ ] grouper
- [ ] ifshort
- [ ] importas
- [ ] interfacer
- [ ] ireturn
- [ ] lll
- [ ] maintidx
- [ ] makezero
- [ ] maligned
- [ ] misspell
- [ ] nakedret
- [ ] nestif
- [ ] nilerr
- [ ] nilnil
- [ ] nlreturn
- [ ] noctx
- [ ] nolintlint
- [ ] nonamedreturns
- [ ] nosprintfhostport
- [ ] paralleltest
- [ ] prealloc
- [ ] predeclared
- [ ] promlinter
- [ ] revive
- [ ] rowserrcheck
- [ ] scopelint
- [ ] sqlclosecheck
- [ ] stylecheck
- [ ] tagliatelle
- [ ] tenv
- [ ] testpackage
- [ ] thelper
- [ ] tparallel
- [ ] unconvert
- [ ] unparam
- [ ] varnamelen
- [ ] wastedassign
- [ ] whitespace
- [ ] wrapcheck
- [ ] wsl
