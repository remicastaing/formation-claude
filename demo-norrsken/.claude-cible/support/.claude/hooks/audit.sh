#!/bin/bash
# Stop : une ligne d'audit par réponse qui mentionne un ticket.
entree=$(cat)
session=$(echo "$entree" | jq -r '.session_id' | cut -c1-8)
message=$(echo "$entree" | jq -r '.last_assistant_message // ""')
tickets=$(echo "$message" | grep -oE 'T-[0-9]{4}' | sort -u | tr '\n' ',' | sed 's/,$//')
[ -z "$tickets" ] && exit 0
categorie=$(echo "$message" | grep -oiE '(bug|question|facturation)' | head -1 | tr 'A-Z' 'a-z')
printf '%s  %s  session=%s  classement=%s\n' "$(date '+%Y-%m-%d %H:%M')" "$tickets" "$session" "${categorie:-?}" >> "${CLAUDE_PROJECT_DIR:-.}/audit.log"
exit 0
