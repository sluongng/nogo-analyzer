workspace(name = "com_github_sluongng_nogo_analyzer")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "685052b498b6ddfe562ca7a97736741d87916fe536623afb7da2824c0211c369",
    urls = [
        "https://github.com/bazelbuild/rules_go/releases/download/v0.33.0/rules_go-v0.33.0.zip",
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.33.0/rules_go-v0.33.0.zip",
    ],
)

http_archive(
    name = "bazel_gazelle",
    patch_args = ["-p1"],
    patches = [
        "@com_github_sluongng_nogo_analyzer//third-party:gazelle-revert-bazel-tools-patch.patch",
    ],
    sha256 = "9f7296636d7a2ddf88edb96f1807d2599922dec412ee892d452097d16f664878",
    strip_prefix = "bazel-gazelle-55d692e6cb1ec5e44ef102939145a18e1ccc6017",
    urls = [
        "https://github.com/bazelbuild/bazel-gazelle/archive/55d692e6cb1ec5e44ef102939145a18e1ccc6017.zip",
    ],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "8b28fdd45bab62d15db232ec404248901842e5340299a57765e48abe8a80d930",
    strip_prefix = "protobuf-3.20.1",
    urls = [
        "https://github.com/protocolbuffers/protobuf/archive/v3.20.1.tar.gz",
    ],
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "e3bb0dc8b0274ea1aca75f1f8c0c835adbe589708ea89bf698069d0790701ea3",
    strip_prefix = "buildtools-5.1.0",
    urls = [
        "https://github.com/bazelbuild/buildtools/archive/refs/tags/5.1.0.tar.gz",
    ],
)

load("//private:deps.bzl", "nogo_analyzer_deps")

# gazelle:repository_macro private/deps.bzl%nogo_analyzer_deps
nogo_analyzer_deps()

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.18.3")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()
