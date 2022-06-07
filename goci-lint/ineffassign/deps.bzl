load("@com_github_sluongng_nogo_analyzer//private:def.bzl", go_repository = "maybe_go_repository")

def ineffassign_deps():
    go_repository(
        name = "com_github_gordonklaus_ineffassign",
        importpath = "github.com/gordonklaus/ineffassign",
        sum = "h1:PVRE9d4AQKmbelZ7emNig1+NT27DUmKZn5qXxfio54U=",
        version = "v0.0.0-20210914165742-4cc7213b9bc8",
    )
    go_repository(
        name = "org_golang_x_tools",
        importpath = "golang.org/x/tools",
        sum = "h1:OKYpQQVE3DKSc3r3zHVzq46vq5YH7x8xpR3/k9ixmUg=",
        version = "v0.1.11-0.20220513221640-090b14e8501f",
    )
