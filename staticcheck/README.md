# staticcheck analyzers

This package is provided as an opt-in part of rules_go.

Projects who have the need to use staticcheck analyzers as part of rules_go's nogo framework may use this package to enable the checks over existing code base.

## How to use

1. Please refer to the **nogo** documentation in https://github.com/bazelbuild/rules_go/blob/master/go/nogo.rst to learn the basic setup.


2. Load staticcheck dependencies in your WORKSPACE.

```
load("@com_github_sluongng_nogo_analyzer//staticcheck:deps.bzl", "staticcheck_deps")

staticcheck_deps()
```

**NOTE**: Make sure you load `staticcheck_deps()` before `gazelle_dependencies()`, as well as any other rules that use `go_repository`, because this can lead to dependency conflicts.

**NOTE**: Loading `staticcheck_deps()` is optional, advanced users may want to manage their own staticcheck dependencies separately in their WORKSPACE file. As long as all the dependencies inside `//staticcheck:deps.bzl` is loaded in your workspace with a compatible version to the dependencies in this repo, then things should continue to work.

> How do I verify which version of staticcheck I have in my workspace?

You can run this query and validate which version bazel is using.

```
> bazel query '//external:co_honnef_go_tools' --output=build
go_repository(
  name = "co_honnef_go_tools",
  generator_name = "co_honnef_go_tools",
  generator_function = "nogo_analyzer_deps",
  importpath = "honnef.co/go/tools",
  version = "vX.Y.Z",
  sum = "h1:abcdxyzw",
)
```

3. Configure `nogo` target in a `BUILD` file

```
load("@com_github_sluongng_nogo_analyzer//staticcheck:def.bzl", "staticcheck_analyzers")

STATICHECK_ANALYZERS = [
    "ST1000",
    "ST1001",
    "ST1003",
]

nogo(
    name = "nogo",
    deps = staticcheck_analyzers(STATICHECK_ANALYZERS),
    visibility = ["//visibility:public"],
)
```

Note here that `staticcheck_analyzers` return a list which can be combined with other analyzers such as the default TOOLS_NOGO analyzers.

```
nogo(
    name = "nogo",
    deps = TOOLS_NOGO + staticcheck_analyzers(STATICHECK_ANALYZERS),
    visibility = ["//visibility:public"],
)
```

4. Setup json config file.

Please refer to [nogo's documentation](https://github.com/bazelbuild/rules_go/blob/master/go/nogo.rst) for more information on how to setup json config file.

In [def.bzl](../def.bzl) we provide a helper function that would help you generate the json config file programmatically
using starlark.  The `external/` regex is excluded by default as that included all the external dependencies.
