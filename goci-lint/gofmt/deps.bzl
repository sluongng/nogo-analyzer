load("@com_github_sluongng_nogo_analyzer//private:def.bzl", go_repository = "maybe_go_repository")

def gofmt_deps():
    go_repository(
        name = "com_github_golangci_gofmt",
        build_external = "external",
        importpath = "github.com/golangci/gofmt",
        sum = "h1:iR3fYXUjHCR97qWS8ch1y9zPNsgXThGwjKPrYfqMPks=",
        version = "v0.0.0-20190930125516-244bba706f1a",
    )
    go_repository(
        name = "org_golang_x_tools",
        build_external = "external",
        importpath = "golang.org/x/tools",
        sum = "h1:OKYpQQVE3DKSc3r3zHVzq46vq5YH7x8xpR3/k9ixmUg=",
        version = "v0.1.11-0.20220513221640-090b14e8501f",
    )
