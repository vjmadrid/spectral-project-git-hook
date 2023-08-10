#!/bin/bash

# Execution
echo "Executing project preparation tasks"

echo "[*] Prepare 'core.hooksPath' Git Hook"
git config core.hooksPath ../git-hooks

echo "Project preparation successfully!"