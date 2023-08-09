#!/bin/sh

echo "[*] Running pre-commit Git Hook (script directory)"
#echo "$PWD"


# ***************
#    Testing
# ***************

echo "- Testing"

#Option 1: Execute command
npm run test

#Option 2: Execute script
#./scripts/run-tests.sh

RESULT=$?
[ $RESULT -ne 0 ] && exit 1



# ********************
#    Spectral Lint
# ********************

echo "- Spectral OAS Lint"

#Option 1: Execute command
npm run spectral:oas:lint:one

#Option 2: Execute script
#./scripts/run-spectral.sh

RESULT=$?
[ $RESULT -ne 0 ] && exit 1

exit 0