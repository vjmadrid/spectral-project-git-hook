#!/bin/bash

# ### Configuration ###
DEBUG=1
BASE_DIR=$(git rev-parse --show-toplevel)
HOOK_DIR="$BASE_DIR/.git/hooks"
CUSTOM_HOOK_DIR="$BASE_DIR/git-hooks"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$DEBUG" -eq "1" ]; then
	echo "Configuration"
	echo "    - PWD:$PWD"
	echo "    - Base Directory: $BASE_DIR"
	echo "    - Git Hook Directory: $HOOK_DIR"
	echo "    - Custom Git Hook Directory: $CUSTOM_HOOK_DIR"
	echo "    - Directory: $DIR"
	echo "  "
fi

# ### Execution ###
echo "Executing prepare ALL Git Hooks By Symlinks With Script"

# Symlink git hooks
for filename in ${CUSTOM_HOOK_DIR}/*; do
	filename=$(basename ${filename})
	echo "    [*] Directory: $filename"
	ln -s "$CUSTOM_HOOK_DIR/${filename}" "$HOOK_DIR/${filename}"
done