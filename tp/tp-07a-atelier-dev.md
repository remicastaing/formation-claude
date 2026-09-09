# TP 7a — Atelier développeurs : du bug au correctif audité

**Durée** : 55 minutes après le lancement, en binôme.
**Objectif** : construire un dossier `.claude/` complet sur le dépôt Norrsken, l'utiliser pour trouver et corriger un bug signalé par un client, et le livrer en plugin à votre voisin.

## Prérequis

- Le dépôt `demo-norrsken/` cloné ; `cd demo-norrsken/app && pnpm test` passe.
- `jq` installé (`which jq`).
- Les squelettes de `participants/squelettes/`.
- Aucun `.claude/` ni `CLAUDE.md` dans `demo-norrsken/` au départ.

Le ticket de travail : `demo-norrsken/support/tickets/T-0417.md`. Lisez-le maintenant, deux minutes.

## Étape 1 — Le CLAUDE.md du dépôt (10 min)

À la racine de `demo-norrsken/`, à partir du squelette. Dix à vingt lignes, des contraintes vérifiables. Au minimum :

- le gestionnaire de paquets et la commande de test ;
- ce qu'on fait avant un commit ;
- un dossier qu'on ne touche jamais sans demander ;
- la règle « correctif minimal avant refonte ».

Ce que le dépôt dit déjà, n'y mettez pas : Claude lit le code.

Vérification : nouvelle session dans `demo-norrsken/`, `/context` liste votre fichier.

## Étape 2 — Le skill `/triage-bug` (15 min)

Créez `.claude/skills/triage-bug/SKILL.md` à partir du squelette. Description : ce qu'il fait, quand l'utiliser, avec les mots d'un signalement client. Corps, cinq étapes dans cet ordre :

1. Reproduire, par un script ou un test minimal. Lancer `pnpm test` d'abord et noter si les tests passent.
2. Localiser, en déléguant à un sous-agent explorateur (vous l'écrirez à l'étape 3 ; pour l'instant Claude en utilisera un intégré).
3. Expliquer la cause, fichier et ligne.
4. Proposer le correctif minimal, sans l'appliquer.
5. Lister les tests à écrire.

Lancez : `/triage-bug T-0417`.

Vérification : la reproduction montre un export PDF réduit à son titre ; la cause désigne un fichier de `src/export/` ; un diff est proposé ; les tests à écrire sont listés. Si Claude conclut « les tests passent, pas de bug », votre étape 1 du skill n'est pas assez ferme.

Appliquez le correctif proposé (dites-le à Claude), relancez `pnpm test`.

## Étape 3 — Le sous-agent `verif` (15 min)

Créez `.claude/agents/verif.md` à partir du squelette. Lecture seule : `tools: Read, Glob, Grep`. Sa mission : relire le diff, chercher les appelants des fonctions modifiées, signaler les régressions possibles et les tests manquants, terminer par « Prêt à proposer » ou « À reprendre ».

Lancez : « Utilise le sous-agent verif sur le correctif en cours. »

Vérification : le rapport tient en une page ; il signale qu'aucun test ne couvrait le contenu du PDF ; `/context` n'a grossi que du rapport. Écrivez le test manquant, relancez `pnpm test`.

## Étape 4 — Deux hooks (10 min)

Dans `.claude/settings.json`, à partir du squelette `hooks.json` :

- `PostToolUse` sur `Edit|Write` : un script qui lance `pnpm exec eslint --fix` sur le fichier édité s'il est en `.ts`, et renvoie la sortie.
- `PreToolUse` sur `Edit|Write` : un script à partir de `garde-fou.sh` qui refuse tout chemin contenant `migrations/`.

Rendez les scripts exécutables. Nouvelle session ; acceptez la confiance du dossier si demandée ; `/hooks` les liste.

Vérification : « Ajoute une colonne `couleur` à la table des créneaux. » La tentative d'édition dans `migrations/` est refusée avec votre message, et Claude propose autre chose.

## Étape 5 — Le plugin, chez le voisin (5 min)

Suivez `participants/squelettes/README-plugin.md` : un dossier `norrsken-dev/` avec `plugin.json`, vos `skills/`, `agents/`, `hooks/`. Un dossier `marketplace/` avec le `marketplace.json` du squelette.

Votre voisin, dans sa session : `/plugin marketplace add <votre dossier marketplace>` puis `/plugin install norrsken-dev@<nom du catalogue>`, portée projet.

Vérification : chez le voisin, `/norrsken-dev:triage-bug T-0422` traite le deuxième signalement d'export vide avec votre chaîne.

## Livrable

- Un dossier `.claude/` fonctionnel et un `CLAUDE.md`.
- Trois améliorations à faire la semaine prochaine, notées sur la fiche de clôture.

## Si ça ne marche pas

- **`/triage-bug` n'apparaît pas.** Chemin `.claude/skills/triage-bug/SKILL.md`, fichier en majuscules, session relancée.
- **Le sous-agent a modifié un fichier.** Sa ligne `tools` contient plus que `Read, Glob, Grep`.
- **Le hook ne bloque pas.** `/hooks` le liste-t-il ? Script exécutable ? Matcher exactement `Edit|Write` ?
- **Le hook linter renvoie « eslint introuvable ».** `pnpm install` dans `app/`. Si le temps manque, laissez : le hook fonctionne, c'est l'outil qui manque.
- **Le voisin ne voit pas le plugin.** `/reload-plugins`, puis `/plugin` onglet Erreurs.
