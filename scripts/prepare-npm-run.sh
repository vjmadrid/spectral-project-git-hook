#!/bin/bash

# Execution
echo "Executing project preparation tasks"

echo "[*] Prepare 'pre-commit' Git Hook"
npm run prepare:githooks:adhoc:pre-commit

echo "Project preparation successfully!"