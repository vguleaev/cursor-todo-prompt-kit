#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/vguleaev/cursor-todo-prompt-kit.git"
TMP_DIR="$(mktemp -d)"

echo "Installing cursor-todo-prompt-kit..."

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

git clone --depth=1 "$REPO_URL" "$TMP_DIR" >/dev/null 2>&1

# Ensure Cursor directories exist
mkdir -p .cursor/commands
mkdir -p .cursor/rules

# Copy commands (ct-*)
for file in "$TMP_DIR/.cursor/commands"/ct-*.md; do
  filename="$(basename "$file")"
  target=".cursor/commands/$filename"

  if [ ! -f "$target" ]; then
    cp "$file" "$target"
    echo "Added command: $filename"
  else
    echo "Skipped existing command: $filename"
  fi
done

# Copy rules (ct-*)
for file in "$TMP_DIR/.cursor/rules"/ct-*.md; do
  filename="$(basename "$file")"
  target=".cursor/rules/$filename"

  if [ ! -f "$target" ]; then
    cp "$file" "$target"
    echo "Added rule: $filename"
  else
    echo "Skipped existing rule: $filename"
  fi
done

echo "cursor-todo-prompt-kit installation complete. ✅"
echo "To start using the kit, open Cursor and start typing '/ct-init-todo' in the chat."
echo "Example: /ct-init-todo Implement Oauth2 login feature"
