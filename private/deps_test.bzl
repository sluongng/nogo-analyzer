load("@bazel_skylib//rules:diff_test.bzl", "diff_test")

def prune_ext_deps(name, targets, deps_file, size = "small", **kwargs):
    # Query for go_library that targets depend on
    native.genquery(
        name = name + "_deps",
        expression = """
            kind(
                go_library,
                deps(set(
                    {}
                ))
            )
        """.format(" ".join(targets)),
        testonly = True,
        scope = targets,
        **kwargs
    )

    # Filter query's result for unique list of external go_repository targets
    native.genrule(
        name = name + "_ext_deps",
        outs = [
            name + "_needed_ext_deps.txt",
        ],
        cmd = """
            grep '^@' $(location :{}_deps) |
                sed 's|//.*||; s/@@//' |
                sort |
                uniq > $@
        """.format(name),
        testonly = True,
        tools = [name + "_deps"],
        **kwargs
    )

    # Analyze deps_file
    native.genrule(
        name = name + "_current_ext_deps",
        outs = [
            name + "_current_ext_deps.txt",
        ],
        cmd = """
            # Assuming that name is right after go_repository
            grep -A1 'go_repository' $(location {}) |
                grep 'name =' |
                sed 's/.*name = "//; s/",//' |
                sort |
                uniq > $@
        """.format(deps_file),
        testonly = True,
        tools = [deps_file],
        **kwargs
    )

    # Compare result from bazel query with current deps.bzl file
    diff_test(
        name = name,
        size = size,
        failure_message = """
            {} contains unused go_repository targets
        """.format(deps_file),
        file1 = name + "_needed_ext_deps.txt",
        file2 = name + "_current_ext_deps.txt",
        **kwargs
    )

    # TODO: create a genrule that extract the diff content, then use
    # tree-sitter to automatically remove all the go_repository which
    # match the diff lines.
