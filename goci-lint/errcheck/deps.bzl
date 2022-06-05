load("@com_github_sluongng_nogo_analyzer//private:def.bzl", go_repository = "maybe_go_repository")

def errcheck_deps():
    go_repository(
        name = "com_github_kisielk_errcheck",
        build_external = "external",
        importpath = "github.com/kisielk/errcheck",
        sum = "h1:cErYo+J4SmEjdXZrVXGwLJCE2sB06s23LpkcyWNrT+s=",
        version = "v1.6.1",
    )
    go_repository(
        name = "org_golang_x_mod",
        build_external = "external",
        importpath = "golang.org/x/mod",
        sum = "h1:6zppjxzCulZykYSLyVDYbneBfbaBIQPYMevg0bEwv2s=",
        version = "v0.6.0-dev.0.20220419223038-86c51ed26bb4",
    )
    go_repository(
        name = "org_golang_x_sys",
        build_external = "external",
        importpath = "golang.org/x/sys",
        sum = "h1:xHms4gcpe1YE7A3yIllJXP16CMAGuqwO2lX1mTyyRRc=",
        version = "v0.0.0-20220422013727-9388b58f7150",
    )
    go_repository(
        name = "org_golang_x_tools",
        build_external = "external",
        importpath = "golang.org/x/tools",
        sum = "h1:OKYpQQVE3DKSc3r3zHVzq46vq5YH7x8xpR3/k9ixmUg=",
        version = "v0.1.11-0.20220513221640-090b14e8501f",
    )
