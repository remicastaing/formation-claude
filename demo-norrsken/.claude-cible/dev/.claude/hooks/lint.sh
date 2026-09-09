#!/bin/bash
# PostToolUse sur Edit|Write : lint du seul fichier édité, erreurs renvoyées à Claude.
chemin=$(jq -r '.tool_input.file_path // empty')
case "$chemin" in
  *.ts|*.tsx) ;;
  *) exit 0 ;;
esac
cd "${CLAUDE_PROJECT_DIR:-.}/app" || exit 0
sortie=$(pnpm exec eslint --fix "$chemin" 2>&1)
if [ -n "$sortie" ]; then
  jq -n --arg s "$sortie" '{hookSpecificOutput:{hookEventName:"PostToolUse",additionalContext:("Lint du fichier édité :\n"+$s)}}'
fi
exit 0
