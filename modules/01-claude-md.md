# Module 1 — Le contexte permanent : CLAUDE.md et règles

**Durée** : 25 min, tous ensemble.
**Plan général** : [[plan-cours-extensions-claude-code]] · Précédent : [[00-cadrage]] · Script oral : `scripts/01-claude-md.md` · Slides 1.1 à 1.5 dans [[slides]] · Matériel : [[materiel]].
**Objectif du module** : à la fin, chaque participant (1) sait ce qu'est CLAUDE.md, où il vit et quand il est lu ; (2) a écrit dix lignes pour son propre contexte et vérifié que Claude les applique ; (3) sait distinguer une contrainte d'un souhait, et sait quand une ligne n'a plus sa place dans CLAUDE.md.

C'est la « fiche de poste » du nouveau collègue. Première ligne du tableau de la slide 0.3, à réafficher en ouvrant.

---

## Déroulé minuté

| Min | Séquence | Format |
|---|---|---|
| 0–2 | Accroche : la plainte du tour de salle | Oral, tableau |
| 2–8 | Concept : quoi, où, quand, combien | Slides 1.1, 1.2 |
| 8–11 | Exemple dev : le CLAUDE.md du dépôt Norrsken | Écran, fichier ouvert |
| 11–13 | Exemple métier : le CLAUDE.md du dossier support | Écran, fichier ouvert |
| 13–23 | Exercice en binôme : dix lignes, puis vérification | Postes participants |
| 23–25 | Débrief : souhait vs contrainte, signal déclencheur | Slides 1.4, 1.5 |

---

## 0–2 min — Accroche

Reprendre au tableau une plainte du tour de salle qui relève d'une convention oubliée : « il utilise npm alors qu'on est sur pnpm », « il tutoie le client », « il appelle le produit Planner ». Poser la question : « Vous lui avez dit combien de fois ? » La réponse est toujours « à chaque fois ». C'est le problème que ce module règle.

Réafficher la slide 0.3 avec la ligne CLAUDE.md surlignée : la fiche de poste, celle qu'on donne une fois et qu'il relit chaque matin.

---

## 2–8 min — Concept

Slide 1.1 : *Ce qu'il sait sans qu'on le lui dise.*

**Ce que c'est.** Un fichier markdown, nommé `CLAUDE.md`, rédigé en langage courant. Claude le lit au début de chaque session. Pas de syntaxe à apprendre : des titres, des puces, des phrases.

**Quand il est lu.** Au lancement, en entier, à chaque session. C'est le seul des six mécanismes qui est toujours là. Conséquence directe : tout ce qu'on y met coûte à chaque conversation, qu'on en ait besoin ou non.

**Où il vit.** Trois niveaux qui s'empilent, du plus général au plus précis. Slide 1.2.

| Niveau | Fichier | Qui le voit |
|---|---|---|
| Moi, partout | `~/.claude/CLAUDE.md` | Moi seul, sur tous mes projets |
| Le projet | `CLAUDE.md` à la racine du dépôt ou du dossier | Toute l'équipe, via le dépôt |
| Moi, sur ce projet | `CLAUDE.local.md` à côté | Moi seul, non partagé |

Ils s'additionnent : Claude lit le mien, puis celui du projet, puis mon local. Rien n'écrase rien. Ce qui est lu en dernier est le plus proche de moi, donc le plus spécifique. Il existe aussi un niveau « entreprise » déployé par l'IT sur tous les postes ; le nommer, ne pas s'y attarder.

**Combien.** Viser moins de 200 lignes par fichier. Au-delà, deux effets : le contexte se remplit, et Claude suit moins bien. Ce qui dépasse va ailleurs :

- une procédure en plusieurs étapes → un skill (Module 2) ;
- une règle qui ne concerne qu'une partie des fichiers → `.claude/rules/`, un fichier par sujet, avec en tête une liste de chemins ; la règle n'est chargée que quand Claude touche à ces fichiers.

Montrer un exemple de règle ciblée en dix secondes, sans l'expliquer davantage :

```markdown
---
paths:
  - "src/api/**/*.ts"
---
Toute route API valide ses entrées et renvoie le format d'erreur standard.
```

**Ce que ce n'est pas.** Une consigne, pas une barrière. Claude lit CLAUDE.md comme il lirait un message de vous : il s'y conforme, en général, mais rien ne l'y force. Ce qui doit être garanti va dans un hook (Module 5). Le redire ici, en une phrase, parce que la moitié des erreurs classiques vient de là.

**Deux commandes à retenir.** `/init` génère un premier CLAUDE.md en analysant le projet ; `/context` liste les fichiers effectivement chargés dans la session, ce qui est le premier réflexe quand « il n'applique pas ma règle ».

---

## 8–11 min — Exemple dev

Ouvrir `demo-norrsken/.claude-cible/dev/CLAUDE.md` à l'écran. Ne pas le lire ligne à ligne : pointer quatre choses.

1. **Une commande, pas une intention.** « `pnpm test` avant chaque commit », pas « teste bien ».
2. **Une convention qui diffère du défaut.** `pnpm` et non `npm` : Claude sait faire les deux, il faut lui dire laquelle. Ce qui est standard n'a pas besoin d'être écrit.
3. **Un interdit formulé comme un interdit.** « Ne jamais modifier `migrations/` sans demander. » On y reviendra au Module 5 pour dire que cette ligne ne suffit pas.
4. **Ce qui n'y est pas.** Pas d'arborescence complète, pas de liste de dépendances : Claude le déduit du code. Le fichier dit ce que le code ne dit pas.

