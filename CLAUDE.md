# Cours « Étendre Claude Code » — instructions de travail

Vault Obsidian contenant la préparation d'un cours de 3 h 30 sur les six mécanismes d'extension de Claude Code (CLAUDE.md, skills, sous-agents, MCP, hooks, plugins), destiné à une équipe de développeurs et une équipe commerciale/support réunies. Le plan de référence est `plan-cours-extensions-claude-code.md`. On le développe module par module, un module par conversation.

## État d'avancement

| Module | Notes | Script | Slides | TP | Illustrations | Cours |
|---|---|---|---|---|---|---|
| 0 Cadrage | fait | fait | 0.1–0.3 | démo | 0.3 | fait |
| 1 CLAUDE.md | fait | fait | 1.1–1.5 | tp-01 + démo | 1.1, 1.4 | fait |
| 2 Skills | fait | fait | 2.1–2.6 | tp-02 + démo | 2.1, 2.3 | fait |
| 3 Sous-agents | fait | fait | 3.1–3.4 | tp-03 | 3.1 | fait |
| 4 MCP | fait | fait | 4.1–4.4 | tp-04 + démo | 4.1 | fait |
| 5 Hooks | fait | fait | 5.1–5.5 | tp-05 + démo | 5.1 | fait |
| 6 Plugins | fait | fait | 6.1–6.3 | démo | 6.1 | fait |
| 7a/7b Ateliers | fait | fait | 7.1–7.4 | tp-07a, tp-07b + démo | 7.1 | fait (07-ateliers) |
| 8 Restitution | fait | fait | 8.1–8.5 | quiz | 8.1 | fait |
| 9 Clôture | fait | fait | 9.1–9.3 | fiche | 9.1 | fait |

Tous les modules sont écrits. Dettes ouvertes : le chemin du réglage MCP et l'emplacement du navigateur de plugins dans l'application de bureau, marqués « à vérifier » (modules 4 et 6) ; les filets « générés la veille » de `logistique/` à remplir lors de la répétition. Mettre ce tableau à jour à la fin de chaque module.

## Arborescence

```
plan-cours-extensions-claude-code.md   plan de référence, seul .md à la racine avec ce fichier
modules/NN-slug.md                     notes du formateur, un fichier par module (00 à 09, 07a/07b pour les ateliers)
scripts/NN-slug.md                     texte oral par slide, même nom que le module
supports/slides.md                     toutes les slides, une section « ## M.n — Titre » par slide
supports/figures/                      schémas (.md Mermaid + .svg), illustrations (.png) et leur prompt (.prompt.md), logo (logo.png, logo-512.png, favicon.png)
supports/README.md                     commandes de rendu Marp
cours/NN-slug.qmd                      le cours écrit, livre Quarto, un chapitre par module (07 regroupe les ateliers)
cours/_extraits/                       GÉNÉRÉ par cours/extraire.sh depuis demo-norrsken/ ; inclus par les chapitres, ne pas éditer
cours/README.md                        commandes de rendu Quarto et de publication
.github/workflows/publier.yml         GitHub Actions : rend cours + slides et publie sur https://remicastaing.github.io/formation-claude/ à chaque push sur main
style/redaction.md                     ton, structure des notes, des scripts, des slides, cas fictif
style/charte-graphique.md              couleurs, typographie, mise en page des images
style/illustrations.md                 gabarit du prompt d'illustration
style/theme.css                        thème Marp « norrsken »
participants/                          distribué tel quel : grille-declencheur-mecanisme.md, fiche-engagement.md, quiz-arbitrage.md, squelettes/
logistique/suivi-j15.md                canevas du point à quinze jours
logistique/quiz-reponses.md            réponses commentées du quiz ; jamais dans participants/
tp/tp-NN-slug.md                       travaux pratiques, un fichier par TP, distribué tel quel ; index dans tp/README.md
demo-norrsken/                         dépôt de démo cloné par les participants ; aucune note de cours dedans
demo-norrsken/support/                 tickets/, clients/, kb/, tarifs.md
demo-norrsken/.claude-cible/           config finale des ateliers (dev/, support/) ; renommée pour ne pas être chargée
demo-norrsken/marketplace/             catalogue de démo ; plugins/ GÉNÉRÉ par construire.sh depuis .claude-cible/, ne pas éditer
logistique/materiel.md                 checklist consolidée, une section par module
logistique/preparation-demo.md         démo d'ouverture : dossiers, réponses générées la veille
logistique/demos-formateur.md          démos du plan + variante « la salle n'a pas Claude » de chaque TP, avec filets
logistique/bugs-plantes.md             cause, correctif et tests des trois bugs de app/ ; jamais dans demo-norrsken/
```

## Où va quoi

