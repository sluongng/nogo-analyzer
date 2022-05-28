load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_gazelle//:deps.bzl", _go_repository = "go_repository")

def maybe_go_repository(**kwargs):
    maybe(
        _go_repository,
        **kwargs
    )
