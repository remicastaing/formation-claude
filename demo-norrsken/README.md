# Norrsken — dépôt de démo

PME fictive qui vend un logiciel de planification, **Norrsken Planning**. Ce dépôt est cloné par chaque participant du cours.

- `app/` : le produit, version 4.5. `pnpm test` passe. Des clients signalent pourtant des problèmes : voir `support/tickets/`.
- `support/` : tickets anonymisés, fiches clients, base de connaissances, grille tarifaire.
- `.claude-cible/` : configuration finale des ateliers A (`dev/`) et B (`support/`). Renommée pour ne pas être chargée au clonage.

- `marketplace/` : catalogue de plugins de démo, généré depuis `.claude-cible/`.
