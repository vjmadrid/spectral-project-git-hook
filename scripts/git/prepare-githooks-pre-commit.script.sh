#!/bin/bash

# ### Configuration ###
BASE_DIR=$(git rev-parse --show-toplevel)
HOOK_DIR="$BASE_DIR/.git/hooks"
HOOK_NAME="pre-commit"
HOOK_NAME_FILE="$HOOK_NAME"



# ### Execution ###
echo "Executing prepare 'pre-commit' Git Hook With Script"

echo "  Configuration"
echo "    - PWD:$PWD"
echo "    - Git Hook: $HOOK_NAME"
echo "    - Git Hook Directory: $HOOK_DIR"
echo "    - Base Directory: $BASE_DIR"


# Copy the pre-commit hook file to the hooks directory

# Option 1
cp ./run-basic-pre-commit.sh ../../.git/hooks/pre-commit

# Option 2
# Copy the pre-commit hook file to the hooks directory
#cp "$BASE_DIR/git-hooks/$HOOK_NAME_FILE" "$HOOK_DIR/pre-commit"


# Set the execution permission for the pre-commit hook file

#Option 1
chmod +x ../../.git/hooks/pre-commit

#Option 2
#chmod +x "$BASE_DIR/git-hooks/$HOOK_NAME_FILE"

# Inform the user about the successful preparation
echo "'pre-commit' Git Hook prepared successfully!"
exit 0