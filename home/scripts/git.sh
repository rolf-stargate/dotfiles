#!/bin/sh

# 0 * * * * ~/.config/nvim/git.sh

if ! git pull; then
    echo "Error Git Nvim: git pull failed. Check for potential conflicts."
    exit 1
fi

git add .

set +e  
git status | grep modified
STATUS=$?
set -e

if [ $STATUS -eq 0 ]
then
    set -e
    git commit -am "updated on - $(date)"
    git push
else
    set -e
    echo "No changes since last run"
fi

