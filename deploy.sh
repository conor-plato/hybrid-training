#!/usr/bin/env bash
# One-line deploy. Run from the dashboard folder: ./deploy.sh
# Stages everything, commits with a timestamped message, pushes to main.

set -e

cd "$(dirname "$0")"

# Make sure git is initialised
if [ ! -d ".git" ]; then
  echo "Not a git repo yet. Run the setup steps in SETUP.md first."
  exit 1
fi

# Stage and commit
git add -A
if git diff --cached --quiet; then
  echo "Nothing to deploy. Working tree clean."
  exit 0
fi

MSG="${1:-Update: $(date '+%Y-%m-%d %H:%M')}"
git commit -m "$MSG"

# Push to whatever the current branch is tracking
git push

echo ""
echo "Deployed. GitHub Pages usually updates within 30-60s."
