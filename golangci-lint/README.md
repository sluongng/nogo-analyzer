# golangci-lint analyzers

(Work In Progress)

This currently setup some very basic analyzers extracted from golangci-lint repo.

Currently not all linters/analyzers are included but only the basic ones.

## WARNING

Initial development showed that there are several problems with setting up golangci-lint analyzer this way:

1. Dependency bloat:
   golangci-lint includes a lot of dependencies even if you don't use all of them.
   These can be quite huge and increase projects' complexity by a wide margin.

2. I/O throttling:
   Initializing golangci-lint analyzer as-is seems to require a lot of on-disk I/O resources, even for simple linter.

3. Lack of hermeticity:
   Most golangci-lint analyzer requires `GOROOT` environmental variable set upon initialization inside Bazel's `test` phase.
   Since `nogo` binary is executed during rules_go's package compilation, this means that this variable needs to be set correctly during `build` phase as well.
   Currently it's not clear yet if the more complex analyzers would require additional variables at different phases.

For the above reason, I DO NOT recommend folks to use this golangci-lint wrapper package as-is.

This package should only be used as reference for educational purposes.

## Future

A more scalable approach would be to rewrite the Analyzers one by one and simplify/remove the bloats dependencies entirely.
The implementation of these Analyzers can be quite simple to write and manage.

I want to explore this direction in the near-future, bringing more checks widely avaiable to rules_go users.