# TP 1 — Dix lignes de CLAUDE.md

**Durée** : 10 minutes, en binôme dev + métier. Chacun écrit le sien, on se relit mutuellement.
**Objectif** : écrire dix lignes que Claude appliquera à chaque session, et vérifier qu'il les applique.

## Prérequis

- Claude Code ouvert (terminal ou application de bureau) sur votre dossier de travail :
  - développeurs : la racine du dépôt `demo-norrsken/` ;
  - commerciaux et support : le dossier `demo-norrsken/support/`.
- Le squelette `participants/squelettes/CLAUDE.md` sous la main.

## Étapes

### 1. Créer le fichier (1 min)

Copiez le squelette à la racine de votre dossier de travail, sous le nom exact `CLAUDE.md`.

Vérification : le fichier apparaît à côté des autres fichiers du dossier, pas dans un sous-dossier.

### 2. Remplir dix lignes (4 min)

Remplacez chaque `<…>` du squelette par une ligne qui vous concerne. Gardez les titres. Dix lignes, pas plus : ce qui dépasse ira ailleurs dans la journée.

Trois règles pour chaque ligne :

- Elle dit ce que le code ou les documents ne disent pas déjà.
- Elle diffère de ce que Claude ferait spontanément.
- On peut dire, en lisant une réponse, si elle a été respectée ou non.

Développeurs, pistes : le gestionnaire de paquets, la commande de test, un dossier à ne pas toucher, le format des messages de commit.

Support et commercial, pistes : vouvoiement ou tutoiement, le nom exact du produit, ce qu'on ne promet jamais par écrit, la formule de clôture.

### 3. Relecture croisée (1 min)

Votre binôme lit vos dix lignes et pose une seule question pour chacune : « celle-là, tu la vérifies comment ? » Si vous ne savez pas répondre, réécrivez la ligne.

### 4. Tester une ligne (3 min)

Enregistrez le fichier. Dans Claude Code, lancez une nouvelle session, puis posez une demande qui devrait faire jouer une de vos lignes.

Exemples de demandes :

- développeurs : « Ajoute un test pour la fonction d'export. »
- support : « Réponds au ticket `tickets/T-0402.md`. »

Vérification : la réponse respecte la ligne visée. Regardez précisément : la commande utilisée, le vouvoiement, le nom du produit, la formule de clôture.

### 5. Garder deux lignes (1 min)

Notez sur votre feuille une ligne qui a été respectée et une qui ne l'a pas été. On en parle tout de suite après.

## Si ça ne marche pas

- **Claude ignore le fichier.** Tapez `/context` dans la session. Votre `CLAUDE.md` doit apparaître dans la liste des fichiers mémoire. S'il n'y est pas : mauvais dossier, mauvais nom, ou fichier non enregistré. Corrigez et relancez une nouvelle session.
- **Le fichier est chargé mais la ligne n'est pas suivie.** Relisez-la : est-ce une contrainte vérifiable ou un souhait ? « Sois concis » ne se vérifie pas ; « 150 mots maximum » oui.
- **Deux lignes se contredisent.** Claude en choisit une au hasard. Supprimez-en une.
- **Vous ne trouvez pas le squelette.** Demandez-le au dev référent de votre table.
