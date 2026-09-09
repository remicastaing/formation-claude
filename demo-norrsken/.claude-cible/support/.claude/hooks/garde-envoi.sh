#!/bin/bash
# PreToolUse sur tout outil MCP d'envoi : refuse un montant sans « HT » ou un délai hors SLA.
# Le texte à envoyer est cherché dans tous les champs texte de l'appel.
texte=$(jq -r '.tool_input | .. | strings' 2>/dev/null)

# 1. Un montant en euros dont la ligne ne contient pas « HT ».
if echo "$texte" | grep -E '[0-9]+([,.][0-9]+)? ?(€|euros?)' | grep -vq 'HT'; then
  echo "Refusé : un montant apparaît sans la mention « HT ». Ajouter HT ou retirer le montant." >&2
  exit 2
fi

# 2. Un délai annoncé qui n'est pas dans la liste du SLA.
delais_autorises='1 jour ouvré|5 jours ouvrés|4 heures ouvrées|2 jours ouvrés|2 heures ouvrées'
if echo "$texte" | grep -Eiq 'sous [0-9]+ ?(h|heures?|jours?|semaines?)|d.ici (demain|lundi|mardi|mercredi|jeudi|vendredi|la fin)' \
   && ! echo "$texte" | grep -Eq "$delais_autorises"; then
  echo "Refusé : un délai est annoncé qui n'est pas dans la liste du SLA (tarifs.md). Utiliser le délai du contrat ou ne pas en annoncer." >&2
  exit 2
fi
exit 0
