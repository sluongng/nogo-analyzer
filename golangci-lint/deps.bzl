load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@com_github_sluongng_nogo_analyzer//private:def.bzl", go_repository = "maybe_go_repository")

def golangci_lint_deps():
    maybe(
        http_archive,
        name = "com_google_protobuf",
        sha256 = "8b28fdd45bab62d15db232ec404248901842e5340299a57765e48abe8a80d930",
        strip_prefix = "protobuf-3.20.1",
        urls = [
            "https://github.com/protocolbuffers/protobuf/archive/v3.20.1.tar.gz",
        ],
    )
    _golangci_lint_deps()

def _golangci_lint_deps():
    go_repository(
        name = "com_github_go_toolsmith_astcast",
        build_external = "external",
        importpath = "github.com/go-toolsmith/astcast",
        sum = "h1:JojxlmI6STnFVG9yOImLeGREv8W2ocNUM+iOhR6jE7g=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_go_toolsmith_astcopy",
        build_external = "external",
        importpath = "github.com/go-toolsmith/astcopy",
        sum = "h1:OMgl1b1MEpjFQ1m5ztEO06rz5CUd3oBv9RF7+DyvdG8=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_go_toolsmith_astequal",
        build_external = "external",
        importpath = "github.com/go-toolsmith/astequal",
        sum = "h1:JbSszi42Jiqu36Gnf363HWS9MTEAz67vTQLponh3Moc=",
        version = "v1.0.1",
    )
    go_repository(
        name = "com_github_go_toolsmith_astfmt",
        build_external = "external",
        importpath = "github.com/go-toolsmith/astfmt",
        sum = "h1:A0vDDXt+vsvLEdbMFJAUBI/uTbRw1ffOPnxsILnFL6k=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_go_toolsmith_astp",
        build_external = "external",
        importpath = "github.com/go-toolsmith/astp",
        sum = "h1:alXE75TXgcmupDsMK1fRAy0YUzLzqPVvBKoyWV+KPXg=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_go_toolsmith_astcopy",
        build_external = "external",
        importpath = "github.com/go-toolsmith/astcopy",
        sum = "h1:OMgl1b1MEpjFQ1m5ztEO06rz5CUd3oBv9RF7+DyvdG8=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_go_toolsmith_astequal",
        build_external = "external",
        importpath = "github.com/go-toolsmith/astequal",
        sum = "h1:JbSszi42Jiqu36Gnf363HWS9MTEAz67vTQLponh3Moc=",
        version = "v1.0.1",
    )
    go_repository(
        name = "com_github_go_toolsmith_astfmt",
        build_external = "external",
        importpath = "github.com/go-toolsmith/astfmt",
        sum = "h1:A0vDDXt+vsvLEdbMFJAUBI/uTbRw1ffOPnxsILnFL6k=",
        version = "v1.0.0",
    )
    go_repository(
        name = "cc_mvdan_gofumpt",
        build_external = "external",
        importpath = "mvdan.cc/gofumpt",
        sum = "h1:avhhrOmv0IuvQVK7fvwV91oFSGAk5/6Po8GXTzICeu8=",
        version = "v0.3.1",
    )
    go_repository(
        name = "cc_mvdan_interfacer",
        build_external = "external",
        importpath = "mvdan.cc/interfacer",
        sum = "h1:WX1yoOaKQfddO/mLzdV4wptyWgoH/6hwLs7QHTixo0I=",
        version = "v0.0.0-20180901003855-c20040233aed",
    )
    go_repository(
        name = "cc_mvdan_lint",
        build_external = "external",
        importpath = "mvdan.cc/lint",
        sum = "h1:DxJ5nJdkhDlLok9K6qO+5290kphDJbHOQO1DFFFTeBo=",
        version = "v0.0.0-20170908181259-adc824a0674b",
    )
    go_repository(
        name = "cc_mvdan_unparam",
        build_external = "external",
        importpath = "mvdan.cc/unparam",
        sum = "h1:Jh3LAeMt1eGpxomyu3jVkmVZWW2MxZ1qIIV2TZ/nRio=",
        version = "v0.0.0-20211214103731-d0ef000c54e5",
    )
    go_repository(
        name = "co_honnef_go_tools",
        build_external = "external",
        importpath = "honnef.co/go/tools",
        sum = "h1:ytYb4rOqyp1TSa2EPvNVwtPQJctSELKaMyLfqNP4+34=",
        version = "v0.3.2",
    )
    go_repository(
        name = "com_4d63_gochecknoglobals",
        build_external = "external",
        importpath = "4d63.com/gochecknoglobals",
        sum = "h1:zeZSRqj5yCg28tCkIV/z/lWbwvNm5qnKVS15PI8nhD0=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_alexkohler_prealloc",
        build_external = "external",
        importpath = "github.com/alexkohler/prealloc",
        sum = "h1:Hbq0/3fJPQhNkN0dR95AVrr6R7tou91y0uHG5pOcUuw=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_antonboom_errname",
        build_external = "external",
        importpath = "github.com/Antonboom/errname",
        sum = "h1:LzIJZlyLOCSu51o3/t2n9Ck7PcoP9wdbrdaW6J8fX24=",
        version = "v0.1.6",
    )
    go_repository(
        name = "com_github_antonboom_nilnil",
        build_external = "external",
        importpath = "github.com/Antonboom/nilnil",
        sum = "h1:PHhrh5ANKFWRBh7TdYmyyq2gyT2lotnvFvvFbylF81Q=",
        version = "v0.1.1",
    )
    go_repository(
        name = "com_github_ashanbrown_forbidigo",
        build_external = "external",
        importpath = "github.com/ashanbrown/forbidigo",
        sum = "h1:VkYIwb/xxdireGAdJNZoo24O4lmnEWkactplBlWTShc=",
        version = "v1.3.0",
    )
    go_repository(
        name = "com_github_ashanbrown_makezero",
        build_external = "external",
        importpath = "github.com/ashanbrown/makezero",
        sum = "h1:iCQ87C0V0vSyO+M9E/FZYbu65auqH0lnsOkf5FcB28s=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_beorn7_perks",
        build_external = "external",
        importpath = "github.com/beorn7/perks",
        sum = "h1:VlbKKnNfV8bJzeqoa4cOKqO6bYr3WgKZxO8Z16+hsOM=",
        version = "v1.0.1",
    )
    go_repository(
        name = "com_github_bkielbasa_cyclop",
        build_external = "external",
        importpath = "github.com/bkielbasa/cyclop",
        sum = "h1:7Jmnh0yL2DjKfw28p86YTd/B4lRGcNuu12sKE35sM7A=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_blizzy78_varnamelen",
        build_external = "external",
        importpath = "github.com/blizzy78/varnamelen",
        sum = "h1:oqSblyuQvFsW1hbBHh1zfwrKe3kcSj0rnXkKzsQ089M=",
        version = "v0.8.0",
    )
    go_repository(
        name = "com_github_bombsimon_wsl_v3",
        build_external = "external",
        importpath = "github.com/bombsimon/wsl/v3",
        sum = "h1:Mka/+kRLoQJq7g2rggtgQsjuI/K5Efd87WX96EWFxjM=",
        version = "v3.3.0",
    )
    go_repository(
        name = "com_github_breml_bidichk",
        build_external = "external",
        importpath = "github.com/breml/bidichk",
        sum = "h1:qe6ggxpTfA8E75hdjWPZ581sY3a2lnl0IRxLQFelECI=",
        version = "v0.2.3",
    )
    go_repository(
        name = "com_github_breml_errchkjson",
        build_external = "external",
        importpath = "github.com/breml/errchkjson",
        sum = "h1:YdDqhfqMT+I1vIxPSas44P+9Z9HzJwCeAzjB8PxP1xw=",
        version = "v0.3.0",
    )
    go_repository(
        name = "com_github_burntsushi_toml",
        build_external = "external",
        importpath = "github.com/BurntSushi/toml",
        sum = "h1:ksErzDEI1khOiGPgpwuI7x2ebx/uXQNw7xJpn9Eq1+I=",
        version = "v1.1.0",
    )
    go_repository(
        name = "com_github_butuzov_ireturn",
        build_external = "external",
        importpath = "github.com/butuzov/ireturn",
        sum = "h1:QvrO2QF2+/Cx1WA/vETCIYBKtRjc30vesdoPUNo1EbY=",
        version = "v0.1.1",
    )
    go_repository(
        name = "com_github_cespare_xxhash_v2",
        build_external = "external",
        importpath = "github.com/cespare/xxhash/v2",
        sum = "h1:YRXhKfTDauu4ajMg1TPgFO5jnlC2HCbmLXMcTG5cbYE=",
        version = "v2.1.2",
    )
    go_repository(
        name = "com_github_charithe_durationcheck",
        build_external = "external",
        importpath = "github.com/charithe/durationcheck",
        sum = "h1:mPP4ucLrf/rKZiIG/a9IPXHGlh8p4CzgpyTy6EEutYk=",
        version = "v0.0.9",
    )
    go_repository(
        name = "com_github_chavacava_garif",
        build_external = "external",
        importpath = "github.com/chavacava/garif",
        sum = "h1:tFXjAxje9thrTF4h57Ckik+scJjTWdwAtZqZPtOT48M=",
        version = "v0.0.0-20220316182200-5cad0b5181d4",
    )
    go_repository(
        name = "com_github_daixiang0_gci",
        build_external = "external",
        importpath = "github.com/daixiang0/gci",
        sum = "h1:55xJKH7Gl9Vk6oQ1cMkwrDWjAkT1D+D1G9kNmRcAIY4=",
        version = "v0.3.3",
    )
    go_repository(
        name = "com_github_davecgh_go_spew",
        build_external = "external",
        importpath = "github.com/davecgh/go-spew",
        sum = "h1:vj9j/u1bqnvCEfJOwUhtlOARqs3+rkHYY13jYWTU97c=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_denis_tingaikin_go_header",
        build_external = "external",
        importpath = "github.com/denis-tingaikin/go-header",
        sum = "h1:tEaZKAlqql6SKCY++utLmkPLd6K8IBM20Ha7UVm+mtU=",
        version = "v0.4.3",
    )
    go_repository(
        name = "com_github_djarvur_go_err113",
        build_external = "external",
        importpath = "github.com/Djarvur/go-err113",
        sum = "h1:sHglBQTwgx+rWPdisA5ynNEsoARbiCBOyGcJM4/OzsM=",
        version = "v0.0.0-20210108212216-aea10b59be24",
    )
    go_repository(
        name = "com_github_esimonov_ifshort",
        build_external = "external",
        importpath = "github.com/esimonov/ifshort",
        sum = "h1:6SID4yGWfRae/M7hkVDVVyppy8q/v9OuxNdmjLQStBA=",
        version = "v1.0.4",
    )
    go_repository(
        name = "com_github_ettle_strcase",
        build_external = "external",
        importpath = "github.com/ettle/strcase",
        sum = "h1:htFueZyVeE1XNnMEfbqp5r67qAN/4r6ya1ysq8Q+Zcw=",
        version = "v0.1.1",
    )
    go_repository(
        name = "com_github_fatih_color",
        build_external = "external",
        importpath = "github.com/fatih/color",
        sum = "h1:8LOYc1KYPPmyKMuN8QV2DNRWNbLo6LZ0iLs8+mlH53w=",
        version = "v1.13.0",
    )
    go_repository(
        name = "com_github_fatih_structtag",
        build_external = "external",
        importpath = "github.com/fatih/structtag",
        sum = "h1:/OdNE99OxoI/PqaW/SuSK9uxxT3f/tcSZgon/ssNSx4=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_firefart_nonamedreturns",
        build_external = "external",
        importpath = "github.com/firefart/nonamedreturns",
        sum = "h1:fSvcq6ZpK/uBAgJEGMvzErlzyM4NELLqqdTofVjVNag=",
        version = "v1.0.1",
    )
    go_repository(
        name = "com_github_fsnotify_fsnotify",
        build_external = "external",
        importpath = "github.com/fsnotify/fsnotify",
        sum = "h1:jRbGcIw6P2Meqdwuo0H1p6JVLbL5DHKAKlYndzMwVZI=",
        version = "v1.5.4",
    )
    go_repository(
        name = "com_github_fzipp_gocyclo",
        build_external = "external",
        importpath = "github.com/fzipp/gocyclo",
        sum = "h1:L66amyuYogbxl0j2U+vGqJXusPF2IkduvXLnYD5TFgw=",
        version = "v0.5.1",
    )
    go_repository(
        name = "com_github_gaijinentertainment_go_exhaustruct_v2",
        build_external = "external",
        importpath = "github.com/GaijinEntertainment/go-exhaustruct/v2",
        sum = "h1:LAPPhJ4KR5Z8aKVZF5S48csJkxL5RMKmE/98fMs1u5M=",
        version = "v2.1.0",
    )
    go_repository(
        name = "com_github_go_critic_go_critic",
        build_external = "external",
        importpath = "github.com/go-critic/go-critic",
        sum = "h1:abibh5XYBTASawfTQ0rA7dVtQT+6KzpGqb/J+DxRDaw=",
        version = "v0.6.3",
    )
    go_repository(
        name = "com_github_go_toolsmith_strparse",
        build_external = "external",
        importpath = "github.com/go-toolsmith/strparse",
        sum = "h1:Vcw78DnpCAKlM20kSbAyO4mPfJn/lyYA4BJUDxe2Jb4=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_go_toolsmith_typep",
        build_external = "external",
        importpath = "github.com/go-toolsmith/typep",
        sum = "h1:8xdsa1+FSIH/RhEkgnD1j2CJOy5mNllW1Q9tRiYwvlk=",
        version = "v1.0.2",
    )
    go_repository(
        name = "com_github_go_xmlfmt_xmlfmt",
        build_external = "external",
        importpath = "github.com/go-xmlfmt/xmlfmt",
        sum = "h1:khEcpUM4yFcxg4/FHQWkvVRmgijNXRfzkIDHh23ggEo=",
        version = "v0.0.0-20191208150333-d5b6f63a941b",
    )
    go_repository(
        name = "com_github_gobwas_glob",
        build_external = "external",
        importpath = "github.com/gobwas/glob",
        sum = "h1:A4xDbljILXROh+kObIiy5kIaPYD8e96x1tgBhUI5J+Y=",
        version = "v0.2.3",
    )
    go_repository(
        name = "com_github_golang_protobuf",
        build_external = "external",
        importpath = "github.com/golang/protobuf",
        sum = "h1:ROPKBNFfQgOUMifHyP+KYbvpjbdoFNs+aK7DXlji0Tw=",
        version = "v1.5.2",
    )
    go_repository(
        name = "com_github_golangci_check",
        build_external = "external",
        importpath = "github.com/golangci/check",
        sum = "h1:23T5iq8rbUYlhpt5DB4XJkc6BU31uODLD1o1gKvZmD0=",
        version = "v0.0.0-20180506172741-cfe4005ccda2",
    )
    go_repository(
        name = "com_github_golangci_dupl",
        build_external = "external",
        importpath = "github.com/golangci/dupl",
        sum = "h1:w8hkcTqaFpzKqonE9uMCefW1WDie15eSP/4MssdenaM=",
        version = "v0.0.0-20180902072040-3e9179ac440a",
    )
    go_repository(
        name = "com_github_golangci_go_misc",
        build_external = "external",
        importpath = "github.com/golangci/go-misc",
        sum = "h1:6RGUuS7EGotKx6J5HIP8ZtyMdiDscjMLfRBSPuzVVeo=",
        version = "v0.0.0-20220329215616-d24fe342adfe",
    )
    go_repository(
        name = "com_github_golangci_gofmt",
        build_external = "external",
        importpath = "github.com/golangci/gofmt",
        sum = "h1:iR3fYXUjHCR97qWS8ch1y9zPNsgXThGwjKPrYfqMPks=",
        version = "v0.0.0-20190930125516-244bba706f1a",
    )
    go_repository(
        name = "com_github_golangci_golangci_lint",
        build_external = "external",
        importpath = "github.com/golangci/golangci-lint",
        patch_args = ["-p1"],  #keep
        patches = [
            "@com_github_sluongng_nogo_analyzer//golangci-lint/patch:001_export_source.patch",
            "@com_github_sluongng_nogo_analyzer//golangci-lint/patch:002_export_getter.patch",
        ],  #keep
        sum = "h1:sc3XD0pprdZuqZkl6snUfnmUT1XW4dTTyLeOBvxn+3M=",
        version = "v1.46.1",
    )
    go_repository(
        name = "com_github_golangci_lint_1",
        build_external = "external",
        importpath = "github.com/golangci/lint-1",
        sum = "h1:MfyDlzVjl1hoaPzPD4Gpb/QgoRfSBR0jdhwGyAWwMSA=",
        version = "v0.0.0-20191013205115-297bf364a8e0",
    )
    go_repository(
        name = "com_github_golangci_maligned",
        build_external = "external",
        importpath = "github.com/golangci/maligned",
        sum = "h1:kNY3/svz5T29MYHubXix4aDDuE3RWHkPvopM/EDv/MA=",
        version = "v0.0.0-20180506175553-b1d89398deca",
    )
    go_repository(
        name = "com_github_golangci_misspell",
        build_external = "external",
        importpath = "github.com/golangci/misspell",
        sum = "h1:pLzmVdl3VxTOncgzHcvLOKirdvcx/TydsClUQXTehjo=",
        version = "v0.3.5",
    )
    go_repository(
        name = "com_github_golangci_unconvert",
        build_external = "external",
        importpath = "github.com/golangci/unconvert",
        sum = "h1:zwtduBRr5SSWhqsYNgcuWO2kFlpdOZbP0+yRjmvPGys=",
        version = "v0.0.0-20180507085042-28b1c447d1f4",
    )
    go_repository(
        name = "com_github_google_go_cmp",
        build_external = "external",
        importpath = "github.com/google/go-cmp",
        sum = "h1:81/ik6ipDQS2aGcBfIN5dHDB36BwrStyeAQquSYCV4o=",
        version = "v0.5.7",
    )
    go_repository(
        name = "com_github_gordonklaus_ineffassign",
        build_external = "external",
        importpath = "github.com/gordonklaus/ineffassign",
        sum = "h1:PVRE9d4AQKmbelZ7emNig1+NT27DUmKZn5qXxfio54U=",
        version = "v0.0.0-20210914165742-4cc7213b9bc8",
    )
    go_repository(
        name = "com_github_gostaticanalysis_analysisutil",
        build_external = "external",
        importpath = "github.com/gostaticanalysis/analysisutil",
        sum = "h1:ZMCjoue3DtDWQ5WyU16YbjbQEQ3VuzwxALrpYd+HeKk=",
        version = "v0.7.1",
    )
    go_repository(
        name = "com_github_gostaticanalysis_comment",
        build_external = "external",
        importpath = "github.com/gostaticanalysis/comment",
        sum = "h1:hlnx5+S2fY9Zo9ePo4AhgYsYHbM2+eAv8m/s1JiCd6Q=",
        version = "v1.4.2",
    )
    go_repository(
        name = "com_github_gostaticanalysis_forcetypeassert",
        build_external = "external",
        importpath = "github.com/gostaticanalysis/forcetypeassert",
        sum = "h1:6eUflI3DiGusXGK6X7cCcIgVCpZ2CiZ1Q7jl6ZxNV70=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_gostaticanalysis_nilerr",
        build_external = "external",
        importpath = "github.com/gostaticanalysis/nilerr",
        sum = "h1:ThE+hJP0fEp4zWLkWHWcRyI2Od0p7DlgYG3Uqrmrcpk=",
        version = "v0.1.1",
    )
    go_repository(
        name = "com_github_hashicorp_errwrap",
        build_external = "external",
        importpath = "github.com/hashicorp/errwrap",
        sum = "h1:hLrqtEDnRye3+sgx6z4qVLNuviH3MR5aQ0ykNJa/UYA=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_hashicorp_go_multierror",
        build_external = "external",
        importpath = "github.com/hashicorp/go-multierror",
        sum = "h1:H5DkEtf6CXdFp0N0Em5UCwQpXMWke8IA0+lD48awMYo=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_hashicorp_go_version",
        build_external = "external",
        importpath = "github.com/hashicorp/go-version",
        sum = "h1:aAQzgqIrRKRa7w75CKpbBxYsmUoPjzVm1W59ca1L0J4=",
        version = "v1.4.0",
    )
    go_repository(
        name = "com_github_hashicorp_hcl",
        build_external = "external",
        importpath = "github.com/hashicorp/hcl",
        sum = "h1:0Anlzjpi4vEasTeNFn2mLJgTSwt0+6sfsiTG8qcWGx4=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_hexops_gotextdiff",
        build_external = "external",
        importpath = "github.com/hexops/gotextdiff",
        sum = "h1:gitA9+qJrrTCsiCl7+kh75nPqQt1cx4ZkudSTLoUqJM=",
        version = "v1.0.3",
    )
    go_repository(
        name = "com_github_jgautheron_goconst",
        build_external = "external",
        importpath = "github.com/jgautheron/goconst",
        sum = "h1:HxVbL1MhydKs8R8n/HE5NPvzfaYmQJA3o879lE4+WcM=",
        version = "v1.5.1",
    )
    go_repository(
        name = "com_github_jingyugao_rowserrcheck",
        build_external = "external",
        importpath = "github.com/jingyugao/rowserrcheck",
        sum = "h1:zibz55j/MJtLsjP1OF4bSdgXxwL1b+Vn7Tjzq7gFzUs=",
        version = "v1.1.1",
    )
    go_repository(
        name = "com_github_jirfag_go_printf_func_name",
        build_external = "external",
        importpath = "github.com/jirfag/go-printf-func-name",
        sum = "h1:KA9BjwUk7KlCh6S9EAGWBt1oExIUv9WyNCiRz5amv48=",
        version = "v0.0.0-20200119135958-7558a9eaa5af",
    )
    go_repository(
        name = "com_github_julz_importas",
        build_external = "external",
        importpath = "github.com/julz/importas",
        sum = "h1:F78HnrsjY3cR7j0etXy5+TU1Zuy7Xt08X/1aJnH5xXY=",
        version = "v0.1.0",
    )
    go_repository(
        name = "com_github_kisielk_errcheck",
        build_external = "external",
        importpath = "github.com/kisielk/errcheck",
        sum = "h1:cErYo+J4SmEjdXZrVXGwLJCE2sB06s23LpkcyWNrT+s=",
        version = "v1.6.1",
    )
    go_repository(
        name = "com_github_kisielk_gotool",
        build_external = "external",
        importpath = "github.com/kisielk/gotool",
        sum = "h1:AV2c/EiW3KqPNT9ZKl07ehoAGi4C5/01Cfbblndcapg=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_kulti_thelper",
        build_external = "external",
        importpath = "github.com/kulti/thelper",
        sum = "h1:K4xulKkwOCnT1CDms6Ex3uG1dvSMUUQe9zxgYQgbRXs=",
        version = "v0.6.2",
    )
    go_repository(
        name = "com_github_kunwardeep_paralleltest",
        build_external = "external",
        importpath = "github.com/kunwardeep/paralleltest",
        sum = "h1:UdKIkImEAXjR1chUWLn+PNXqWUGs//7tzMeWuP7NhmI=",
        version = "v1.0.3",
    )
    go_repository(
        name = "com_github_kyoh86_exportloopref",
        build_external = "external",
        importpath = "github.com/kyoh86/exportloopref",
        sum = "h1:5Ry/at+eFdkX9Vsdw3qU4YkvGtzuVfzT4X7S77LoN/M=",
        version = "v0.1.8",
    )
    go_repository(
        name = "com_github_ldez_gomoddirectives",
        build_external = "external",
        importpath = "github.com/ldez/gomoddirectives",
        sum = "h1:y7MBaisZVDYmKvt9/l1mjNCiSA1BVn34U0ObUcJwlhA=",
        version = "v0.2.3",
    )
    go_repository(
        name = "com_github_ldez_tagliatelle",
        build_external = "external",
        importpath = "github.com/ldez/tagliatelle",
        sum = "h1:3BqVVlReVUZwafJUwQ+oxbx2BEX2vUG4Yu/NOfMiKiM=",
        version = "v0.3.1",
    )
    go_repository(
        name = "com_github_leonklingele_grouper",
        build_external = "external",
        importpath = "github.com/leonklingele/grouper",
        sum = "h1:tC2y/ygPbMFSBOs3DcyaEMKnnwH7eYKzohOtRrf0SAg=",
        version = "v1.1.0",
    )
    go_repository(
        name = "com_github_lufeee_execinquery",
        build_external = "external",
        importpath = "github.com/lufeee/execinquery",
        sum = "h1:07LBuxOFCLoNXUuwnRxL1T+ef8rI0gYZRBe2yh9BflU=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_magiconair_properties",
        build_external = "external",
        importpath = "github.com/magiconair/properties",
        sum = "h1:5ibWZ6iY0NctNGWo87LalDlEZ6R41TqbbDamhfG/Qzo=",
        version = "v1.8.6",
    )
    go_repository(
        name = "com_github_maratori_testpackage",
        build_external = "external",
        importpath = "github.com/maratori/testpackage",
        sum = "h1:QtJ5ZjqapShm0w5DosRjg0PRlSdAdlx+W6cCKoALdbQ=",
        version = "v1.0.1",
    )
    go_repository(
        name = "com_github_masterminds_semver",
        build_external = "external",
        importpath = "github.com/Masterminds/semver",
        sum = "h1:H65muMkzWKEuNDnfl9d70GUjFniHKHRbFPGBuZ3QEww=",
        version = "v1.5.0",
    )
    go_repository(
        name = "com_github_matoous_godox",
        build_external = "external",
        importpath = "github.com/matoous/godox",
        sum = "h1:pWxk9e//NbPwfxat7RXkts09K+dEBJWakUWwICVqYbA=",
        version = "v0.0.0-20210227103229-6504466cf951",
    )
    go_repository(
        name = "com_github_mattn_go_colorable",
        build_external = "external",
        importpath = "github.com/mattn/go-colorable",
        sum = "h1:jF+Du6AlPIjs2BiUiQlKOX0rt3SujHxPnksPKZbaA40=",
        version = "v0.1.12",
    )
    go_repository(
        name = "com_github_mattn_go_isatty",
        build_external = "external",
        importpath = "github.com/mattn/go-isatty",
        sum = "h1:yVuAays6BHfxijgZPzw+3Zlu5yQgKGP2/hcQbHb7S9Y=",
        version = "v0.0.14",
    )
    go_repository(
        name = "com_github_mattn_go_runewidth",
        build_external = "external",
        importpath = "github.com/mattn/go-runewidth",
        sum = "h1:Lm995f3rfxdpd6TSmuVCHVb/QhupuXlYr8sCI/QdE+0=",
        version = "v0.0.9",
    )
    go_repository(
        name = "com_github_matttproud_golang_protobuf_extensions",
        build_external = "external",
        importpath = "github.com/matttproud/golang_protobuf_extensions",
        sum = "h1:4hp9jkHxhMHkqkrB3Ix0jegS5sx/RkqARlsWZ6pIwiU=",
        version = "v1.0.1",
    )
    go_repository(
        name = "com_github_mbilski_exhaustivestruct",
        build_external = "external",
        importpath = "github.com/mbilski/exhaustivestruct",
        sum = "h1:wCBmUnSYufAHO6J4AVWY6ff+oxWxsVFrwgOdMUQePUo=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_mgechev_revive",
        build_external = "external",
        importpath = "github.com/mgechev/revive",
        sum = "h1:GjFml7ZsoR0IrQ2E2YIvWFNS5GPDV7xNwvA5GM1HZC4=",
        version = "v1.2.1",
    )
    go_repository(
        name = "com_github_mitchellh_go_homedir",
        build_external = "external",
        importpath = "github.com/mitchellh/go-homedir",
        sum = "h1:lukF9ziXFxDFPkA1vsr5zpc1XuPDn/wFntq5mG+4E0Y=",
        version = "v1.1.0",
    )
    go_repository(
        name = "com_github_mitchellh_mapstructure",
        build_external = "external",
        importpath = "github.com/mitchellh/mapstructure",
        sum = "h1:jeMsZIYE/09sWLaz43PL7Gy6RuMjD2eJVyuac5Z2hdY=",
        version = "v1.5.0",
    )
    go_repository(
        name = "com_github_moricho_tparallel",
        build_external = "external",
        importpath = "github.com/moricho/tparallel",
        sum = "h1:95FytivzT6rYzdJLdtfn6m1bfFJylOJK41+lgv/EHf4=",
        version = "v0.2.1",
    )
    go_repository(
        name = "com_github_nakabonne_nestif",
        build_external = "external",
        importpath = "github.com/nakabonne/nestif",
        sum = "h1:wm28nZjhQY5HyYPx+weN3Q65k6ilSBxDb8v5S81B81U=",
        version = "v0.3.1",
    )
    go_repository(
        name = "com_github_nbutton23_zxcvbn_go",
        build_external = "external",
        importpath = "github.com/nbutton23/zxcvbn-go",
        sum = "h1:4kuARK6Y6FxaNu/BnU2OAaLF86eTVhP2hjTB6iMvItA=",
        version = "v0.0.0-20210217022336-fa2cb2858354",
    )
    go_repository(
        name = "com_github_nishanths_exhaustive",
        build_external = "external",
        importpath = "github.com/nishanths/exhaustive",
        sum = "h1:xV/WU3Vdwh5BUH4N06JNUznb6d5zhRPOnlgCrpNYNKA=",
        version = "v0.7.11",
    )
    go_repository(
        name = "com_github_nishanths_predeclared",
        build_external = "external",
        importpath = "github.com/nishanths/predeclared",
        sum = "h1:V2EPdZPliZymNAn79T8RkNApBjMmVKh5XRpLm/w98Vk=",
        version = "v0.2.2",
    )
    go_repository(
        name = "com_github_olekukonko_tablewriter",
        build_external = "external",
        importpath = "github.com/olekukonko/tablewriter",
        sum = "h1:P2Ga83D34wi1o9J6Wh1mRuqd4mF/x/lgBS7N7AbDhec=",
        version = "v0.0.5",
    )
    go_repository(
        name = "com_github_openpeedeep_depguard",
        build_external = "external",
        importpath = "github.com/OpenPeeDeeP/depguard",
        sum = "h1:pjK9nLPS1FwQYGGpPxoMYpe7qACHOhAWQMQzV71i49o=",
        version = "v1.1.0",
    )
    go_repository(
        name = "com_github_pelletier_go_toml",
        build_external = "external",
        importpath = "github.com/pelletier/go-toml",
        sum = "h1:4yBQzkHv+7BHq2PQUZF3Mx0IYxG7LsP222s7Agd3ve8=",
        version = "v1.9.5",
    )
    go_repository(
        name = "com_github_phayes_checkstyle",
        build_external = "external",
        importpath = "github.com/phayes/checkstyle",
        sum = "h1:CdDQnGF8Nq9ocOS/xlSptM1N3BbrA6/kmaep5ggwaIA=",
        version = "v0.0.0-20170904204023-bfd46e6a821d",
    )
    go_repository(
        name = "com_github_pkg_errors",
        build_external = "external",
        importpath = "github.com/pkg/errors",
        sum = "h1:FEBLx1zS214owpjy7qsBeixbURkuhQAwrK5UwLGTwt4=",
        version = "v0.9.1",
    )
    go_repository(
        name = "com_github_pmezard_go_difflib",
        build_external = "external",
        importpath = "github.com/pmezard/go-difflib",
        sum = "h1:4DBwDE0NGyQoBHbLQYPwSUPoCMWR5BEzIk/f1lZbAQM=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_polyfloyd_go_errorlint",
        build_external = "external",
        importpath = "github.com/polyfloyd/go-errorlint",
        sum = "h1:/BDyEJWLnDUYKGWdlNx/82qSaVu2bUok/EvPUtIGuvw=",
        version = "v0.0.0-20211125173453-6d6d39c5bb8b",
    )
    go_repository(
        name = "com_github_prometheus_client_golang",
        build_external = "external",
        importpath = "github.com/prometheus/client_golang",
        sum = "h1:ZiaPsmm9uiBeaSMRznKsCDNtPCS0T3JVDGF+06gjBzk=",
        version = "v1.12.1",
    )
    go_repository(
        name = "com_github_prometheus_client_model",
        build_external = "external",
        importpath = "github.com/prometheus/client_model",
        sum = "h1:uq5h0d+GuxiXLJLNABMgp2qUWDPiLvgCzz2dUR+/W/M=",
        version = "v0.2.0",
    )
    go_repository(
        name = "com_github_prometheus_common",
        build_external = "external",
        importpath = "github.com/prometheus/common",
        sum = "h1:hWIdL3N2HoUx3B8j3YN9mWor0qhY/NlEKZEaXxuIRh4=",
        version = "v0.32.1",
    )
    go_repository(
        name = "com_github_prometheus_procfs",
        build_external = "external",
        importpath = "github.com/prometheus/procfs",
        sum = "h1:4jVXhlkAyzOScmCkXBTOLRLTz8EeU+eyjrwB/EPq0VU=",
        version = "v0.7.3",
    )
    go_repository(
        name = "com_github_quasilyte_go_ruleguard",
        build_external = "external",
        importpath = "github.com/quasilyte/go-ruleguard",
        sum = "h1:sWFavxtIctGrVs5SYZ5Ml1CvrDAs8Kf5kx2PI3C41dA=",
        version = "v0.3.16-0.20220213074421-6aa060fab41a",
    )
    go_repository(
        name = "com_github_quasilyte_gogrep",
        build_external = "external",
        importpath = "github.com/quasilyte/gogrep",
        sum = "h1:PDWGei+Rf2bBiuZIbZmM20J2ftEy9IeUCHA8HbQqed8=",
        version = "v0.0.0-20220120141003-628d8b3623b5",
    )
    go_repository(
        name = "com_github_quasilyte_regex_syntax",
        build_external = "external",
        importpath = "github.com/quasilyte/regex/syntax",
        sum = "h1:L8QM9bvf68pVdQ3bCFZMDmnt9yqcMBro1pC7F+IPYMY=",
        version = "v0.0.0-20200407221936-30656e2c4a95",
    )
    go_repository(
        name = "com_github_quasilyte_stdinfo",
        build_external = "external",
        importpath = "github.com/quasilyte/stdinfo",
        sum = "h1:M8mH9eK4OUR4lu7Gd+PU1fV2/qnDNfzT635KRSObncs=",
        version = "v0.0.0-20220114132959-f7386bf02567",
    )
    go_repository(
        name = "com_github_ryancurrah_gomodguard",
        build_external = "external",
        importpath = "github.com/ryancurrah/gomodguard",
        sum = "h1:ww2fsjqocGCAFamzvv/b8IsRduuHHeK2MHTcTxZTQX8=",
        version = "v1.2.3",
    )
    go_repository(
        name = "com_github_ryanrolds_sqlclosecheck",
        build_external = "external",
        importpath = "github.com/ryanrolds/sqlclosecheck",
        sum = "h1:AZx+Bixh8zdUBxUA1NxbxVAS78vTPq4rCb8OUZI9xFw=",
        version = "v0.3.0",
    )
    go_repository(
        name = "com_github_sanposhiho_wastedassign_v2",
        build_external = "external",
        importpath = "github.com/sanposhiho/wastedassign/v2",
        sum = "h1:+6/hQIHKNJAUixEj6EmOngGIisyeI+T3335lYTyxRoA=",
        version = "v2.0.6",
    )
    go_repository(
        name = "com_github_securego_gosec_v2",
        build_external = "external",
        importpath = "github.com/securego/gosec/v2",
        sum = "h1:+PDkpzR41OI2jrw1q6AdXZCbsNGNGT7pQjal0H0cArI=",
        version = "v2.11.0",
    )
    go_repository(
        name = "com_github_shazow_go_diff",
        build_external = "external",
        importpath = "github.com/shazow/go-diff",
        sum = "h1:W65qqJCIOVP4jpqPQ0YvHYKwcMEMVWIzWC5iNQQfBTU=",
        version = "v0.0.0-20160112020656-b6b7b6733b8c",
    )
    go_repository(
        name = "com_github_sirupsen_logrus",
        build_external = "external",
        importpath = "github.com/sirupsen/logrus",
        sum = "h1:dJKuHgqk1NNQlqoA6BTlM1Wf9DOH3NBjQyu0h9+AZZE=",
        version = "v1.8.1",
    )
    go_repository(
        name = "com_github_sivchari_containedctx",
        build_external = "external",
        importpath = "github.com/sivchari/containedctx",
        sum = "h1:0hLQKpgC53OVF1VT7CeoFHk9YKstur1XOgfYIc1yrHI=",
        version = "v1.0.2",
    )
    go_repository(
        name = "com_github_sivchari_tenv",
        build_external = "external",
        importpath = "github.com/sivchari/tenv",
        sum = "h1:wxW0mFpKI6DIb3s6m1jCDYvkWXCskrimXMuGd0K/kSQ=",
        version = "v1.5.0",
    )
    go_repository(
        name = "com_github_sonatard_noctx",
        build_external = "external",
        importpath = "github.com/sonatard/noctx",
        sum = "h1:VC1Qhl6Oxx9vvWo3UDgrGXYCeKCe3Wbw7qAWL6FrmTY=",
        version = "v0.0.1",
    )
    go_repository(
        name = "com_github_sourcegraph_go_diff",
        build_external = "external",
        importpath = "github.com/sourcegraph/go-diff",
        sum = "h1:hmA1LzxW0n1c3Q4YbrFgg4P99GSnebYa3x8gr0HZqLQ=",
        version = "v0.6.1",
    )
    go_repository(
        name = "com_github_spf13_afero",
        build_external = "external",
        importpath = "github.com/spf13/afero",
        sum = "h1:xehSyVa0YnHWsJ49JFljMpg1HX19V6NDZ1fkm1Xznbo=",
        version = "v1.8.2",
    )
    go_repository(
        name = "com_github_spf13_cast",
        build_external = "external",
        importpath = "github.com/spf13/cast",
        sum = "h1:s0hze+J0196ZfEMTs80N7UlFt0BDuQ7Q+JDnHiMWKdA=",
        version = "v1.4.1",
    )
    go_repository(
        name = "com_github_spf13_jwalterweatherman",
        build_external = "external",
        importpath = "github.com/spf13/jwalterweatherman",
        sum = "h1:ue6voC5bR5F8YxI5S67j9i582FU4Qvo2bmqnqMYADFk=",
        version = "v1.1.0",
    )
    go_repository(
        name = "com_github_spf13_pflag",
        build_external = "external",
        importpath = "github.com/spf13/pflag",
        sum = "h1:iy+VFUOCP1a+8yFto/drg2CJ5u0yRoB7fZw3DKv/JXA=",
        version = "v1.0.5",
    )
    go_repository(
        name = "com_github_spf13_viper",
        build_external = "external",
        importpath = "github.com/spf13/viper",
        sum = "h1:7OX/1FS6n7jHD1zGrZTM7WtY13ZELRyosK4k93oPr44=",
        version = "v1.11.0",
    )
    go_repository(
        name = "com_github_ssgreg_nlreturn_v2",
        build_external = "external",
        importpath = "github.com/ssgreg/nlreturn/v2",
        sum = "h1:X4XDI7jstt3ySqGU86YGAURbxw3oTDPK9sPEi6YEwQ0=",
        version = "v2.2.1",
    )
    go_repository(
        name = "com_github_stbenjam_no_sprintf_host_port",
        build_external = "external",
        importpath = "github.com/stbenjam/no-sprintf-host-port",
        sum = "h1:tYugd/yrm1O0dV+ThCbaKZh195Dfm07ysF0U6JQXczc=",
        version = "v0.1.1",
    )
    go_repository(
        name = "com_github_stretchr_objx",
        build_external = "external",
        importpath = "github.com/stretchr/objx",
        sum = "h1:2vfRuCMp5sSVIDSqO8oNnWJq7mPa6KVP3iPIwFBuy8A=",
        version = "v0.1.1",
    )
    go_repository(
        name = "com_github_stretchr_testify",
        build_external = "external",
        importpath = "github.com/stretchr/testify",
        sum = "h1:5TQK59W5E3v0r2duFAb7P95B6hEeOyEnHRa8MjYSMTY=",
        version = "v1.7.1",
    )
    go_repository(
        name = "com_github_subosito_gotenv",
        build_external = "external",
        importpath = "github.com/subosito/gotenv",
        sum = "h1:Slr1R9HxAlEKefgq5jn9U+DnETlIUa6HfgEzj0g5d7s=",
        version = "v1.2.0",
    )
    go_repository(
        name = "com_github_sylvia7788_contextcheck",
        build_external = "external",
        importpath = "github.com/sylvia7788/contextcheck",
        sum = "h1:MsiVqROAdr0efZc/fOCt0c235qm9XJqHtWwM+2h2B04=",
        version = "v1.0.4",
    )
    go_repository(
        name = "com_github_tdakkota_asciicheck",
        build_external = "external",
        importpath = "github.com/tdakkota/asciicheck",
        sum = "h1:PKzG7JUTUmVspQTDqtkX9eSiLGossXTybutHwTXuO0A=",
        version = "v0.1.1",
    )
    go_repository(
        name = "com_github_tetafro_godot",
        build_external = "external",
        importpath = "github.com/tetafro/godot",
        sum = "h1:BVoBIqAf/2QdbFmSwAWnaIqDivZdOV0ZRwEm6jivLKw=",
        version = "v1.4.11",
    )
    go_repository(
        name = "com_github_timakin_bodyclose",
        build_external = "external",
        importpath = "github.com/timakin/bodyclose",
        sum = "h1:kl4KhGNsJIbDHS9/4U9yQo1UcPQM0kOMJHn29EoH/Ro=",
        version = "v0.0.0-20210704033933-f49887972144",
    )
    go_repository(
        name = "com_github_tomarrell_wrapcheck_v2",
        build_external = "external",
        importpath = "github.com/tomarrell/wrapcheck/v2",
        sum = "h1:Cf4a/iwuMp9s7kKrh74GTgijRVim0wEpKjgAsT7Wctw=",
        version = "v2.6.1",
    )
    go_repository(
        name = "com_github_tommy_muehle_go_mnd_v2",
        build_external = "external",
        importpath = "github.com/tommy-muehle/go-mnd/v2",
        sum = "h1:iAj0a8e6+dXSL7Liq0aXPox36FiN1dBbjA6lt9fl65s=",
        version = "v2.5.0",
    )
    go_repository(
        name = "com_github_ultraware_funlen",
        build_external = "external",
        importpath = "github.com/ultraware/funlen",
        sum = "h1:5ylVWm8wsNwH5aWo9438pwvsK0QiqVuUrt9bn7S/iLA=",
        version = "v0.0.3",
    )
    go_repository(
        name = "com_github_ultraware_whitespace",
        build_external = "external",
        importpath = "github.com/ultraware/whitespace",
        sum = "h1:hh+/cpIcopyMYbZNVov9iSxvJU3OYQg78Sfaqzi/CzI=",
        version = "v0.0.5",
    )
    go_repository(
        name = "com_github_uudashr_gocognit",
        build_external = "external",
        importpath = "github.com/uudashr/gocognit",
        sum = "h1:rrSex7oHr3/pPLQ0xoWq108XMU8s678FJcQ+aSfOHa4=",
        version = "v1.0.5",
    )
    go_repository(
        name = "com_github_yagipy_maintidx",
        build_external = "external",
        importpath = "github.com/yagipy/maintidx",
        sum = "h1:h5NvIsCz+nRDapQ0exNv4aJ0yXSI0420omVANTv3GJM=",
        version = "v1.0.0",
    )
    go_repository(
        name = "com_github_yeya24_promlinter",
        build_external = "external",
        importpath = "github.com/yeya24/promlinter",
        sum = "h1:xFKDQ82orCU5jQujdaD8stOHiv8UN68BSdn2a8u8Y3o=",
        version = "v0.2.0",
    )
    go_repository(
        name = "com_gitlab_bosi_decorder",
        build_external = "external",
        importpath = "gitlab.com/bosi/decorder",
        sum = "h1:ehqZe8hI4w7O4b1vgsDZw1YU1PE7iJXrQWFMsocbQ1w=",
        version = "v0.2.1",
    )
    go_repository(
        name = "in_gopkg_ini_v1",
        build_external = "external",
        importpath = "gopkg.in/ini.v1",
        sum = "h1:SsAcf+mM7mRZo2nJNGt8mZCjG8ZRaNGMURJw7BsIST4=",
        version = "v1.66.4",
    )
    go_repository(
        name = "in_gopkg_yaml_v2",
        build_external = "external",
        importpath = "gopkg.in/yaml.v2",
        sum = "h1:D8xgwECY7CYvx+Y2n4sBz93Jn9JRvxdiyyo8CTfuKaY=",
        version = "v2.4.0",
    )
    go_repository(
        name = "in_gopkg_yaml_v3",
        build_external = "external",
        importpath = "gopkg.in/yaml.v3",
        sum = "h1:h8qDotaEPuJATrMmW04NCwg7v22aHH28wwpauUhK9Oo=",
        version = "v3.0.0-20210107192922-496545a6307b",
    )
    go_repository(
        name = "org_golang_google_protobuf",
        build_external = "external",
        importpath = "google.golang.org/protobuf",
        sum = "h1:w43yiav+6bVFTBQFZX0r7ipe9JQ1QsbMgHwbBziscLw=",
        version = "v1.28.0",
    )
    go_repository(
        name = "org_golang_x_exp_typeparams",
        build_external = "external",
        importpath = "golang.org/x/exp/typeparams",
        sum = "h1:qyrTQ++p1afMkO4DPEeLGq/3oTsdlvdH4vqZUBWzUKM=",
        version = "v0.0.0-20220218215828-6cf2b201936e",
    )
    go_repository(
        name = "org_golang_x_mod",
        build_external = "external",
        importpath = "golang.org/x/mod",
        sum = "h1:6zppjxzCulZykYSLyVDYbneBfbaBIQPYMevg0bEwv2s=",
        version = "v0.6.0-dev.0.20220419223038-86c51ed26bb4",
    )
    go_repository(
        name = "org_golang_x_sync",
        build_external = "external",
        importpath = "golang.org/x/sync",
        sum = "h1:5KslGYwFpkhGh+Q16bwMP3cOontH8FOep7tGV86Y7SQ=",
        version = "v0.0.0-20210220032951-036812b2e83c",
    )
    go_repository(
        name = "org_golang_x_sys",
        build_external = "external",
        importpath = "golang.org/x/sys",
        sum = "h1:xHms4gcpe1YE7A3yIllJXP16CMAGuqwO2lX1mTyyRRc=",
        version = "v0.0.0-20220422013727-9388b58f7150",
    )
    go_repository(
        name = "org_golang_x_text",
        build_external = "external",
        importpath = "golang.org/x/text",
        sum = "h1:olpwvP2KacW1ZWvsR7uQhoyTYvKAupfQrRGBFM352Gk=",
        version = "v0.3.7",
    )
    go_repository(
        name = "org_golang_x_tools",
        build_external = "external",
        importpath = "golang.org/x/tools",
        sum = "h1:OKYpQQVE3DKSc3r3zHVzq46vq5YH7x8xpR3/k9ixmUg=",
        version = "v0.1.11-0.20220513221640-090b14e8501f",
    )
