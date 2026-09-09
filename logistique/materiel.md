# Matériel à préparer — vue consolidée

Chaque module garde sa liste courte ; ce fichier est la vue d'ensemble, à cocher la veille.

## Dépôt de démo Norrsken (`demo-norrsken/`)

- [ ] `app/` : projet applicatif avec trois bugs plantés, documentés dans [[bugs-plantes]] (jamais dans le dépôt).
- [ ] `support/tickets/` : 21 tickets, cinq clients dans `clients/`.
- [ ] `support/clients/` : fiches clients jouant le rôle du CRM, dont `brossard.md`.
- [ ] `support/kb/` : articles de la base de connaissances, dont `export-tableur.md`.
- [ ] `support/tarifs.md` : grille tarifaire, règles de remise, SLA par contrat.
- [ ] `.claude-cible/dev/` et `.claude-cible/support/` : configuration finale des deux ateliers, testée.

## Module 0

- [ ] `demo-nu/` et `demo-configure/` prêts sur la machine de projection ([[preparation-demo]]).
- [ ] Les deux réponses générées la veille, collées dans [[preparation-demo]].
- [ ] Tableau blanc ou paperboard visible toute la journée.
- [ ] App desktop ouverte sur le dépôt de démo chez les non-développeurs avant l'accueil.

## Module 1

- [ ] `.claude-cible/dev/CLAUDE.md` et `.claude-cible/support/CLAUDE.md` testés sur une session réelle.
- [ ] `participants/squelettes/CLAUDE.md` pré-rempli.
- [ ] Ticket T-0402 disponible pour le test métier.
- [ ] Les participants ont cloné `norrsken-demo` (kit sans `CLAUDE.md`, `.claude/` ni `.mcp.json`).

## Module 2

- [ ] Skills cibles testés : `.claude-cible/dev/.claude/skills/review/`, `.claude-cible/support/.claude/skills/produits-et-tarifs/` et `reponse-ticket/`.
- [ ] Tickets T-0417, T-0402, T-0431 ; fiche `clients/brossard.md` ; articles `kb/export-tableur.md`, `kb/partage-externe.md` ; `tarifs.md`.
- [ ] `participants/squelettes/SKILL.md`.
- [ ] Dossier de démo sans `.claude/skills/` au début de la démo.
- [ ] Réponses des trois tickets générées la veille, v1 et v2 ([[demos-formateur]]).

## Module 3

- [ ] Agents cibles testés : `.claude-cible/dev/.claude/agents/explorateur.md`, `.claude-cible/support/.claude/agents/veille-concurrent.md`.
- [ ] `demo-norrsken/` avec le contenu de `.claude-cible/dev/` copié à sa racine, pour les démos `explorateur` (Module 3) et `.env` (Module 5).
- [ ] Fiches `support/veille/plannio.md` et `ateliero.md`.
- [ ] `participants/squelettes/agent.md` ; fiche papier du TP 3 imprimée.
- [ ] Les deux `/context` et le résumé, générés la veille ([[demos-formateur]]).

## Module 4

- [ ] Node et `npx` sur la machine de projection ; serveur de fichiers exécuté une fois la veille.
- [ ] `~/norrsken-crm/clients/brossard.md` ; `demo-configure/support/clients/` sans la fiche ; pas de `.mcp.json` au départ.
- [ ] Skill `reponse-ticket` avec « sinon par le CRM connecté ».
- [ ] `.claude-cible/support/.mcp.json`.
- [ ] Réponses sans et avec serveur, générées la veille ([[demos-formateur]]).
- [ ] Chemin du réglage MCP dans l'application de bureau, vérifié la veille (à vérifier).

## Module 5

- [ ] `jq` sur la machine de projection et les postes dev.
- [ ] `.claude-cible/dev/.claude/settings.json` + `hooks/garde-fichiers.sh`, `garde-rm.sh`, `lint.sh`, exécutables et testés.
- [ ] `.claude-cible/support/.claude/settings.json` + `hooks/garde-envoi.sh`, `audit.sh`, exécutables et testés.
- [ ] Pour la démo : `app/.env` avec `PORT=3000`, ligne « Ne jamais modifier `.env` » ajoutée au CLAUDE.md, `settings.json` renommé `settings.demo.json` au départ.
- [ ] `participants/squelettes/hooks.json` et `garde-fou.sh` ; fiche papier du TP 5.
- [ ] Sorties de la démo `.env` générées la veille ([[demos-formateur]]).

## Module 6

- [ ] `demo-norrsken/marketplace/` reconstruit par `construire.sh` et validé par `claude plugin validate`.
- [ ] `poste-vierge/support/` sans `.claude/` ni `CLAUDE.md` ; CRM à côté ; catalogue `norrsken` retiré de la machine avant la séance.
- [ ] Skill `compte-rendu-rdv` présent dans `.claude-cible/support/`.
- [ ] `participants/squelettes/plugin.json`, `marketplace.json`, `README-plugin.md`.
- [ ] Sortie de la démo générée la veille ([[demos-formateur]]).
- [ ] Emplacement du navigateur de plugins dans l'application de bureau, vérifié la veille (à vérifier).

## Module 7 — ateliers

- [ ] `demo-norrsken/app/` : `pnpm test` vert sur la machine de projection ; `pnpm install` fait pour ESLint ; Node 22.6 ou plus sur les postes dev.
- [ ] Kit `norrsken-demo` à jour (dernier push de `formation-claude` réussi) ; il ne contient ni `.claude-cible/` ni `marketplace/`.
- [ ] Squelettes complets, dont `participants/squelettes/support/` (deux scripts et `hooks.json`).
- [ ] `norrsken-crm/` vide à côté de chaque clone.
- [ ] [[bugs-plantes]] imprimé pour le formateur seulement.
- [ ] Fiches papier : test croisé (étape 5 B), trois améliorations (les deux ateliers).
- [ ] Demander aux participants support d'apporter trois tickets réels anonymisés.
- [ ] Un formateur par atelier, ou un dev référent solide par table métier.

## Module 8

- [ ] [[quiz-arbitrage]] imprimé, un par participant, distribué au début du quiz.
- [ ] [[quiz-reponses]] pour le formateur.
- [ ] Six cartons ou gestes de vote ; chronomètre visible.
- [ ] Session du formateur ouverte depuis le matin pour `/context`.
- [ ] Tableau du tour de salle intact.

## Module 9

- [ ] [[grille-declencheur-mecanisme]] imprimée, une par participant.
- [ ] [[fiche-engagement]] imprimée, distribuée au début des ateliers.
- [ ] Date du J+15 et responsable de l'invitation décidés avant la séance ([[suivi-j15]]).
- [ ] Photo du tableau en fin de séance (plaintes, boucle, engagements).

## Supports

- [ ] Deck généré depuis `supports/slides.md`.
- [ ] Figures : cercle de la boucle, tableau du nouveau collègue.

## Participants

- [ ] Grille « déclencheur → mécanisme » et fiche d'engagement, imprimées (Module 9).
- [ ] Quiz d'arbitrage imprimé (Module 8).
- [ ] Squelettes pré-remplis à 50 % : `CLAUDE.md`, `SKILL.md`, agent, `hooks.json`, `plugin.json`.

## Infrastructure

- [ ] Un serveur MCP de démo accessible sans configuration lourde (Drive ou ticketing bac à sable).
- [ ] Un dev référent par table métier.
- [ ] Claude Code installé et connecté chez chaque participant, vérifié la veille.
