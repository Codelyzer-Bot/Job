#!/bin/bash
set -e

if [ -z "$REPO_URL" ]; then
  echo "Error: REPO_URL environment variable not set"
  exit 1
fi

REPO_NAME=$(basename -s .git "$REPO_URL")
CLONE_DIR="./temp/$REPO_NAME"
REPORT_DIR="./temp_reports"
REPORT_FILE="$REPORT_DIR/report_${REPO_NAME}.xml"

mkdir -p "$REPORT_DIR"

# Run Checkstyle in a temporary container and automatically remove it
docker run --rm \
  -v "$(pwd)/$CLONE_DIR:/$REPO_NAME" \
  --workdir "/$REPO_NAME" \
  atharv3321/checkstyle:latest \
  -c /google_checks.xml -f xml "/$REPO_NAME" > "$REPORT_FILE" || true

echo "Analysis complete. Report saved to $REPORT_FILE"
