#!/bin/sh

# ### Configuration ###



# ### Execution ###
echo "[*] Running pre-commit Git Hook (script directory)"
#echo "$PWD"


# ***************
#    Testing
# ***************

# Test Configuration
COMMAND="./npm run test"

# Test Execution
echo "- Executing tests before commit"

#Option 1: Execute command
#npm run test

#Option 2: Execute command 2
$COMMAND

#Option 3: Execute script
#./scripts/run-tests.sh

RESULT=$?

#Option 1: One Line
#[ $RESULT -ne 0 ] && exit 1

#Option 3: With Message
if [ "$RESULT" -ne 0 ]; then
    echo "Failed execution of tests"
    exit 1
fi



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