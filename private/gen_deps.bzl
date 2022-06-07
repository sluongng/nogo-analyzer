load("//private:deps_test.bzl", "prune_ext_deps")

def generate_deps(
        name,
        mod_file,
        sum_file,
        targets,
        deps_file = "deps.bzl",
        gazelle_bin = "@bazel_gazelle//cmd/gazelle:gazelle",
        **kwargs):
    """generate_deps helps us generate deps.bzl files from go.mod and go.sum files

    It creates a fake bazel repository inside sandbox environment and then runs
    `gazelle update-repos` within that sandbox to create the file.

    Once thats done, we may apply some light editing before returing the file to the user.
    """
    _gen_file_name = name + "_deps.bzl"

    # We cannot use an un-exported file target directly from within genrule
    # so let's create an alias and use the alias instead.
    native.genrule(
        name = "gen_deps",
        outs = [_gen_file_name],
        cmd = """
            # Setup a mock bazel workspace
            touch WORKSPACE;
            cp $(rootpath {mod_file}) .;
            cp $(rootpath {sum_file}) .;

            # Gazelle depends on `go` binary to run various commands
            # to extract module informations.
            export GO="$$(readlink $(execpath //:gobin))"
            export PATH="$$(dirname $$GO):$$PATH"

            # Run gazelle
            $(execpath {gazelle}) update-repos -from_file=go.mod -to_macro=deps.bzl%{name} -prune
            
            # Clean up
            rm -f WORKSPACE go.mod go.sum

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
    copy_file_to_current_dir(
        name = "write_deps",
        from_target = _gen_file_name,
        to_file_name = deps_file,
    )
    native.exports_files([deps_file])
    prune_ext_deps(
        name = "test_deps",
        targets = targets,
        deps_file = deps_file,
        **kwargs
    )

def copy_file_to_current_dir(name, from_target, to_file_name):
    native.genrule(
        name = name,
        outs = ["cp_file_{}.sh".format(to_file_name)],
        cmd = """
        cat > $@ <<EOF
        #!/bin/bash -x

        (
            cd \\$$BUILD_WORKING_DIRECTORY || (echo 'could not find working directory' && exit 1)
            cp -f \\$$BUILD_WORKSPACE_DIRECTORY/$(execpath {from_target}) {to_file}
        )
        """.format(
            from_target = from_target,
            to_file = to_file_name,
        ),
        executable = True,
        tools = [from_target],
    )
