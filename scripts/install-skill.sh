#!/usr/bin/env bash
# NovaForge skill installer — copies skill to ~/.claude/skills/NovaForge/
set -euo pipefail

SKILL_DIR="$HOME/.claude/skills/NovaForge"
mkdir -p "$SKILL_DIR"
cp "$(dirname "$0")/../skills/novaforge/SKILL.md" "$SKILL_DIR/SKILL.md"

echo "Done! NovaForge skill installed to $SKILL_DIR"
