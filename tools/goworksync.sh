#!/bin/bash

# --- begin runfiles.bash initialization v3 ---
# Copy-pasted from the Bazel Bash runfiles library v3.
set -uo pipefail; set +e; f=bazel_tools/tools/bash/runfiles/runfiles.bash
source "${RUNFILES_DIR:-/dev/null}/$f" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "${RUNFILES_MANIFEST_FILE:-/dev/null}" | cut -f2- -d' ')" 2>/dev/null || \
  source "$0.runfiles/$f" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "$0.runfiles_manifest" | cut -f2- -d' ')" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "$0.exe.runfiles_manifest" | cut -f2- -d' ')" 2>/dev/null || \
  { echo>&2 "ERROR: cannot find $f"; exit 1; }; f=; set -e
# --- end runfiles.bash initialization v3 ---

(
	GO=$(rlocation "rules_go~/go/tools/go_bin_runner/bin/go")
	find $BUILD_WORKING_DIRECTORY -name go.mod -print0 |
		while IFS= read -r -d '' f; do
			d=$(dirname "$f")
			(
				echo "Running 'go mod tidy' in $d"
				BUILD_WORKING_DIRECTORY="$d" "$GO" mod tidy
			)
		done
	echo "Running 'go work sync' in $BUILD_WORKING_DIRECTORY"
	"$GO" work sync
)