- **Minutage, ce que fait le formateur, messages clés, pièges, questions fréquentes** → `modules/`.
- **Ce que le formateur dit, mot pour mot** → `scripts/`. Format dans `style/redaction.md`.
- **Tout texte projeté** → `supports/slides.md`. Ne pas dupliquer une slide dans un module.
- **Tout ce qu'un participant reçoit ou clone** → `participants/` ou `demo-norrsken/`. Jamais de réponse attendue ni de piège à ne pas révéler dans ces dossiers.
- **Contenu fictif Norrsken (tickets, fiches, articles KB, tarifs)** → `demo-norrsken/support/`, même s'il n'est cité que dans un module.
- **Configuration finale que les ateliers construisent** (CLAUDE.md, skills, agents, hooks, plugin) → `demo-norrsken/.claude-cible/dev/` ou `support/`.
- **Étapes d'un exercice que les participants suivent eux-mêmes** → `tp/`. Objectif, durée, prérequis, étapes numérotées avec vérification à chaque étape, section « si ça ne marche pas ». Le module renvoie au TP et ne répète pas les étapes.
- **Réponses attendues, versions générées, filets de secours, démos du formateur** → `logistique/`. Chaque TP a sa variante « la salle n'a pas Claude » dans `logistique/demos-formateur.md` : la salle dicte, le formateur tape, la salle juge.
- **Tout ce qui relève du style** (écriture, couleurs, images) → `style/`. Ne pas redire une règle de style dans un module.
- **Le cours écrit, lisible sans le formateur** → `cours/`. Plus détaillé que slides et script : il explique, montre les fichiers cibles en entier (par inclusion depuis `_extraits/`, jamais en copie), raconte la démo et dit ce que l'exercice doit faire observer. Structure d'un chapitre dans `style/redaction.md`.

## Prochaines étapes

1. Répétition complète sur la machine de projection : générer tous les filets « la veille » de `logistique/`, vérifier les deux points « à vérifier » de l'application de bureau, chronométrer chaque module.
2. Relecture de cohérence transversale faite le 6 septembre 2026 ; à refaire après toute modification d'un ticket, d'un tarif ou d'un fichier cible.

## Marche à suivre pour un module

1. Lire le plan, le module précédent dans `modules/`, et les trois fichiers de `style/`.
2. Vérifier contre https://code.claude.com/docs (via WebFetch) chaque affirmation sur le fonctionnement de Claude Code avant de l'écrire : chargement, événements, portées, syntaxe. Noter dans la réponse finale ce que la doc a changé par rapport au plan. Marquer « à vérifier » ce qui n'a pas pu l'être.
3. Écrire dans cet ordre : `modules/NN`, les slides dans `supports/slides.md` (ajoutées à la fin, dans l'ordre des modules), `scripts/NN`, le `tp/tp-NN` si le module a un exercice et sa variante démo dans `logistique/demos-formateur.md`, les fichiers cibles de `demo-norrsken/` et `participants/` que le module cite, la section du module dans `logistique/materiel.md`, puis le chapitre `cours/NN-slug.qmd` (ajouter à `cours/extraire.sh` tout fichier cible nouvellement cité).
4. Pour chaque illustration souhaitée (une slide sur trois au plus) : créer `supports/figures/<nom>.prompt.md` à partir du gabarit de `style/illustrations.md`, avec l'option de format qui correspond au placement, et insérer la référence dans la slide selon `style/charte-graphique.md`. L'image est générée par Rémi ; ne jamais recadrer ni retoucher une image générée : corriger le prompt et demander une régénération.
5. Rendre les slides en PNG et lire celles du module (commande dans `supports/README.md`). Utiliser un binaire `marp` installé, jamais `npx` qui reste suspendu. Lancer le rendu dans une commande séparée des éditions de fichiers. Rendre le cours avec `quarto render cours` et vérifier qu'aucune inclusion ne manque.
6. Mettre à jour le tableau d'état ci-dessus et les dettes ouvertes.

## Contraintes de cohérence

- La démo d'ouverture (Module 0) montre exactement le livrable de l'Atelier B. Toute modification de l'un se reporte sur l'autre.
- Les exemples dev et métier d'un même mécanisme illustrent le même point, pas deux points différents.
- Chaque mécanisme se rattache à l'une des trois questions (sait / connecté / automatiquement) et a un signal déclencheur en une phrase, écrit au tableau.
- « Une consigne demande, un hook garantit » est répété du Module 0 au quiz de clôture.
- Le tableau du nouveau collègue (slide 0.3) est canonique ; on réaffiche la slide, on ne le réécrit pas.
- Minutage : la somme des tranches d'un module égale sa durée dans le plan.
- Liens entre notes en wikilinks Obsidian sur le nom de fichier : `[[00-cadrage]]`, `[[slides]]`. Les fichiers de `scripts/` portent le même nom que ceux de `modules/` ; y renvoyer par le chemin en code, pas en wikilink.

## Façon de travailler dans ce vault

- Une commande shell par intention : éditer, puis vérifier, puis rendre. Jamais `rm` ou un rendu dans la même commande qu'une édition.
- Ne pas modifier les images `.png` de `supports/figures/`.
- Le vault entier est le dépôt public GitHub `remicastaing/formation-claude` (sauf `.gitignore`). Un push sur `main` publie automatiquement le cours et les slides. Commiter et pousser seulement quand Rémi le demande.
- Toute modification d'un fichier de `demo-norrsken/.claude-cible/` ou `demo-norrsken/support/` se propage au cours par `cours/extraire.sh` : ne jamais recopier leur contenu dans un chapitre.
- Rémi lit les fichiers dans Obsidian ; les réponses en chat sont courtes et pointent vers les fichiers.
