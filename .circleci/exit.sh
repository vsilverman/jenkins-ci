#!/usr/bin/env bash

# This script will halt circleci pipeline
# based on the context of commit message

commitmessage=$(git log -n 1)
if [[ $commitmessage = *"[circle skip]"* ]] || [[ $commitmessage = *"[skip ci]"* ]]; then
    echo "Skipping circleci build because [circle skip] found in commit message"
    circleci step halt
fi
