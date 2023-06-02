load("@com_github_sluongng_nogo_analyzer//private:def.bzl", go_repository = "maybe_go_repository")

def staticcheck():
    go_repository(
        name = "co_honnef_go_tools",
        importpath = "honnef.co/go/tools",
        sum = "h1:o/n5/K5gXqk8Gozvs2cnL0F2S1/g1vcGCAx2vETjITw=",
        version = "v0.4.3",
    )
    go_repository(
        name = "com_github_burntsushi_toml",
        importpath = "github.com/BurntSushi/toml",
        sum = "h1:9F2/+DoOYIOksmaJFPw1tGFy1eDnIJXg+UHjuD8lTak=",
        version = "v1.2.1",
    )
    go_repository(
        name = "org_golang_x_exp_typeparams",
        importpath = "golang.org/x/exp/typeparams",
        sum = "h1:Jw5wfR+h9mnIYH+OtGT2im5wV1YGGDora5vTv/aa5bE=",
        version = "v0.0.0-20221208152030-732eee02a75a",
    )
    go_repository(
        name = "org_golang_x_mod",
        importpath = "golang.org/x/mod",
        sum = "h1:LapD9S96VoQRhi/GrNTqeBJFrUjs5UHCAtTlgwA5oZA=",
        version = "v0.7.0",
    )
    go_repository(
        name = "org_golang_x_sys",
        importpath = "golang.org/x/sys",
        sum = "h1:w8ZOecv6NaNa/zC8944JTU3vz4u6Lagfk4RPQxv92NQ=",
        version = "v0.3.0",
    )
    go_repository(
        name = "org_golang_x_tools",
        importpath = "golang.org/x/tools",
        sum = "h1:9ZNWAi4CYhNv60mXGgAncgq7SGc5qa7C8VZV8Tg7Ggs=",
        version = "v0.4.1-0.20221208213631-3f74d914ae6d",
    )