Faire remarquer la taille : une trentaine de lignes.

---

## 11–13 min — Exemple métier

Ouvrir `demo-norrsken/.claude-cible/support/CLAUDE.md`. Même structure, autre métier.

- Le ton : vouvoiement, pas d'excuses vagues, une formule de clôture fixée.
- Les noms officiels : Norrsken Planning, les trois offres, jamais d'abréviation maison.
- Les délais : ce qu'on s'engage à tenir par contrat, et la règle « ne jamais annoncer un délai qui n'est pas dans cette liste ».
- Les interdits par écrit : remboursement, geste commercial, date de livraison d'une fonctionnalité.

Relier à la démo du Module 0 : les trois premières corrections de la réponse configurée venaient de ce fichier. Le support l'aura écrit lui-même à la fin de l'Atelier B.

Pour les participants qui travaillent dans l'app desktop : ils ouvrent le dossier `support/` comme dossier de travail, et ce CLAUDE.md est alors à la racine, chargé au lancement. Nuance pour les devs, à dire en une phrase : un CLAUDE.md dans un sous-dossier d'un projet plus large n'est chargé que quand Claude lit un fichier de ce sous-dossier.

---

## 13–23 min — Exercice en binôme

Consigne, slide 1.3. Les étapes détaillées sont dans [[tp-01-claude-md]], distribué aux participants ; le formateur ne les redit pas, il projette la slide et lance le chrono.

Ce que le formateur fait pendant ce temps : passer dans les rangs et repérer les lignes formulées en souhait. Il en note deux ou trois pour le débrief, sans les corriger sur place. Si un binôme sèche sur la demande de test, les exemples sont dans le TP.

Si la salle n'a pas Claude Code : version démo dictée dans [[demos-formateur]], même durée.

---

## 23–25 min — Débrief

Slides 1.4 et 1.5 : *Souhait ou contrainte ?* L'image d'abord, sans commentaire, puis le tableau.

Lire deux lignes relevées pendant l'exercice, côte à côte :

| Souhait | Contrainte |
|---|---|
| « Essaie de garder les réponses courtes » | « Réponses de 150 mots maximum » |
| « Fais attention aux migrations » | « Ne jamais modifier `migrations/` sans demander » |
| « Sois poli avec les clients » | « Vouvoiement systématique. Formule de clôture : "Nous restons à votre disposition." » |

Une contrainte se vérifie : on peut dire si elle a été respectée ou non. Un souhait, non. Claude suit les contraintes bien mieux que les souhaits, précisément parce qu'elles sont vérifiables.

**Le signal déclencheur**, à écrire au tableau à côté de la ligne CLAUDE.md : *Claude se trompe deux fois sur la même convention.* Une fois, c'est un hasard. Deux fois, c'est une ligne.

**Transition** : « Vous avez maintenant une fiche de poste. Mais on ne met pas la procédure de traitement d'un ticket dans une fiche de poste : elle fait trois pages et ne sert qu'une fois sur dix. C'est le Module 2. »

---

## Supports

Slides 1.1 à 1.5 dans [[slides]]. Fichiers ouverts à l'écran : les deux CLAUDE.md cibles dans `demo-norrsken/.claude-cible/`.

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à ce module :

- `demo-norrsken/.claude-cible/dev/CLAUDE.md` et `.claude-cible/support/CLAUDE.md`, testés.
- `participants/squelettes/CLAUDE.md`, pré-rempli à 50 %, en deux variantes ou avec les deux blocs.
- Le ticket T-0402 pour le test métier (à créer avec les tickets de l'Atelier B).
- Dépôt de démo sans `CLAUDE.md` à la racine au moment de l'exercice : les participants doivent partir du squelette, pas trouver le fichier cible.

---

## Pièges et questions fréquentes

**« Il ne suit pas ma ligne. »** Dans l'ordre : `/context` pour vérifier que le fichier est chargé ; la ligne est-elle une contrainte ou un souhait ; deux lignes se contredisent-elles quelque part, y compris entre le fichier utilisateur et le fichier projet. Si la ligne est un « toujours faire X avant Y », c'est un hook, pas une ligne.

**« Est-ce que Claude retient ce que je lui dis en conversation ? »** Deux choses distinctes. CLAUDE.md, c'est vous qui l'écrivez. À côté, Claude tient sa propre mémoire automatique : des notes qu'il prend sur vos corrections et préférences, dans un dossier à lui, consultable avec `/memory`. Pour une convention d'équipe, on n'attend pas qu'il la note : on l'écrit dans CLAUDE.md, qui est partagé et relu par tout le monde.

**« Je mets tout dans le CLAUDE.md utilisateur pour être tranquille ? »** Non : ce qui concerne le projet va dans celui du projet, sinon le collègue ne l'a pas. Le fichier utilisateur, c'est vos préférences à vous, sur tous vos projets.

**« On peut mettre des commentaires ? »** Oui, les commentaires HTML `<!-- -->` sont retirés avant lecture et ne coûtent rien. Utile pour laisser une note aux mainteneurs du fichier.

**Dérive à éviter** : un dev qui commence à écrire un CLAUDE.md de 150 lignes pendant l'exercice, avec l'arborescence du projet. Rappeler : dix lignes, et ce que le code ne dit pas.

**Dérive à éviter** : un binôme métier qui teste sans avoir sauvegardé le fichier, ou qui l'a créé hors du dossier de travail. `/context` tranche en dix secondes.
