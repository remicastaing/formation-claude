# Démos réalisées par le formateur

Deux usages : la démo prévue par le plan, et la variante « la salle n'a pas Claude Code », où chaque TP devient une démo dictée par la salle et exécutée par le formateur. Pour chaque démo : la commande tapée, ce qu'on doit voir, le filet de secours généré la veille.

Règle du mode dégradé : la salle écrit sur papier ou dicte, le formateur tape, la salle juge le résultat. On ne saute jamais l'étape « qu'est-ce qui a changé ? ».

## Module 0 — Démo d'ouverture

Voir [[preparation-demo]].

## Module 1 — TP 1 en mode démo (10 min)

Remplace [[tp-01-claude-md]] si la salle n'est pas équipée.

1. **Collecte (3 min).** Le formateur ouvre un `CLAUDE.md` vide dans le dossier `support/`. La salle propose des lignes à voix haute, côté métier d'abord ; le formateur en retient cinq et les tape telles quelles, y compris les formulations en souhait. Puis trois lignes côté dev dans le `CLAUDE.md` du dépôt.
2. **Test (3 min).** Nouvelle session sur `support/`, demande : « Réponds au ticket `tickets/T-0402.md`. » La salle repère ligne par ligne ce qui est respecté.
3. **Le retournement (3 min).** Le formateur prend une ligne respectée, la réécrit en souhait (« essaie de vouvoyer »), relance la même demande dans une nouvelle session. Puis l'inverse : une ligne en souhait qui n'a pas été suivie, réécrite en contrainte. Deux relances suffisent pour que la salle voie que la formulation compte.
4. **`/context` (1 min).** Montrer la liste des fichiers mémoire, déplacer le fichier dans un sous-dossier, relancer : il disparaît de la liste. C'est le diagnostic numéro un.

Filet de secours : les quatre réponses (contrainte respectée, souhait ignoré, et leurs inverses) générées la veille, collées ci-dessous.

### Réponses générées la veille

_(à coller)_

## Module 2 — Démo en direct `/reponse-ticket` (15 min)

La salle suit sur [[tp-02-reponse-ticket]]. Sans Claude dans la salle : le formateur seul, la salle dicte la description v2.

État de départ sur la machine de projection : `demo-configure/support/` avec le `CLAUDE.md` du Module 1, les fiches, la KB, les trois tickets, et **aucun** dossier `.claude/skills/`.

| Étape | Ce que tape le formateur | Ce qu'on doit voir |
|---|---|---|
| Créer | `.claude/skills/reponse-ticket/SKILL.md` depuis le squelette ; description v1 : « Rédige la réponse à un ticket support. » | Le fichier ouvert à l'écran, douze lignes de corps |
| Ticket 1 | « Prépare la réponse au ticket T-0417. » | Le skill se déclenche (visible dans la sortie). Classement bug, fiche lue, article export tableur proposé |
| Ticket 2 | « Léa Brossard nous demande comment partager un planning avec un sous-traitant, tu lui réponds quoi ? » | Pas de déclenchement. Réponse vouvoyée, produit bien nommé, **sans** classement ni article |
| Corriger | Description v2 (texte de la slide 2.5). Nouvelle session, même demande | Déclenchement. Classement question, article partage proposé |
| Ticket 3 | « Réponds à la réclamation de Brossard sur la facture. » | Déclenchement. Classement facturation, montant renvoyé à Thomas Renaud |

Si le ticket 2 déclenche quand même avec la v1 (ça arrive) : ne pas insister, montrer la v1 et la v2 côte à côte et dire que la v1 a marché cette fois, pas la précédente. Le filet ci-dessous contient une exécution où elle n'a pas marché.

Version cible du skill : `demo-norrsken/.claude-cible/support/.claude/skills/reponse-ticket/SKILL.md`.

### Réponses générées la veille

Pour chaque ticket : avec skill v1, sans déclenchement (ticket 2), avec skill v2.

