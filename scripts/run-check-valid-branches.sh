#!/bin/sh

# Define patterns
FORBIDDEN_BRANCHES_PATTERN="^(master|dev|release)$"

# Check the current branch name
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
MESSAGE="You should not commit directly into ${BRANCH_NAME} branch"



echo "Running Check Valid Branches"

# Check if the branch name matches the forbidden branches pattern
if [[ $BRANCH_NAME =~ $FORBIDDEN_BRANCHES_PATTERN ]]
then
    echo $MESSAGE
    exit 1
fi