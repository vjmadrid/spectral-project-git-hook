#!/bin/bash

# Configuration
HOOK_NAME="pre-commit"
HOOK_NAME_FILE="$HOOK_NAME"
BASE_DIR=$(git rev-parse --show-toplevel)
HOOK_DIR="$BASE_DIR/.git/hooks"

echo "Executing install pre-commit Git Hook"

echo "  Configuration"
echo "    - PWD:$PWD"
echo "    - Git Hook: $HOOK_NAME"
echo "    - Git Hook Directory: $HOOK_DIR"
echo "    - Base Directory: $BASE_DIR"

# Set the execution permission for the pre-commit hook file
chmod +x "$BASE_DIR/git-hooks/$HOOK_NAME_FILE"

# Copy the pre-commit hook file to the hooks directory
cp "$BASE_DIR/git-hooks/$HOOK_NAME_FILE" "$HOOK_DIR/pre-commit"

# Inform the user about the successful installation
echo "Pre-commit Git Hook installed successfully!"