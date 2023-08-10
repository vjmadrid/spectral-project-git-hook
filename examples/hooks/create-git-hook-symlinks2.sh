#!/usr/bin/env bash

# 1. Save this script in your repo as "hooks/setup.sh"
# 2. Save your git hooks in "hooks/git/<hook name>"
# 3. Execute this script with bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${DIR}/.."

# Symlink git hooks
for filename in ${DIR}/git/*; do
	filename=$(basename ${filename})
	ln -s "../../hooks/git/${filename}" ".git/hooks/${filename}"
done