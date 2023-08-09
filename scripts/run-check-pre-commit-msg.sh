#!/bin/sh

MESSAGE=$(cat $1)
COMMIT_FORMAT_PATTERN="^(feat|fix|docs|style|refactor|test|chore|perf|other)(\((.*)\))?: #([0-9]+) (.*)$"


echo "Running Check Commit Message"

if ! [[ "$MESSAGE" =~ $COMMITFORMAT ]]; then
    echo "Your commit was rejected due to the commit message. Skipping..."   
    exit 1
fi