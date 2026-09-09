# Style de rédaction

S'applique à tout ce qui est écrit dans le vault : notes de module, scripts oraux, slides, contenu du dépôt de démo, documents participants.

## Langue et ton

- Français. Typographie française : espace insécable avant `:` `;` `?` `!`, guillemets « ».
- Ce qui est dit à la salle est à la deuxième personne du pluriel. Ce qui est dit au formateur est à l'infinitif ou à l'impératif (« Réafficher la slide 0.3 »).
- Direct. Une idée par phrase. Pas de tiret cadratin pour une incise, pas de parenthèse explicative dans un texte oral.
- Le formateur est « le formateur », jamais « je » dans les notes de module. Dans les scripts oraux, « je » est autorisé puisque c'est lui qui parle.

## Notes de module (`modules/`)

En-tête fixe : durée, format, ligne de liens (plan, précédent, script oral, slides, matériel), objectif en trois points numérotés. Puis :

1. `## Déroulé minuté` : tableau Min / Séquence / Format. La somme des tranches égale la durée du plan.
2. Une section `## a–b min — Titre` par tranche, avec ce que le formateur fait et dit en substance, les messages clés en gras, les tableaux de comparaison.
3. `## Supports` : renvoi aux slides et figures, deux lignes.
4. `## Matériel à préparer` : renvoi à `logistique/materiel.md` plus la liste propre au module.
5. `## Pièges et questions fréquentes` : chaque entrée commence par la question ou le piège en gras.

Ce qui n'y va pas : le texte oral mot pour mot (→ scripts), le contenu des slides (→ slides), le contenu fictif Norrsken (→ demo-norrsken), les réponses attendues (→ logistique).

## Scripts oraux (`scripts/`)

Même nom de fichier que le module. Un bloc `## slide` par slide, dans l'ordre de projection, plus un bloc pour chaque séquence sans slide (démo, transition), signalée par *(pas de slide)* ou *(écran partagé)*.

Chaque bloc :

- `**À dire**` : phrases orales, lisibles d'une traite sans reformuler. Pas de puces, pas de code, pas de nom de fichier sauf s'il est prononcé. Les indications de jeu entre parenthèses et en italique : *(laisser la salle trouver)*.
- `**Récap**` : trois à six puces pense-bête, télégraphiques, qui permettent de reprendre le fil si on lâche le texte.

Le script ne répète ni le minutage ni les pièges.

## Slides (`supports/slides.md`)

- Une slide = une section `## M.n — Titre`, séparée par `---`. `M` est le numéro du module, `n` l'ordre dans le module. On renumérote si on insère.
- Une idée par slide. Six lignes de texte maximum hors tableau. Un tableau de six lignes maximum ; au-delà, deux slides.
- Pas de nom de mécanisme sur les slides du Module 0 avant la 0.3.
- Le tableau du nouveau collègue est canonique en 0.3 ; on ne le réécrit pas ailleurs, on réaffiche la slide.
- Une slide qui porte une illustration pleine largeur ne porte rien d'autre que son titre.

## Cours écrit (`cours/`)

Un chapitre Quarto par module, même numérotation. Il se lit sans le formateur et sans les slides ; il est plus long qu'eux, jamais plus vague. Structure fixe :

1. Le signal du mécanisme en tête, dans un bloc `.signal`.
2. `## Le problème` : la situation vécue qui motive le mécanisme, avec l'image du collègue et l'illustration du module.
3. `## Le concept` : le fonctionnement réel, vérifié contre la doc, y compris les nuances que les slides taisent (chargement des sous-dossiers, budget des descriptions, confiance du dossier).
4. `## Exemple côté code` et `## Exemple côté métier` : les fichiers cibles **inclus** depuis `_extraits/` avec `{{< include >}}`, suivis de ce qu'il faut y voir.
5. `## La démo` ou `## L'exercice` : racontés, avec ce qu'on doit observer et pourquoi ; renvoi au TP pour les étapes.
6. `## Pièges` : les questions fréquentes du module, en réponses courtes.
7. `## À retenir` : quatre à six puces, le signal en dernier.

Ton : même registre que les notes, deuxième personne du pluriel quand on s'adresse au lecteur, jamais « je ». Les chapitres 0, 7, 8, 9 adaptent la structure (pas de mécanisme unique).

## Cas fictif Norrsken

- PME **Norrsken**, produit **Norrsken Planning** (jamais « Planner »). Offres **Essentiel**, **Pro**, **Atelier+**.
- Personnes et entités existantes, à réutiliser avant d'en créer : cinq clients dans `demo-norrsken/support/clients/` (Atelier Brossard / Léa Brossard, Pro ; Boulangerie Marchetti, Essentiel ; Cabinet Delorme Architectes, Pro ; Serres Vauclin, Atelier+ ; Garage Petitjean, Essentiel), deux chargés de compte (Thomas Renaud, Sarah Benali), 21 tickets T-0298 à T-0431 dans `support/tickets/`, deux concurrents fictifs (Plannio, Ateliero). Les employés de la fixture : Nadia, Karim, Sofia.
- Numérotation des tickets `T-NNNN`. Dates en 2026.
- Aucune personne, entreprise ou marque réelle.

## Formulations fil rouge

À répéter telles quelles, elles servent d'ancrage :

- Les trois questions : ce qu'il **sait**, à quoi il est **connecté**, ce qui se passe **automatiquement**.
- « Une consigne demande, un hook garantit. »
- Le signal déclencheur de chaque mécanisme, formulé en une phrase, écrit au tableau à côté de la ligne du collègue.
- « Ce que vous venez de voir, vous l'aurez construit à seize heures. »
