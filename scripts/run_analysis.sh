#!/bin/bash

set -e

if [ -z "$REPO_URL" ]; then
  echo "Error: REPO_URL environment variable not set"
  exit 1
fi

REPO_NAME=$(basename -s .git "$REPO_URL")
CLONE_DIR="./temp/$REPO_NAME"
REPORT_FILE="./temp_reports/report_${REPO_NAME}.json"

mkdir -p temp_reports

echo "Running Checkstyle in Docker for $REPO_NAME..."

docker run --rm \
  -v "$(pwd)/$CLONE_DIR:/workspace" \
  ghcr.io/checkstyle/checkstyle \
  -c /google_checks.xml -f json /workspace > "$REPORT_FILE" || true

echo "Analysis complete. Report saved to $REPORT_FILE"
