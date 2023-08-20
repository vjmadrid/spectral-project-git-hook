#!/bin/sh

# ### Configuration ###



# ### Execution ###
echo "[*] Running pre-commit script (script directory)"


# ***************
#    Testing
# ***************

# Test Configuration

# Test Execution
echo "- Executing tests before commit"

npm run test

RESULT=$?

if [ "$RESULT" -ne 0 ]; then
    echo "Failed execution of tests"
    exit 1
fi



# ********************
#    Spectral Lint
# ********************

echo "- Spectral OAS Lint"

npm run spectral:oas:lint:one

RESULT=$?

[ $RESULT -ne 0 ] && exit 1

exit 0