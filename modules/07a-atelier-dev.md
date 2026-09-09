# Module 7a — Atelier développeurs : « du bug au correctif audité »

**Durée** : 60 min, en parallèle de [[07b-atelier-metier]].
**Plan général** : [[plan-cours-extensions-claude-code]] · Précédent : [[06-plugins]] · Script oral : `scripts/07a-atelier-dev.md` · Slides 7.1, 7.2, 7.4 dans [[slides]] · TP : [[tp-07a-atelier-dev]] · Réponses : [[bugs-plantes]] · Matériel : [[materiel]].
**Objectif de l'atelier** : à la fin, chaque binôme (1) a un dossier `.claude/` fonctionnel sur le dépôt Norrsken : CLAUDE.md, skill `/triage-bug`, sous-agent `verif`, deux hooks ; (2) a trouvé et corrigé au moins un des bugs plantés avec cette chaîne ; (3) a empaqueté le tout en plugin et l'a installé sur le poste du voisin.

Le livrable de référence est `demo-norrsken/.claude-cible/dev/`. Les participants ne l'ont pas ; ils partent des squelettes.

---

## Déroulé minuté

| Min | Étape | Livrable | Point de contrôle |
|---|---|---|---|
| 0–5 | Lancement commun, placement, règle du clavier | | Slide 7.1 |
| 5–15 | 1. CLAUDE.md du dépôt | `CLAUDE.md` | `/context` le liste |
| 15–30 | 2. Skill `/triage-bug` sur T-0417 | `.claude/skills/triage-bug/SKILL.md` | Reproduction + cause + diff proposé |
| 30–45 | 3. Sous-agent `verif` sur le correctif | `.claude/agents/verif.md` | Rapport : régressions, tests manquants |
| 45–55 | 4. Hooks : linter et migrations | `.claude/settings.json`, `hooks/` | Tentative d'édition dans `migrations/` refusée |
| 55–60 | 5. Plugin, installation chez le voisin | `norrsken-dev/` | `/norrsken-dev:triage-bug` chez le voisin |

Le minutage est celui du TP. L'étape 2 est la plus longue et la plus importante : si elle déborde, on raccourcit la 5, pas la 3.

---

## Rôle du formateur

Un formateur dev anime cet atelier pendant que l'autre anime l'atelier métier. S'il n'y a qu'un formateur : il lance les deux ateliers ensemble (slide 7.1), passe dix minutes de chaque côté en alternance, et s'appuie sur les dev référents des tables métier pour le déblocage technique là-bas.

Ce qu'il fait à chaque étape :

- **Étape 1.** Vérifier que les binômes écrivent des contraintes, pas l'arborescence. Le dépôt en dit déjà long ; le CLAUDE.md dit ce que le code ne dit pas : `pnpm`, tests avant commit, migrations interdites, correctif minimal avant refonte.
- **Étape 2.** C'est le cœur. Le ticket T-0417 décrit un export PDF vide. Les tests passent tous : le faire remarquer aux binômes qui s'arrêtent à « les tests sont verts ». Le skill doit d'abord *reproduire*, et c'est la reproduction qui montre que le PDF ne contient que son titre. Cause et correctif dans [[bugs-plantes]] ; ne les donner qu'à un binôme bloqué depuis cinq minutes.
- **Étape 3.** Le sous-agent doit être en lecture seule. Vérifier la ligne `tools`. Le rapport doit signaler le test manquant : il n'y avait aucun test sur le contenu du PDF. C'est le moment de dire : « le bug était là depuis la 4.5 parce que personne ne testait ce que le PDF contient ».
- **Étape 4.** Le hook sur les migrations se teste en demandant à Claude d'ajouter une colonne : la tentative doit être refusée avec un message. Le hook linter demande `pnpm install` pour ESLint ; s'il n'est pas installé, le hook renvoie l'erreur d'ESLint absent et c'est acceptable de le dire.
- **Étape 5.** Le voisin installe depuis le dossier du binôme, portée projet, et lance `/norrsken-dev:triage-bug T-0422`. C'est le deuxième bug d'export, sur un autre client : la même chaîne doit le traiter.

---

## Bugs disponibles

Trois bugs sont plantés dans `demo-norrsken/app/`, chacun relié à un ticket du corpus. Tous les tests passent malgré eux. Détail, cause et correctif dans [[bugs-plantes]].

| Ticket | Symptôme | Module |
|---|---|---|
| T-0417, T-0422, T-0298 | Export PDF vide | `src/export/` |
| T-0416, et l'exemple métier | Date limite de diagnostic fausse quand elle passe un week-end | `src/domain/sla.ts` |
| T-0405 | Deux remises cumulées sur une facture | `src/domain/tarifs.ts` |

L'atelier travaille sur le premier. Un binôme rapide prend le deuxième à l'étape 5 à la place de l'installation croisée.

---

## Si la salle n'a pas Claude Code

Un seul atelier piloté par le formateur, décrit dans [[demos-formateur]] : les tables dev produisent le CLAUDE.md et la checklist du skill sur papier, le formateur assemble et exécute. Trente minutes, puis le temps rendu au Module 8.

---

## Supports

Slides 7.1 (règles communes), 7.2 (les cinq étapes A), 7.4 (livrable) dans [[slides]].

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à cet atelier :

- `demo-norrsken/app/` cloné sur chaque poste dev, `pnpm test` vert, `pnpm install` fait pour ESLint, `jq` présent.
- Squelettes : `CLAUDE.md`, `SKILL.md`, `agent.md`, `hooks.json`, `garde-fou.sh`, `plugin.json`, `marketplace.json`, `README-plugin.md`.
- Le dépôt distribué **sans** `.claude/` ni `CLAUDE.md` à la racine.
- [[bugs-plantes]] imprimé pour le formateur seulement.

---

## Pièges et questions fréquentes

**« Les tests passent, il n'y a pas de bug. »** Reproduire d'abord. Le ticket dit ce que le client voit ; le test dit ce que le développeur a pensé à vérifier. Ici, personne n'a testé le contenu du PDF.

**« Claude a appliqué le correctif sans demander. »** Le skill doit dire « ne pas appliquer sans confirmation ». Si la ligne manque, l'ajouter : c'est exactement le genre de contrainte du Module 1.

**« Le sous-agent a modifié un fichier. »** Sa ligne `tools` contient `Edit` ou `Write`, ou est absente. En lecture seule : `Read, Glob, Grep` et rien d'autre.

**« Le hook bloque aussi la lecture des migrations. »** Non : `PreToolUse` sur `Edit|Write` ne touche pas à `Read`. Si la lecture est bloquée, le matcher est `*`.

**« On met le CLAUDE.md dans le plugin ? »** Non, un plugin ne le contient pas. Il vit dans le dépôt. Le plugin porte les skills, l'agent, les hooks.

**« Le voisin voit `/triage-bug` et `/norrsken-dev:triage-bug`. »** Il a encore son propre `.claude/skills/triage-bug/`. Normal ; on ne supprime rien en atelier.

**Dérive à éviter** : un binôme qui réécrit `exportPdf` proprement avec une bibliothèque. Correctif minimal, c'est dans le CLAUDE.md qu'ils viennent d'écrire.