_(à coller)_

## Module 3 — Démo `explorateur` et `/context` (3 min)

Sur `demo-norrsken/` avec le contenu de `.claude-cible/dev/` copié à sa racine (`CLAUDE.md` et `.claude/`). Réponse attendue : `app/src/export/model.ts` (`buildPlanningModel`), `pdf.ts` (`exportPdf`), `xlsx.ts`, `app/src/domain/planning.ts` (`journees`).

| Étape | Ce que tape le formateur | Ce qu'on doit voir |
|---|---|---|
| Avant | `/context` | La taille de la conversation, à noter au tableau |
| Mission | « Utilise le sous-agent explorateur : où est géré l'export PDF, et quelles fonctions sont impliquées ? » | Claude délègue ; le résumé arrive : chemins, fonctions, cinq lignes |
| Après | `/context` | La conversation n'a grossi que du résumé |

Si le sous-agent ne se déclenche pas : la mission le nomme, il doit être listé ; vérifier que le fichier est bien dans `.claude/agents/` du dossier de travail et relancer la session.

### Sorties générées la veille

Les deux `/context` et le résumé.

_(à coller)_

## Module 3 — Pas de variante démo pour le TP 3

L'exercice est oral et tient sans Claude.

## Module 4 — Démo `/reponse-ticket` sans puis avec MCP (6 min)

La salle suit sur [[tp-04-mcp-crm]]. Sans Claude dans la salle : le formateur seul ; avant de montrer la première réponse, faire deviner ce qui va manquer.

Préparation la veille, sur la machine de projection :

- `npx -y @modelcontextprotocol/server-filesystem /tmp` exécuté une fois pour que le paquet soit en cache.
- `demo-configure/support/` : `clients/` vidé de `brossard.md` ; le fichier déplacé dans `~/norrsken-crm/clients/brossard.md`.
- Aucun `.mcp.json` dans `demo-configure/support/` au départ.

| Étape | Ce que tape le formateur | Ce qu'on doit voir |
|---|---|---|
| Sans | « Réponds à la réclamation de Brossard sur la facture. » | Skill déclenché ; « fiche introuvable » en tête ; réponse sans chargé de compte ni T-0298 |
| Ajouter | `claude mcp add --scope project --transport stdio crm -- npx -y @modelcontextprotocol/server-filesystem ~/norrsken-crm` | `.mcp.json` créé dans `support/` |
| Vérifier | Nouvelle session, approuver le serveur, `/mcp` | `crm` connecté, outils listés |
| Avec | Même demande mot pour mot | Skill déclenché ; fiche lue par le serveur ; Thomas Renaud et T-0298 dans la réponse |

Si le serveur ne démarre pas en séance : montrer `.mcp.json`, coller la réponse « avec » du filet, et avancer. Ne pas déboguer devant la salle.

### Réponses générées la veille

Sans serveur, puis avec.

_(à coller)_

## Module 5 — Démo `.env` : consigne puis hook (3 min)

Le formateur seul. Sur `demo-norrsken/` avec le CLAUDE.md dev, auquel on ajoute pour la démo la ligne « Ne jamais modifier `.env`. » (le fichier cible dit seulement « ne jamais commiter »). Un fichier `app/.env` contenant `PORT=3000` (copie de `app/.env.example`). Le `settings.json` des hooks renommé `settings.demo.json` au départ.

