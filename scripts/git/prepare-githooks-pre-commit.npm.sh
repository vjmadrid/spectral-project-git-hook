#!/bin/bash

# ### Configuration ###



# ### Execution ###
echo "Prepare 'pre-commit' Git Hook With NPM"

echo "[*] Prepare 'pre-commit' Git Hook"
npm run prepare:githooks:pre-commit:adhoc

echo "'pre-commit' Git Hook preparation successfully!"
exit 0