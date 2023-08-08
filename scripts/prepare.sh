#!/bin/bash

# Configuration
BASE_DIR=$(git rev-parse --show-toplevel)

echo -e "Executing project preparation tasks"

echo "  Configuration"
echo "    - PWD:$PWD"
echo "    - Base Directory: $BASE_DIR"

echo -e "\n[*] Preparing Git Hooks ..."
source "$BASE_DIR/git-hooks/install-pre-commit-git-hook.sh"

echo "Project preparation successfully!"
