#!/usr/bin/env bash
set -euo pipefail
name="${1:?usuage ./bootstrap.sh <project-name>}"
[ -e "$name" ] && { echo "Error: $name already exits"; exit 1; }
mkdir "$name" && cd "$name"
git init -q -b main
cat > .gitignore <<'EOF'
node_modules/
.env
.DS_Store
*.log
EOF
printf "# %s\n\nA new project.\n" "$name" > README.md
git add .
git commit -q -m "initial commit: add README and .gitignore"
echo "Created $name"

