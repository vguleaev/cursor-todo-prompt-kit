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
mkdir -p .cursor/skills
mkdir -p .cursor/rules

# Copy skills
for skill_dir in "$TMP_DIR/.cursor/skills"/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  source="$skill_dir/SKILL.md"
  target_dir=".cursor/skills/$skill_name"
  target="$target_dir/SKILL.md"

  [ -f "$source" ] || continue
  mkdir -p "$target_dir"

  if [ ! -f "$target" ]; then
    cp "$source" "$target"
    echo "Added skill: $skill_name"
  else
    echo "Skipped existing skill: $skill_name"
  fi
done

# Copy rules
for file in "$TMP_DIR/.cursor/rules"/*.mdc; do
  [ -f "$file" ] || continue
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
