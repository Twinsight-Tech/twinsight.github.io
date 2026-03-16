#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
# deploy.sh  –  One-shot GitHub Pages deployment for Twinsight
#
# Prerequisites:
#   1. A GitHub account named "twinsight"  (for https://twinsight.github.io)
#   2. A GitHub Personal Access Token with 'repo' and 'pages' scopes
#   3. git + curl installed
#
# Usage:
#   chmod +x deploy.sh
#   GITHUB_TOKEN=ghp_XXXX ./deploy.sh
# ─────────────────────────────────────────────────────────────────────────────

set -euo pipefail

REPO_NAME="twinsight.github.io"
GITHUB_USER="twinsight"
TOKEN="${GITHUB_TOKEN:?Please set GITHUB_TOKEN env var}"

echo ">>> Creating GitHub repository: $GITHUB_USER/$REPO_NAME"
curl -s -X POST \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"$REPO_NAME\",\"description\":\"Twinsight – Stop Guessing. Start Simulating.\",\"private\":false,\"auto_init\":false}" \
  | python3 -c "import sys,json; r=json.load(sys.stdin); print('Repo:', r.get('html_url','already exists or error'))"

echo ">>> Initializing git repo"
cd "$(dirname "$0")"
git init -b main
git config user.email "deploy@twinsight.io"
git config user.name "Twinsight Deploy"
git add -A
git commit -m "feat: initial Twinsight website deployment"

echo ">>> Pushing to GitHub"
git remote add origin "https://$TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git"
git push -u origin main --force

echo ">>> Enabling GitHub Pages (from main branch)"
curl -s -X POST \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/$GITHUB_USER/$REPO_NAME/pages" \
  -d '{"source":{"branch":"main","path":"/"}}' \
  | python3 -c "import sys,json; r=json.load(sys.stdin); print('Pages URL:', r.get('html_url', r))"

echo ""
echo "✅ Done! Your site will be live in ~1–2 minutes at:"
echo "   https://$GITHUB_USER.github.io"
