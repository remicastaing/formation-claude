# TP 2 — Construire son premier skill

**Durée** : 15 minutes, en suivant le formateur étape par étape.
**Objectif** : créer un skill d'action, le tester sur trois demandes, et corriger sa description quand il ne se déclenche pas.

Deux variantes, mêmes étapes : `/reponse-ticket` pour le support et le commercial, `/review` pour les développeurs qui préfèrent. Le formateur construit `/reponse-ticket`.

## Prérequis

- Le TP 1 terminé : votre `CLAUDE.md` est en place et chargé.
- Claude Code ouvert sur votre dossier de travail (`support/` ou la racine du dépôt).
- Le squelette `participants/squelettes/SKILL.md`.

## Étapes

### 1. Le dossier et le fichier (3 min)

Dans votre dossier de travail, créez `.claude/skills/reponse-ticket/` (ou `.claude/skills/review/`), puis copiez-y le squelette sous le nom exact `SKILL.md`.

Remplissez l'en-tête. Pour le nom, le nom du dossier. Pour la description, écrivez d'abord la version courte, celle que le formateur tape : « Rédige la réponse à un ticket support. » (dev : « Relis un diff avant de le proposer. »)

Vérification : le chemin complet est `.claude/skills/<nom>/SKILL.md`. Pas `.claude/<nom>.md`.

### 2. Le corps (2 min)

Douze lignes au plus. Pour `/reponse-ticket` :

1. Classer la demande : bug, question ou facturation.
2. Lire la fiche du client dans `clients/` avant d'écrire.
3. Rédiger dans le ton de `CLAUDE.md`.
4. Si un article de `kb/` répond à la question ou donne un contournement, le proposer.
5. Si la demande touche à un montant, ne rien promettre et renvoyer au chargé de compte.

Pour `/review` : la checklist que vous appliquez à chaque relecture, un point par ligne, chaque point vérifiable.

### 3. Première demande (3 min)

Nouvelle session. Tapez, en suivant le formateur : « Prépare la réponse au ticket T-0417. » (dev : « Relis le diff courant. »)

Vérification : la réponse suit votre corps point par point. Pour le support : un classement, la fiche client lue, un article proposé.

### 4. Deuxième demande (3 min)

Même session. Tapez : « Léa Brossard nous demande comment partager un planning avec un sous-traitant, tu lui réponds quoi ? » (dev : « Jette un œil à ce que j'ai changé avant que je pousse. »)

Regardez la réponse. Est-ce que le classement est là ? L'article ? Notez ce qui manque. On en parle au débrief.

### 5. Corriger la description et relancer (2 min)

Réécrivez la description en trois parties : ce que le skill fait ; quand l'utiliser, avec les mots que vous employez vraiment quand vous parlez d'un client qui écrit ; ce qu'il ne fait pas.

Enregistrez. Nouvelle session. Retapez la deuxième demande mot pour mot.

Vérification : cette fois, le skill se déclenche.

### 6. Troisième demande (2 min)

Tapez : « Réponds à la réclamation de Brossard sur la facture. » (dev : « Relis la PR 42. »)

Vérification : classement « facturation », et la question du montant renvoyée au chargé de compte. Cette dernière règle vient de votre CLAUDE.md, pas du skill : les deux jouent ensemble.

## Si ça ne marche pas

- **Le skill n'apparaît pas quand vous tapez `/`.** Tapez `/skills` pour lister ce que Claude voit. S'il n'y est pas : le chemin, le nom du fichier en majuscules, ou la session ouverte avant la création du fichier. Relancez une session.
- **Il apparaît mais ne se déclenche pas sur une demande.** Tapez `/reponse-ticket` à la main : si ça marche, c'est la description. Ajoutez-y les mots de la demande qui n'a pas déclenché.
- **Il se déclenche sur tout.** Description trop large. Retirez les mots génériques (« aide », « support », « client » seul).
- **L'en-tête est refusé ou ignoré.** Les deux lignes `---` doivent être la toute première et encadrer l'en-tête ; pas de ligne vide avant la première.
