# Marketplace de démo « norrsken »

Catalogue local contenant deux plugins, `norrsken-support` et `norrsken-dev`, **générés** depuis `../.claude-cible/` par `construire.sh`. Ne pas éditer `plugins/` à la main : modifier la configuration cible, puis relancer le script.

```bash
./construire.sh
claude plugin validate .
```

Dans une session Claude Code :

```
/plugin marketplace add /chemin/vers/demo-norrsken/marketplace
/plugin install norrsken-support@norrsken
```

Les hooks du plugin attendent `jq` sur le poste ; le serveur MCP du plugin lit la variable `NORRSKEN_CRM_DIR` (dossier du CRM de démo).
