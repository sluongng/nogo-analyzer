load("@com_github_sluongng_nogo_analyzer//private:def.bzl", go_repository = "maybe_go_repository")

def golangci_lint():
    go_repository(
        name = "co_honnef_go_tools",
        importpath = "honnef.co/go/tools",
        sum = "h1:9MDAWxMoSnB6QoSqiVr7P5mtkT9pOc1kSxchzPCnqJs=",
        version = "v0.4.7",
    )
    go_repository(
        name = "com_4d63_gocheckcompilerdirectives",
        importpath = "4d63.com/gocheckcompilerdirectives",
        sum = "h1:AHcMYuw56NPjq/2y615IGg2kYkBdTvOaojYCBcRE7MA=",
        version = "v1.2.1",
    )
    go_repository(
        name = "com_4d63_gochecknoglobals",
        importpath = "4d63.com/gochecknoglobals",
        sum = "h1:1eiorGsgHOFOuoOiJDy2psSrQbRdIHrlge0IJIkUgDc=",
        version = "v0.2.1",
    )

    go_repository(
        name = "com_github_alecthomas_go_check_sumtype",
        importpath = "github.com/alecthomas/go-check-sumtype",
        sum = "h1:WCvlB3l5Vq5dZQTFmodqL2g68uHiSwwlWcT5a2FGK0c=",
        version = "v0.1.4",
    )

    go_repository(
        name = "com_github_antonboom_errname",
        importpath = "github.com/Antonboom/errname",
        sum = "h1:JHICqsewj/fNckzrfVSe+T33svwQxmjC+1ntDsHOVvM=",
        version = "v0.1.13",
    )

    go_repository(
        name = "com_github_burntsushi_toml",
        importpath = "github.com/BurntSushi/toml",
        sum = "h1:kuoIxZQy2WRRk1pttg9asf+WVv6tWQuBNVmK8+nqPr0=",
        version = "v1.4.0",
    )

    go_repository(
        name = "com_github_butuzov_mirror",
        importpath = "github.com/butuzov/mirror",
        sum = "h1:9YVK1qIjNspaqWutSv8gsge2e/Xpq1eqEkslEUHy5cs=",
        version = "v1.2.0",
    )

    go_repository(
        name = "com_github_charithe_durationcheck",
        importpath = "github.com/charithe/durationcheck",
        sum = "h1:wgw73BiocdBDQPik+zcEoBG/ob8uyBHf2iyoHGPf5w4=",
        version = "v0.0.10",
    )

    go_repository(
        name = "com_github_ckaznocha_intrange",
        importpath = "github.com/ckaznocha/intrange",
        sum = "h1:3Y4JAxcMntgb/wABQ6e8Q8leMd26JbX2790lIss9MTI=",
        version = "v0.1.2",
    )

    go_repository(
        name = "com_github_crocmagnon_fatcontext",
        importpath = "github.com/Crocmagnon/fatcontext",
        sum = "h1:S6gNUYNSN9V76Tu017OFgoaOpybmMhwe6Ewh1cYd0jg=",
        version = "v0.3.0",
    )

    go_repository(
        name = "com_github_davecgh_go_spew",
        importpath = "github.com/davecgh/go-spew",
        sum = "h1:U9qPSI2PIWSS1VwoXQT9A3Wy9MM3WgvqSxFWenqJduM=",
        version = "v1.1.2-0.20180830191138-d8f796af33cc",
    )

    go_repository(
        name = "com_github_djarvur_go_err113",
        importpath = "github.com/Djarvur/go-err113",
        sum = "h1:sHglBQTwgx+rWPdisA5ynNEsoARbiCBOyGcJM4/OzsM=",
        version = "v0.0.0-20210108212216-aea10b59be24",
    )

    go_repository(
        name = "com_github_fatih_color",
        importpath = "github.com/fatih/color",
        sum = "h1:GlRw1BRJxkpqUCBKzKOw098ed57fEsKeNjpTe3cSjK4=",
        version = "v1.17.0",
    )

    go_repository(
        name = "com_github_fsnotify_fsnotify",
        importpath = "github.com/fsnotify/fsnotify",
        sum = "h1:8JEhPFa5W2WU7YfeZzPNqzMP6Lwt7L2715Ggo0nosvA=",
        version = "v1.7.0",
    )

    go_repository(
        name = "com_github_go_toolsmith_astcast",
        importpath = "github.com/go-toolsmith/astcast",
        sum = "h1:+JN9xZV1A+Re+95pgnMgDboWNVnIMMQXwfBwLRPgSC8=",
        version = "v1.1.0",
    )

    go_repository(
        name = "com_github_go_viper_mapstructure_v2",
        importpath = "github.com/go-viper/mapstructure/v2",
        sum = "h1:dhn8MZ1gZ0mzeodTG3jt5Vj/o87xZKuNAprG2mQfMfc=",
        version = "v2.0.0",
    )

    go_repository(
        name = "com_github_golangci_golangci_lint",
        importpath = "github.com/golangci/golangci-lint",
        sum = "h1:CRRLu1JbhK5avLABFJ/OHVSQ0Ie5c4ulsOId1h3TTks=",
        version = "v1.59.1",
    )

    go_repository(
        name = "com_github_gordonklaus_ineffassign",
        importpath = "github.com/gordonklaus/ineffassign",
        sum = "h1:y2Gd/9I7MdY1oEIt+n+rowjBNDcLQq3RsH5hwJd0f9s=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_gostaticanalysis_analysisutil",
        importpath = "github.com/gostaticanalysis/analysisutil",
        sum = "h1:ZMCjoue3DtDWQ5WyU16YbjbQEQ3VuzwxALrpYd+HeKk=",
        version = "v0.7.1",
    )
    go_repository(
        name = "com_github_gostaticanalysis_comment",
        importpath = "github.com/gostaticanalysis/comment",
        sum = "h1:hlnx5+S2fY9Zo9ePo4AhgYsYHbM2+eAv8m/s1JiCd6Q=",
        version = "v1.4.2",
    )
    go_repository(
        name = "com_github_gostaticanalysis_forcetypeassert",
        importpath = "github.com/gostaticanalysis/forcetypeassert",
        sum = "h1:6eUflI3DiGusXGK6X7cCcIgVCpZ2CiZ1Q7jl6ZxNV70=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_gostaticanalysis_nilerr",
        importpath = "github.com/gostaticanalysis/nilerr",
        sum = "h1:ThE+hJP0fEp4zWLkWHWcRyI2Od0p7DlgYG3Uqrmrcpk=",
        version = "v0.1.1",
    )

    go_repository(
        name = "com_github_hashicorp_go_version",
        importpath = "github.com/hashicorp/go-version",
        sum = "h1:5tqGy27NaOTB8yJKUZELlFAS/LTKJkrmONwQKeRZfjY=",
        version = "v1.7.0",
    )

    go_repository(
        name = "com_github_hashicorp_hcl",
        importpath = "github.com/hashicorp/hcl",
        sum = "h1:0Anlzjpi4vEasTeNFn2mLJgTSwt0+6sfsiTG8qcWGx4=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_jirfag_go_printf_func_name",
        importpath = "github.com/jirfag/go-printf-func-name",
        sum = "h1:KA9BjwUk7KlCh6S9EAGWBt1oExIUv9WyNCiRz5amv48=",
        version = "v0.0.0-20200119135958-7558a9eaa5af",
    )

    go_repository(
        name = "com_github_kkhaike_contextcheck",
        importpath = "github.com/kkHAIKE/contextcheck",
        sum = "h1:CdnJh63tcDe53vG+RebdpdXJTc9atMgGqdx8LXxiilg=",
        version = "v1.1.5",
    )

    go_repository(
        name = "com_github_kyoh86_exportloopref",
        importpath = "github.com/kyoh86/exportloopref",
        sum = "h1:1Z0bcmTypkL3Q4k+IDHMWTcnCliEZcaPiIe0/ymEyhQ=",
        version = "v0.1.11",
    )
    go_repository(
        name = "com_github_lasiar_canonicalheader",
        importpath = "github.com/lasiar/canonicalheader",
        sum = "h1:wC+dY9ZfiqiPwAexUApFush/csSPXeIi4QqyxXmng8I=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_ldez_gomoddirectives",
        importpath = "github.com/ldez/gomoddirectives",
        sum = "h1:j3YjBIjEBbqZ0NKtBNzr8rtMHTOrLPeiwTkfUJZ3alg=",
        version = "v0.2.4",
    )

    go_repository(
        name = "com_github_lufeee_execinquery",
        importpath = "github.com/lufeee/execinquery",
        sum = "h1:hf0Ems4SHcUGBxpGN7Jz78z1ppVkP/837ZlETPCEtOM=",
        version = "v1.2.1",
    )

    go_repository(
        name = "com_github_magiconair_properties",
        importpath = "github.com/magiconair/properties",
        sum = "h1:IeQXZAiQcpL9mgcAe1Nu6cX9LLw6ExEHKjN0VQdvPDY=",
        version = "v1.8.7",
    )
    go_repository(
        name = "com_github_maratori_testableexamples",
        importpath = "github.com/maratori/testableexamples",
        sum = "h1:dU5alXRrD8WKSjOUnmJZuzdxWOEQ57+7s93SLMxb2vI=",
        version = "v1.0.0",
    )

    go_repository(
        name = "com_github_mattn_go_colorable",
        importpath = "github.com/mattn/go-colorable",
        sum = "h1:fFA4WZxdEF4tXPZVKMLwD8oUnCTTo08duU7wxecdEvA=",
        version = "v0.1.13",
    )
    go_repository(
        name = "com_github_mattn_go_isatty",
        importpath = "github.com/mattn/go-isatty",
        sum = "h1:xfD0iDuEKnDkl03q4limB+vH+GxLEtL/jb4xVJSWWEY=",
        version = "v0.0.20",
    )

    go_repository(
        name = "com_github_mitchellh_go_homedir",
        importpath = "github.com/mitchellh/go-homedir",
        sum = "h1:lukF9ziXFxDFPkA1vsr5zpc1XuPDn/wFntq5mG+4E0Y=",
        version = "v1.1.0",
    )

    go_repository(
        name = "com_github_mitchellh_mapstructure",
        importpath = "github.com/mitchellh/mapstructure",
        sum = "h1:jeMsZIYE/09sWLaz43PL7Gy6RuMjD2eJVyuac5Z2hdY=",
        version = "v1.5.0",
    )

    go_repository(
        name = "com_github_moricho_tparallel",
        importpath = "github.com/moricho/tparallel",
        sum = "h1:odr8aZVFA3NZrNybggMkYO3rgPRcqjeQUlBBFVxKHTI=",
        version = "v0.3.2",
    )

    go_repository(
        name = "com_github_pelletier_go_toml_v2",
        importpath = "github.com/pelletier/go-toml/v2",
        sum = "h1:aYUidT7k73Pcl9nb2gScu7NSrKCSHIDE89b3+6Wq+LM=",
        version = "v2.2.2",
    )

    go_repository(
        name = "com_github_pmezard_go_difflib",
        importpath = "github.com/pmezard/go-difflib",
        sum = "h1:Jamvg5psRIccs7FGNTlIRMkT8wgtp5eCXdBlqhYGL6U=",
        version = "v1.0.1-0.20181226105442-5d4384ee4fb2",
    )

    go_repository(
        name = "com_github_ryanrolds_sqlclosecheck",
        importpath = "github.com/ryanrolds/sqlclosecheck",
        sum = "h1:dibWW826u0P8jNLsLN+En7+RqWWTYrjCB9fJfSfdyCU=",
        version = "v0.5.1",
    )

    go_repository(
        name = "com_github_sagikazarmark_slog_shim",
        importpath = "github.com/sagikazarmark/slog-shim",
        sum = "h1:diDBnUNK9N/354PgrxMywXnAwEr1QZcOr6gto+ugjYE=",
        version = "v0.1.0",
    )

    go_repository(
        name = "com_github_sirupsen_logrus",
        importpath = "github.com/sirupsen/logrus",
        sum = "h1:dueUQJ1C2q9oE3F7wvmSGAaVtTmUizReu6fjN8uqzbQ=",
        version = "v1.9.3",
    )
    go_repository(
        name = "com_github_sivchari_containedctx",
        importpath = "github.com/sivchari/containedctx",
        sum = "h1:x+etemjbsh2fB5ewm5FeLNi5bUjK0V8n0RB+Wwfd0XE=",
        version = "v1.0.3",
    )

    go_repository(
        name = "com_github_sonatard_noctx",
        importpath = "github.com/sonatard/noctx",
        sum = "h1:L7Dz4De2zDQhW8S0t+KUjY0MAQJd6SgVwhzNIc4ok00=",
        version = "v0.0.2",
    )

    go_repository(
        name = "com_github_sourcegraph_go_diff",
        importpath = "github.com/sourcegraph/go-diff",
        sum = "h1:9uLlrd5T46OXs5qpp8L/MTltk0zikUGi0sNNyCpA8G0=",
        version = "v0.7.0",
    )
    go_repository(
        name = "com_github_spf13_afero",
        importpath = "github.com/spf13/afero",
        sum = "h1:WJQKhtpdm3v2IzqG8VMqrr6Rf3UYpEF239Jy9wNepM8=",
        version = "v1.11.0",
    )
    go_repository(
        name = "com_github_spf13_cast",
        importpath = "github.com/spf13/cast",
        sum = "h1:GEiTHELF+vaR5dhz3VqZfFSzZjYbgeKDpBxQVS4GYJ0=",
        version = "v1.6.0",
    )

    go_repository(
        name = "com_github_spf13_pflag",
        importpath = "github.com/spf13/pflag",
        sum = "h1:iy+VFUOCP1a+8yFto/drg2CJ5u0yRoB7fZw3DKv/JXA=",
        version = "v1.0.5",
    )
    go_repository(
        name = "com_github_spf13_viper",
        importpath = "github.com/spf13/viper",
        sum = "h1:RWq5SEjt8o25SROyN3z2OrDB9l7RPd3lwTWU8EcEdcI=",
        version = "v1.19.0",
    )

    go_repository(
        name = "com_github_stbenjam_no_sprintf_host_port",
        importpath = "github.com/stbenjam/no-sprintf-host-port",
        sum = "h1:tYugd/yrm1O0dV+ThCbaKZh195Dfm07ysF0U6JQXczc=",
        version = "v0.1.1",
    )
    go_repository(
        name = "com_github_stretchr_objx",
        importpath = "github.com/stretchr/objx",
        sum = "h1:xuMeJ0Sdp5ZMRXx/aWO6RZxdr3beISkG5/G/aIRr3pY=",
        version = "v0.5.2",
    )
    go_repository(
        name = "com_github_stretchr_testify",
        importpath = "github.com/stretchr/testify",
        sum = "h1:HtqpIVDClZ4nwg75+f6Lvsy/wHu+3BoSGCbBAcpTsTg=",
        version = "v1.9.0",
    )
    go_repository(
        name = "com_github_subosito_gotenv",
        importpath = "github.com/subosito/gotenv",
        sum = "h1:9NlTDc1FTs4qu0DDq7AEtTPNw6SVm7uBMsUCUjABIf8=",
        version = "v1.6.0",
    )

    go_repository(
        name = "com_github_tdakkota_asciicheck",
        importpath = "github.com/tdakkota/asciicheck",
        sum = "h1:o8jvnUANo0qXtnslk2d3nMKTFNlOnJjRrNcj0j9qkHM=",
        version = "v0.2.0",
    )

    go_repository(
        name = "com_github_timakin_bodyclose",
        importpath = "github.com/timakin/bodyclose",
        sum = "h1:A6uKudFIfAEpoPdaal3aSqGxBzLyU8TqyXImLwo6dIo=",
        version = "v0.0.0-20240125160201-f835fa56326a",
    )

    go_repository(
        name = "com_github_ykadowak_zerologlint",
        importpath = "github.com/ykadowak/zerologlint",
        sum = "h1:Gy/fMz1dFQN9JZTPjv1hxEk+sRWm05row04Yoolgdiw=",
        version = "v0.1.5",
    )

    go_repository(
        name = "in_gopkg_ini_v1",
        importpath = "gopkg.in/ini.v1",
        sum = "h1:Dgnx+6+nfE+IfzjUEISNeydPJh9AXNNsWbGP9KzCsOA=",
        version = "v1.67.0",
    )

    go_repository(
        name = "in_gopkg_yaml_v3",
        importpath = "gopkg.in/yaml.v3",
        sum = "h1:fxVm/GzAzEWqLHuvctI91KS9hhNmmWOoWu0XTYJS7CA=",
        version = "v3.0.1",
    )

    go_repository(
        name = "org_golang_x_exp",
        importpath = "golang.org/x/exp",
        sum = "h1:uLDX+AfeFCct3a2C7uIWBKMJIR3CJMhcgfrUAqjRK6w=",
        version = "v0.0.0-20240707233637-46b078467d37",
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
        name = "org_golang_x_sys",
        importpath = "golang.org/x/sys",
        sum = "h1:RI27ohtqKCnwULzJLqkv897zojh5/DwS/ENaMzUOaWI=",
        version = "v0.22.0",
    )

    go_repository(
        name = "org_golang_x_text",
        importpath = "golang.org/x/text",
        sum = "h1:a94ExnEXNtEwYLGJSIUxnWoxoRz/ZcCsV63ROupILh4=",
        version = "v0.16.0",
    )

    go_repository(
        name = "org_golang_x_tools",
        importpath = "golang.org/x/tools",
        sum = "h1:SGsXPZ+2l4JsgaCKkx+FQ9YZ5XEtA1GZYuoDjenLjvg=",
        version = "v0.23.0",
    )
