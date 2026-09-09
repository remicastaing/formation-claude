#!/bin/bash
# Squelette de hook PreToolUse. À copier dans .claude/hooks/, rendre exécutable (chmod +x).
# Le hook reçoit en entrée un JSON avec tool_name et tool_input.
# Sortie 0 : laisser faire. Sortie 2 : bloquer ; le message envoyé sur stderr est montré à Claude.

# Pour une édition de fichier : le chemin.
chemin=$(jq -r '.tool_input.file_path // empty')
# Pour une commande : la commande.
commande=$(jq -r '.tool_input.command // empty')
# Pour un envoi : tout le texte.
texte=$(jq -r '.tool_input | .. | strings' 2>/dev/null)

if <ma condition, par exemple : echo "$chemin" | grep -q "<dossier protégé>"> ; then
  echo "Refusé : <pourquoi, et ce qu'il faut faire à la place>." >&2
  exit 2
fi
exit 0
