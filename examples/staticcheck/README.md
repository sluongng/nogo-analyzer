# Nogo/staticcheck example.

This example setup includes initial nogo configuration with sevral checks and
check overrides.

Targets:
* `bazel build //cmd/pass` built without errors.
* `bazel build //cmd/failed` fails with the following errors:

```
compilepkg: nogo: errors found by nogo during build-time code analysis:
cmd/failed/main.go:8:20: parsing time "01-01-2023" as "01-01-2023": cannot parse "" as "3" (SA1002)
cmd/failed/main.go:10:14: sleeping for 1 nanoseconds is probably a bug; be explicit if it isn't (SA1004)
```
