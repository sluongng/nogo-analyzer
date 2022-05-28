#!/bin/bash

GOBIN=$1

(
	cd "$BUILD_WORKSPACE_DIRECTORY" || exit
	GO="$(bazel info execution_root)/$GOBIN"

	find . -name go.mod |
		while IFS= read -r -d '' f; do
			d=$(dirname "$f")
			(
				cd "$d" || exit
				"$GO" mod tidy
			)
		done

	"$GO" work sync
)
