# Norrsken Planning — dépôt produit

Application web de planification d'équipes, monorepo `pnpm`. Le produit s'appelle **Norrsken Planning** dans tout texte visible par l'utilisateur.

## Commandes

- Gestionnaire de paquets : `pnpm`, jamais `npm` ni `yarn`.
- Tests : `pnpm test` avant chaque commit. Un commit avec des tests rouges n'est pas acceptable.
- Lint : `pnpm lint --fix` après toute édition de fichier `.ts`.
- Lancer en local : `pnpm dev` (port 3000, données de `app/fixtures/`, aucun service externe). Copier `app/.env.example` en `app/.env` d'abord.

## Structure

- `app/src/domain/` : règles métier pures, sans dépendance à l'infra. Toute nouvelle règle de planification va ici, avec ses tests.
- `app/src/export/` : génération PDF et tableur. Les deux formats partagent `buildPlanningModel()` ; ne pas dupliquer cette logique.
- `app/tests/` : un fichier de test par module, même nom suffixé `.test.ts`.

## Règles

- Ne jamais modifier `app/migrations/` sans demander d'abord.
- Ne jamais commiter de fichier `.env`.
- Une correction de bug s'accompagne du test qui aurait dû l'attraper.
- Messages de commit en anglais, impératif, sans point final.
- Avant de proposer une refonte, proposer d'abord le correctif minimal.

## Contexte

- Le client de référence pour les tests manuels est « Atelier Brossard » (fixture `app/fixtures/brossard.json`).
- Les exports sont imprimés par les clients : un export vide ou tronqué est un incident, pas un bug mineur.
