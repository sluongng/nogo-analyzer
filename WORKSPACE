workspace(name = "com_github_sluongng_nogo_analyzer")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "d93ef02f1e72c82d8bb3d5169519b36167b33cf68c252525e3b9d3d5dd143de7",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.49.0/rules_go-v0.49.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.49.0/rules_go-v0.49.0.zip",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "d76bf7a60fd8b050444090dfa2837a4eaf9829e1165618ee35dceca5cbdf58d5",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.37.0/bazel-gazelle-v0.37.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.37.0/bazel-gazelle-v0.37.0.tar.gz",
    ],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "0ae3651eb955922d6ec829f4f97e7054855ed36f1e13cbe7e600a2868dcded77",
    strip_prefix = "protobuf-4.25.0",
    urls = [
        "https://github.com/protocolbuffers/protobuf/archive/v4.25.0.tar.gz",
    ],
)

http_archive(
    name = "bazel_features",
    sha256 = "cec7fbc7bce6597cf2e83e01ddd9328a1bb057dc1a3092745238f49d3301ab5a",
    strip_prefix = "bazel_features-1.12.0",
    url = "https://github.com/bazel-contrib/bazel_features/releases/download/v1.12.0/bazel_features-v1.12.0.tar.gz",
)

load("@bazel_features//:deps.bzl", "bazel_features_deps")

bazel_features_deps()

http_archive(
    name = "rules_proto",
    sha256 = "303e86e722a520f6f326a50b41cfc16b98fe6d1955ce46642a5b7a67c11c0f5d",
    strip_prefix = "rules_proto-6.0.0",
    url = "https://github.com/bazelbuild/rules_proto/releases/download/6.0.0/rules_proto-6.0.0.tar.gz",
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "42968f9134ba2c75c03bb271bd7bb062afb7da449f9b913c96e5be4ce890030a",
    strip_prefix = "buildtools-6.3.3",
    urls = [
        "https://github.com/bazelbuild/buildtools/archive/refs/tags/v6.3.3.tar.gz",
    ],
)

load("//private:deps.bzl", "nogo_analyzer_deps")

# gazelle:repository_macro private/deps.bzl%nogo_analyzer_deps
nogo_analyzer_deps()

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.22.5")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()
