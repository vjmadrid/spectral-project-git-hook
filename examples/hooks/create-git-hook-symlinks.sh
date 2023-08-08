#!/bin/bash

# Inspired by http://stackoverflow.com/a/3464399/2063546

HOOK_NAMES="pre-commit"

BASE_DIR=$(git rev-parse --show-toplevel)
HOOK_DIR="$BASEDIR/.git/hooks"

echo "[*] Generate local version of hooks..."

for hook in $HOOK_NAMES; do
    # If the hook already exists, is executable, and is not a symlink
    if [ ! -h $HOOK_DIR/$hook -a -x $HOOK_DIR/$hook ]; then
        echo "Moving existing hook '$hook' to '$hook.local' (it will still be executed)"
        mv $HOOK_DIR/$hook $HOOK_DIR/$hook.local
    fi
done

echo "[*] Create the symlinks..."

for hook in $HOOK_NAMES; do
    # create the symlink, overwriting the file if it exists
    # probably the only way this would happen is if you're using an old version of git
    # -- back when the sample hooks were not executable, instead of being named ____.sample
    ln -s -f ./git-hooks-wrapper.sh $HOOK_DIR/$hook
done