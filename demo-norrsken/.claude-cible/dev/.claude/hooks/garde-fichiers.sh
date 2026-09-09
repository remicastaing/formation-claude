#!/bin/bash
# PreToolUse sur Edit|Write : refuse les fichiers protégés.
# Sortie 0 : laisser faire. Sortie 2 : bloquer, le message sur stderr est montré à Claude.
chemin=$(jq -r '.tool_input.file_path // empty')
case "$chemin" in
  *"/app/migrations/"*|*"/migrations/"*)
    echo "Refusé : $chemin est une migration. Demander avant de toucher à app/migrations/." >&2
    exit 2 ;;
  *"/.env"|*"/.env."*)
    echo "Refusé : $chemin est un fichier de secrets. Décrire le changement au lieu de l'appliquer." >&2
    exit 2 ;;
esac
exit 0
