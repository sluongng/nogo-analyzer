load("@com_github_sluongng_nogo_analyzer//private:def.bzl", go_repository = "maybe_go_repository")

def gofmt_deps():
    go_repository(
        name = "com_github_golangci_gofmt",
        importpath = "github.com/golangci/gofmt",
        sum = "h1:QwSLkzFDgeU/VEFxdlXSGFyYpnOU6z3f9HhoaKxhuvY=",
        version = "v0.0.0-20240710011838-52c11c6007e5",
    )

    go_repository(
        name = "org_golang_x_sync",
        importpath = "golang.org/x/sync",
        sum = "h1:YsImfSBoP9QPYL0xyKJPq0gcaJdG3rInoqxTWbfQu9M=",
        version = "v0.7.0",
    )

    go_repository(
        name = "org_golang_x_tools",
        importpath = "golang.org/x/tools",
        sum = "h1:SGsXPZ+2l4JsgaCKkx+FQ9YZ5XEtA1GZYuoDjenLjvg=",
        version = "v0.23.0",
    )
