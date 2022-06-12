load("@bazel_skylib//rules:write_file.bzl", "write_file")

def nogo_config(name, out, analyzers, override = {}, default = {
    "exclude_files": {
        # Don't run linters on external dependencies
        "external/": "third_party",
    },
}):
    """
    nogo_config is a handy function that creates the nogo config json file programmatically from starlark

    This meant to provide a sane default config file.
    By feeding this a list of analyzers in used, all the external dependencies will be excluded from running nogo.

    For more advance usages, you should consider creating similar helper macro for your own repository.
    For more information, check rules_go's nogo documentation.

    Example usage:

        nogo_config(
            name = "nogo_config",
            out = "nogo_config.json",
            analyzers = ["ABC1001", "ABC1002"],
            override = {
                "ABC1002": {
                    "exclude_files": {
                        "external/": "third_party",
                        "proto/": "generated protobuf",
                    },
                },
            },
        )

        The json would be generated from this would look like this:

        {
            "ABC1001": {
                "exclude_files": {
                    "external/": "third_party"
                }
            },
            "ABC1002": {
                "exclude_files": {
                    "external/": "third_party",
                    "proto/": "generated protobuf"
                }
            }
        }

        And you can use said configuration like this:

        nogo(
            name = "nogo",
            config = ":nogo_config.json",
            visibility = ["//visibility:public"],
            deps = nogo_vet_deps(),
        )
    """
    write_file(
        name = name,
        out = out,
        content = [
            json.encode_indent({
                analyzer: override.get(analyzer, default)
                for analyzer in analyzers
            }),
        ],
    )
