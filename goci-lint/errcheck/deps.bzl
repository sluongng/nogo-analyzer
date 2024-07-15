load("@com_github_sluongng_nogo_analyzer//private:def.bzl", go_repository = "maybe_go_repository")

def errcheck_deps():
    go_repository(
        name = "com_github_kisielk_errcheck",
        importpath = "github.com/kisielk/errcheck",
        sum = "h1:+SbscKmWJ5mOK/bO1zS60F5I9WwZDWOfRsC4RwfwRV0=",
        version = "v1.7.0",
    )
    go_repository(
        name = "org_golang_x_mod",
        importpath = "golang.org/x/mod",
        sum = "h1:fEdghXQSo20giMthA7cd28ZC+jts4amQ3YMXiP5oMQ8=",
        version = "v0.19.0",
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
