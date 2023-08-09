#!/bin/bash

# Execution
echo "Executing project preparation tasks"

echo "[*] Prepare 'pre-commit' Git Hook"
cp run-basic-pre-commit.sh ../.git/hooks/pre-commit

echo "Project preparation successfully!"