#!/bin/bash

# Execution
echo "Running Build"
sh run-tests.sh

# $? stores the exit value of last command
if [ $? -ne 0 ]; then
  echo "Build must be succeed before commit!"
  exit 1
fi

if [[ $(git diff --cached --exit-code) ]];then
  BRANCH_NAME=$(git branch --show-current)
  STASH_NAME="pre-commit-on-$BRANCH_NAME-$(date +"%m-%d-%y::%T")"
  git stash save -q --keep-index $STASH_NAME
  echo "Stash:${STASH_NAME} saved!"
fi

exit 0