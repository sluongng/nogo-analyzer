#!/bin/bash

DEPS_PRUNE_BINARY=$1
DEPS_LOCATION=$2
BUILD_TARGETS=$3

PATH="$PATH:/opt/homebrew/bin/"

(
  cd "$BUILD_WORKSPACE_DIRECTORY" || exit

  echo 'Analyzing deps.bzl file for current dependencies...'
  curr_deps=$(
    # Naively assume that 'name' is the top most attribute of go_repository
    # which is often the case if the file went through buildifier formatting
    grep -A1 go_repository private/deps.bzl |\
      grep name |\
      sed 's/^.*= "//; s/",//' |\
      sort | uniq
  )

  echo 'Using bazel query to find real dependencies...'
  real_deps=$(
    # Find all dependencies of BUILD_TARGETS and then filter for go_library only
    bazelisk query --ui_event_filters=-debug,-info,-stderr --noshow_progress "kind(go_library, deps(${BUILD_TARGETS}))" |\
      # Filter for external dependencies
      grep '^@' |\
      # Trim for repository's name
      sed 's@//.*@@; s|@||' |\
      sort | uniq
  )

  echo 'Comparing results...'
  args="-file=${DEPS_LOCATION}"
  # diff the 2 results and extract for the ones that are extra in curr_deps
  repos=$(diff <(echo "$real_deps") <(echo "$curr_deps") | grep '^> ' | sed 's/^> //')
  if [[ $repos == '' ]]; then
    echo 'No dependencies to prune'
    exit 0
  fi
  for repo in $repos; do
    args+=" -prune-rule ${repo}" 
  done

  # Execute go_binary to edit the deps.bzl file programmatically
  echo 'Executing pruner'
  $DEPS_PRUNE_BINARY $args
)
