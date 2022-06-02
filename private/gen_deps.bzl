def generate_deps(
        name,
        mod_file,
        sum_file,
        gazelle_bin = "@bazel_gazelle//cmd/gazelle:gazelle",
        **kwargs):
    """generate_deps helps us generate deps.bzl files from go.mod and go.sum files

    It creates a fake bazel repository inside sandbox environment and then runs
    `gazelle update-repos` within that sandbox to create the file.

    Once thats done, we may apply some light editing before returing the file to the user.
    """

    # We cannot use an un-exported file target directly from within genrule
    # so let's create an alias and use the alias instead.
    native.genrule(
        name = name + "_gen_deps",
        outs = [
            name + "_deps.bzl",
        ],
        cmd = """
            # Setup a mock bazel workspace
            touch WORKSPACE;
            cp $(rootpath {mod_file}) .;
            cp $(rootpath {sum_file}) .;

            # Gazelle depends on `go` binary to run various commands
            # to extract module informations.
            export GOROOT="$$(readlink $(execpath //:gobin))/../../"

            # Run gazelle
            $(execpath {gazelle}) update-repos -from_file=go.mod -to_macro=deps.bzl%{name} -prune

            # Replace default load line with ours
            echo 'load("@com_github_sluongng_nogo_analyzer//private:def.bzl", go_repository = "maybe_go_repository")' > $@
            tail -n +2 deps.bzl >> $@
        """.format(
            gazelle = gazelle_bin,
            mod_file = mod_file,
            name = name,
            sum_file = sum_file,
        ),
        tools = [
            "//:gobin",
            gazelle_bin,
            mod_file,
            sum_file,
        ],
        **kwargs
    )
    # TODO: combine this with private/deps_test.bzl some how