| Étape | Ce que tape le formateur | Ce qu'on doit voir |
|---|---|---|
| Consigne | « Le port de dev doit passer à 4000, mets à jour la configuration. » | Soit Claude demande avant de toucher `.env` (dire : « il a lu la consigne, aujourd'hui »), soit il modifie (la démonstration est faite). Dans les deux cas, ne pas commenter plus de dix secondes |
| Activer | Renommer `settings.demo.json` en `settings.json`. Nouvelle session ; accepter la confiance du dossier si demandée | `/hooks` liste le `PreToolUse` |
| Hook | Même demande mot pour mot | Tentative d'édition refusée avec le message « fichier de secrets » ; Claude propose une autre voie ; `.env` inchangé |
| Coût | `/context` | Même taille qu'avant l'activation |

Remettre `app/.env` à `PORT=3000` avant l'atelier si Claude l'a modifié à la première étape.

### Sorties générées la veille

Les deux réponses, avec la consigne seule (une où Claude modifie si on en obtient une) et avec le hook.

_(à coller)_

## Module 5 — Pas de variante démo pour le TP 5

L'exercice est sur papier et tient sans Claude.

## Module 6 — Démo : installer `norrsken-support` sur un poste vierge (4 min)

Le formateur seul. Préparation la veille :

- `demo-norrsken/marketplace/construire.sh` exécuté, puis `claude plugin validate demo-norrsken/marketplace` sans erreur.
- Un dossier `poste-vierge/support/` : copie de `demo-norrsken/support/` **sans** `.claude/`, sans `CLAUDE.md`, sans `.mcp.json`. Le CRM à côté, `NORRSKEN_CRM_DIR` exporté.
- Si le catalogue a déjà été ajouté sur cette machine lors d'un test : `/plugin marketplace remove norrsken` avant la séance, pour que l'ajout soit visible.

| Étape | Ce que tape le formateur | Ce qu'on doit voir |
|---|---|---|
| Vierge | Session dans `poste-vierge/support/`, taper `/` | Aucun skill Norrsken dans la liste |
| Catalogue | `/plugin marketplace add /chemin/demo-norrsken/marketplace` | Catalogue `norrsken` ajouté |
| Installer | `/plugin install norrsken-support@norrsken`, portée **projet** ; `/reload-plugins` si demandé | Résumé d'installation : skills, agent, hooks, serveur MCP |
| Vérifier | `/` puis `/hooks` puis `/mcp` | `/norrsken-support:reponse-ticket`, `/norrsken-support:compte-rendu-rdv` ; garde-envoi et audit ; serveur `crm` |
| Utiliser | `/norrsken-support:reponse-ticket T-0417` | La réponse du Module 0 |

Point d'attention : sans `CLAUDE.md` dans `poste-vierge/support/`, le ton vient uniquement du skill. Si la réponse tutoie ou dérape, le dire à la salle : « il manque la fiche de poste ; le plugin ne la contient pas, elle vit dans le dossier ». C'est un vrai enseignement, pas un échec.

### Sortie générée la veille

_(à coller)_

## Module 7 — Atelier unique piloté (30 min, si la salle n'a pas Claude Code)

Remplace les deux ateliers. Le formateur seul au clavier, sur `demo-configure/support/` vidé de sa configuration, puis sur `demo-norrsken/`. Les tables produisent sur papier, le formateur assemble et exécute. Le temps rendu va au Module 8.

| Min | Tables | Le formateur |
|---|---|---|
| 0–8 | Chaque table écrit cinq lignes de CLAUDE.md support (ton, noms, délais, interdits) | Collecte, tape les dix meilleures, teste sur T-0396 |
| 8–16 | Chaque table écrit la description de `/reponse-ticket` en trois parties | Tape la meilleure, corps fourni, teste sur T-0419 puis T-0405 |
| 16–20 | Les tables devinent ce qui manquera dans la réponse à T-0431 | Montre la réponse sans CRM, connecte le serveur, relance |
| 20–26 | Chaque table écrit une règle de garde-fou | Fait tourner `garde-envoi.sh` à la main sur les règles proposées ; montre `audit.log` |
| 26–30 | Table dev : où est le bug de T-0417 ? | Lance `/triage-bug T-0417` sur le dépôt avec la config cible, montre reproduction et cause |

Filets : les réponses de chaque étape générées la veille avec la configuration cible.

### Sorties générées la veille

_(à coller)_
