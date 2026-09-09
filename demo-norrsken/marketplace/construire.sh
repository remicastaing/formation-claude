#!/bin/bash
# Reconstruit les deux plugins de démo à partir de .claude-cible/. Ne rien éditer à la main dans plugins/.
set -e
cd "$(dirname "$0")"
CIBLE=../.claude-cible
rm -rf plugins
mkdir -p .claude-plugin

construire() {  # nom source description
  local nom=$1 src=$2 desc=$3 dst=plugins/$1
  mkdir -p "$dst/.claude-plugin"
  [ -d "$src/.claude/skills" ] && cp -R "$src/.claude/skills" "$dst/skills"
  [ -d "$src/.claude/agents" ] && cp -R "$src/.claude/agents" "$dst/agents"
  if [ -d "$src/.claude/hooks" ]; then
    mkdir -p "$dst/hooks"; cp "$src/.claude/hooks/"*.sh "$dst/hooks/"
    # settings.json → hooks/hooks.json, chemins réécrits vers le plugin
    jq '{hooks: .hooks}' "$src/.claude/settings.json" \
      | sed 's#${CLAUDE_PROJECT_DIR}/.claude/hooks/#${CLAUDE_PLUGIN_ROOT}/hooks/#g' > "$dst/hooks/hooks.json"
  fi
  [ -f "$src/.mcp.json" ] && cp "$src/.mcp.json" "$dst/.mcp.json"
  cat > "$dst/.claude-plugin/plugin.json" <<JSON
{
  "name": "$nom",
  "description": "$desc",
  "version": "1.0.0",
  "author": { "name": "Norrsken" }
}
JSON
}

construire norrsken-support "$CIBLE/support" "Réponse aux tickets, tarifs, veille, garde-fous d'envoi et audit pour le service client Norrsken Planning"
construire norrsken-dev     "$CIBLE/dev"     "Revue, exploration et garde-fous pour le dépôt Norrsken Planning"

cat > .claude-plugin/marketplace.json <<'JSON'
{
  "name": "norrsken",
  "owner": { "name": "Norrsken" },
  "description": "Plugins de démo du cours : service client et dépôt produit Norrsken Planning",
  "plugins": [
    { "name": "norrsken-support", "source": "./plugins/norrsken-support", "description": "Service client : skills, agent de veille, hooks, CRM" },
    { "name": "norrsken-dev",     "source": "./plugins/norrsken-dev",     "description": "Dépôt produit : revue, explorateur, hooks" }
  ]
}
JSON
echo "Plugins reconstruits dans $(pwd)/plugins/"
