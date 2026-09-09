#!/bin/bash
# PreToolUse sur Bash, filtré par "if": "Bash(rm *)" : refuse rm -rf et rm -r.
cmd=$(jq -r '.tool_input.command // empty')
if echo "$cmd" | grep -Eq 'rm\s+(-[a-zA-Z]*r[a-zA-Z]*|--recursive)'; then
  echo "Refusé : suppression récursive. Lister les fichiers et demander avant." >&2
  exit 2
fi
exit 0
