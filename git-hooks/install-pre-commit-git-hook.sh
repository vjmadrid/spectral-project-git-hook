#!/bin/bash

# Configuration
HOOK_NAME="pre-commit"
HOOK_NAME_FILE=$HOOK_NAME
BASE_DIR=$(git rev-parse --show-toplevel)
HOOK_DIR="$BASEDIR/.git/hooks"

# Set the execution permission for the pre-commit hook file
chmod +x "$HOOK_NAME_FILE"

# Move the pre-commit hook file to the hooks directory
mv "$HOOK_NAME_FILE" "$HOOK_DIR/pre-commit"

# Inform the user about the successful installation
echo "Pre-commit Git Hook installed successfully!"