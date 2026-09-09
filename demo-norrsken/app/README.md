# Norrsken Planning — application

Version 4.5. Sans dépendance à installer pour les tests : Node 22.6 ou plus suffit (`pnpm test`). `pnpm install` n'est nécessaire que pour le linter.

- `src/domain/` : règles métier pures (créneaux, SLA, tarifs).
- `src/export/` : modèle d'export partagé, générateurs PDF et tableur.
- `tests/` : un fichier par module.
- `migrations/` : schéma SQL, à ne pas modifier sans demander.
- `fixtures/` : données de test, dont le client de référence Atelier Brossard.

Copier `.env.example` en `.env` avant de lancer `pnpm dev`.
