#!/bin/bash
# Copie les fichiers cibles du dépôt de démo dans _extraits/, sous forme de blocs de code
# inclus par les chapitres. Lancé automatiquement par `quarto render` (pre-render).
set -e
cd "$(dirname "$0")"
mkdir -p _extraits
D=../demo-norrsken
ex() { # nom source langage
  { echo '```'"$3"; cat "$2"; echo '```'; } > "_extraits/$1.md"
}
ex ticket-T-0417        $D/support/tickets/T-0417.md                                   text
ex ticket-T-0402        $D/support/tickets/T-0402.md                                   text
ex ticket-T-0405        $D/support/tickets/T-0405.md                                   text
ex claude-md-dev        $D/.claude-cible/dev/CLAUDE.md                                 markdown
ex claude-md-support    $D/.claude-cible/support/CLAUDE.md                             markdown
ex skill-reponse-ticket $D/.claude-cible/support/.claude/skills/reponse-ticket/SKILL.md markdown
ex skill-tarifs         $D/.claude-cible/support/.claude/skills/produits-et-tarifs/SKILL.md markdown
ex skill-review         $D/.claude-cible/dev/.claude/skills/review/SKILL.md            markdown
ex skill-triage-bug     $D/.claude-cible/dev/.claude/skills/triage-bug/SKILL.md        markdown
ex agent-explorateur    $D/.claude-cible/dev/.claude/agents/explorateur.md             markdown
ex agent-verif          $D/.claude-cible/dev/.claude/agents/verif.md                   markdown
ex agent-veille         $D/.claude-cible/support/.claude/agents/veille-concurrent.md   markdown
ex mcp-json             $D/.claude-cible/support/.mcp.json                             json
ex settings-dev         $D/.claude-cible/dev/.claude/settings.json                     json
ex settings-support     $D/.claude-cible/support/.claude/settings.json                 json
ex hook-garde-fichiers  $D/.claude-cible/dev/.claude/hooks/garde-fichiers.sh           bash
ex hook-garde-envoi     $D/.claude-cible/support/.claude/hooks/garde-envoi.sh          bash
ex hook-audit           $D/.claude-cible/support/.claude/hooks/audit.sh                bash
ex plugin-json          $D/marketplace/plugins/norrsken-support/.claude-plugin/plugin.json json
ex marketplace-json     $D/marketplace/.claude-plugin/marketplace.json                 json
ex pdf-ts               $D/app/src/export/pdf.ts                                       typescript
ex tarifs               $D/support/tarifs.md                                           markdown
echo "extraits : $(ls _extraits | wc -l | tr -d ' ') fichiers"
