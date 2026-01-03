#!/bin/bash

# This script is for the interviewer to run when they are ready to start the challenge.
# It moves the challenge files to the root directory where the student can access them.

if [ -z "$1" ]; then
    echo "Usage: ./unlock_challenge.sh <patch_file_name>"
    exit 1
fi

PATCH_FILE=$1

if [ ! -f "$PATCH_FILE" ]; then
    echo "Error: Patch file $PATCH_FILE not found in interviewer_assets."
    exit 1
fi

cp "$PATCH_FILE" ../
echo "Challenge $PATCH_FILE has been unlocked and is now available for the student."
