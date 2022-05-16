#!/bin/bash

GOBIN=$1

(
    cd $BUILD_WORKSPACE_DIRECTORY
    $(bazel info execution_root)/$GOBIN work sync
)
