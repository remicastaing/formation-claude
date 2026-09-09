# Emballer sa configuration en plugin

```
mon-plugin/
├── .claude-plugin/
│   └── plugin.json          ← seul fichier dans ce dossier
├── skills/                  ← copie de .claude/skills/
├── agents/                  ← copie de .claude/agents/
├── hooks/
│   ├── hooks.json           ← la clé "hooks" de .claude/settings.json
│   └── *.sh                 ← les scripts, chemins réécrits en ${CLAUDE_PLUGIN_ROOT}/hooks/
└── .mcp.json                ← copie de .mcp.json
```

Tester sans installer : `claude --plugin-dir ./mon-plugin`, puis `/reload-plugins` après chaque modification.
Vérifier : `claude plugin validate ./mon-plugin`.
Distribuer : un dossier `marketplace/` avec `.claude-plugin/marketplace.json` (squelette fourni) et `plugins/mon-plugin/`.
Installer chez le voisin : `/plugin marketplace add <chemin>` puis `/plugin install mon-plugin@<catalogue>`.
