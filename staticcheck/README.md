# staticcheck analyzers

This package is provided as an opt-in part of rules_go.

Projects who have the need to use staticcheck analyzers as part of rules_go's nogo framework may use this package to enable the checks over existing code base.

## How to use

1. Please refer to the **nogo** documentation in https://github.com/bazelbuild/rules_go/blob/master/go/nogo.rst to learn the basic setup.


2. Load staticcheck dependencies in your WORKSPACE.

```
load("//nogo-analyzer/staticcheck:deps.bzl", "staticcheck_deps")

staticcheck_deps()
```

`gazelle_dependencies()` may contains an outdated version of `staticcheck` so you should load `staticcheck_deps()` before `gazelle_dependencies()` in WORKSPACE to ensure that the supported version is in used.

Note that loading `staticcheck_deps()` is completely optional, advanced users may want to manage their own staticcheck dependencies separately in their WORKSPACE file.

3. Configure `nogo` target in a `BUILD` file

```
load("//nogo-analyzer/staticcheck:def.bzl", "staticcheck_analyzers")

STATICHECK_ANALYZERS = [
    "ST1000",
    "ST1001",
    "ST1003",
]

nogo(
    name = "nogo",
		deps = staticcheck_analyzers([STATICHECK_ANALYZERS]),
    visibility = ["//visibility:public"],
)
```

Note here that `staticcheck_analyzers` return a list which can be combined with other analyzers such as the default TOOLS_NOGO analyzers.

```
nogo(
    name = "nogo",
		deps = TOOLS_NOGO + staticcheck_analyzers([STATICHECK_ANALYZERS]),
    visibility = ["//visibility:public"],
)
```

4. Setup json config file.

User often do not want to run static analysis over external dependencies / packages by default.
Therefore, we provide [sample_config_json.txt](./sample_config_json.txt) with all `external` packages excluded from `nogo` checks by default. This file is not meant to be consumed directly, but for convenience copy-pasting.

Please refer to [nogo's documentation](https://github.com/bazelbuild/rules_go/blob/master/go/nogo.rst) for more information on how to setup json config file.
