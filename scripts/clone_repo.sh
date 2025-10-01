#!/bin/bash

set -e

if [ -z "$REPO_URL" ]; then
  echo "Error: REPO_URL environment variable not set"
  exit 1
fi

REPO_NAME=$(basename -s .git "$REPO_URL")
CLONE_DIR="./temp/$REPO_NAME"

mkdir -p temp

echo "Cloning $REPO_URL into $CLONE_DIR ..."
git clone "$REPO_URL" "$CLONE_DIR"
echo "Clone completed!"

echo "Contents of $CLONE_DIR:"
ls -R "$CLONE_DIR"
