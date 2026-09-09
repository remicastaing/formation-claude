# Script oral — Module 1, CLAUDE.md et règles

Un bloc par slide. Déroulé, exercice et pièges dans [[01-claude-md]], slides dans [[slides]].

---

## Accroche (slide 0.3, ligne CLAUDE.md en gras)

**À dire**

Au tour de salle, quelqu'un a dit : « il utilise npm alors qu'on est sur pnpm ». Quelqu'un d'autre : « il tutoie le client ». Question : vous le lui avez dit combien de fois ? La réponse, c'est toujours « à chaque fois ». C'est le problème qu'on règle maintenant.

Retour sur le collègue. Première ligne : la fiche de poste. Celle qu'on donne une fois, et qu'il relit chaque matin.

**Récap**

- Reprendre une plainte de convention au tableau.
- « Vous lui avez dit combien de fois ? »
- Fiche de poste : donnée une fois, relue chaque matin.

---

## 1.1 — Ce qu'il sait sans qu'on le lui dise

**À dire**

Le fichier s'appelle CLAUDE.md. C'est du markdown : des titres, des puces, des phrases en français. Aucune syntaxe à apprendre. Claude le lit au début de chaque session, en entier.

C'est le seul des six mécanismes qui est toujours là. Ça a une conséquence directe : tout ce que vous y mettez coûte à chaque conversation, que ce soit utile ou non ce jour-là. Donc on y met ce dont il a besoin tout le temps, et rien d'autre.

Et une chose à comprendre dès maintenant : c'est une consigne, pas une barrière. Claude lit ce fichier comme il lirait un message de vous. Il s'y conforme, en général. Mais rien ne l'y force. Ce qui doit être garanti, ça ira dans un hook, Module 5. Je le répéterai.

**Récap**

- Markdown, lu en entier à chaque session.
- Seul mécanisme toujours actif, donc coût à chaque conversation.
- Consigne, pas barrière. Hook pour garantir.

---

## 1.2 — Trois niveaux qui s'additionnent

**À dire**

Il y a trois endroits où ce fichier peut vivre.

D'abord chez vous, dans votre dossier personnel. Ce fichier-là, vous seul le voyez, et il s'applique à tous vos projets. Vos préférences à vous.

Ensuite à la racine du projet ou du dossier de travail. Celui-là, toute l'équipe le voit, il voyage avec le dépôt. C'est là que vont les conventions partagées.

Enfin, un fichier local, à côté du précédent, qui reste sur votre poste. Vos réglages personnels sur ce projet précis.

Ils s'additionnent. Claude lit le vôtre, puis celui du projet, puis votre local. Rien n'écrase rien. Il existe aussi un niveau entreprise que l'informatique peut déployer sur tous les postes ; je le cite, on ne s'y attarde pas.

Combien de lignes ? Visez moins de deux cents. Au-delà, deux effets : le contexte se remplit, et Claude suit moins bien. Ce qui dépasse va ailleurs. Une procédure en plusieurs étapes, ce sera un skill, Module 2. Une règle qui ne concerne qu'une partie des fichiers, on la met dans un dossier de règles, avec en tête la liste des chemins concernés, et elle n'est chargée que quand Claude touche à ces fichiers. Voilà à quoi ça ressemble, dix secondes, on n'en fait pas plus.

Deux commandes à retenir. `/init` génère un premier fichier en analysant le projet. `/context` liste ce qui est réellement chargé dans la session : c'est le premier réflexe quand vous vous dites « il n'applique pas ma règle ».

**Récap**

- Perso partout, projet partagé, local sur ce projet. Additifs.
- Niveau entreprise : cité, pas développé.
- Moins de 200 lignes. Procédure → skill ; règle ciblée → `.claude/rules/` avec `paths`.
- `/init` pour démarrer, `/context` pour vérifier.

---

## Exemple dev (écran : `.claude-cible/dev/CLAUDE.md`)

**À dire**

Voici le CLAUDE.md du dépôt Norrsken. Je ne le lis pas, je vous montre quatre choses.

Une commande, pas une intention : « pnpm test avant chaque commit », pas « teste bien ».

Une convention qui diffère du défaut : pnpm et pas npm. Claude sait faire les deux, il faut lui dire laquelle. Ce qui est standard n'a pas besoin d'être écrit.

Un interdit écrit comme un interdit : « ne jamais modifier les migrations sans demander ». On y reviendra au Module 5 pour dire que cette ligne ne suffit pas.

Et ce qui n'y est pas. Pas d'arborescence complète, pas de liste de dépendances. Claude le déduit du code. Le fichier dit ce que le code ne dit pas.

Trente lignes.

**Récap**

- Commande exacte, pas intention.
- Convention qui diffère du défaut.
- Interdit formulé en interdit (et insuffisant seul, Module 5).
- Dit ce que le code ne dit pas. Trente lignes.

---

## Exemple métier (écran : `.claude-cible/support/CLAUDE.md`)

**À dire**

Même chose, autre métier. Le ton : vouvoiement, pas d'excuses vagues, une formule de clôture fixée. Les noms officiels : Norrsken Planning, les trois offres, jamais d'abréviation maison. Les délais : uniquement ceux du contrat, et une règle, ne jamais annoncer un délai qui n'est pas dans la liste. Et les interdits par écrit : remboursement, geste commercial, date de livraison.

Rappelez-vous la démo de tout à l'heure. Les trois premières corrections de la bonne réponse venaient de ce fichier. Et c'est l'équipe support qui l'aura écrit à la fin de l'atelier.

Pour ceux qui travaillent dans l'application de bureau : vous ouvrez le dossier support comme dossier de travail, et ce fichier est à sa racine, chargé au lancement. Pour les développeurs, une nuance : un CLAUDE.md dans un sous-dossier d'un projet plus large n'est chargé que quand Claude lit un fichier de ce sous-dossier.

**Récap**

- Ton, noms officiels, délais du contrat seulement, interdits par écrit.
- Lien avec la démo : trois corrections venaient d'ici.
- App desktop : ouvrir `support/` comme dossier de travail.
- Devs : sous-dossier chargé à la demande.

---

## 1.3 — Exercice : dix lignes

**À dire**

À vous. Dix lignes de CLAUDE.md pour votre contexte. Les développeurs pour le dépôt de démo, les personnes du métier pour le dossier support. Vous partez du squelette qui est dans votre dossier participants, il est rempli à moitié.

Quatre minutes pour remplir. Puis votre binôme relit, avec une seule question pour chaque ligne : « celle-là, tu la vérifies comment ? » Si vous ne savez pas répondre, la ligne est à réécrire.

Ensuite, lancez une session et posez une demande qui devrait faire jouer une de vos lignes. Si rien ne se passe, tapez `/context` et regardez si votre fichier est dans la liste.

À la fin, gardez une ligne qui a marché et une qui n'a pas marché. On en parle dans dix minutes.

**Récap**

- Squelette dans `participants/squelettes/`.
- 4 min remplir, relecture binôme : « tu la vérifies comment ? »
- 3 min tester ; `/context` si rien.
- Une ligne qui marche, une qui ne marche pas.
- Pendant ce temps : repérer les lignes en souhait pour le débrief.

---

## 1.4 et 1.5 — Souhait ou contrainte ?

**À dire**

*(slide 1.4, l'image : laisser regarder deux secondes)* À gauche, elle fait un geste vague. À droite, elle pointe une ligne. Vous avez tous vécu les deux.

*(slide 1.5)* J'ai relevé deux lignes en passant dans les rangs. *(les lire)*

Regardez le tableau. À gauche, des souhaits. À droite, des contraintes. « Essaie de garder les réponses courtes », contre « cent cinquante mots maximum ». « Fais attention aux migrations », contre « ne jamais modifier les migrations sans demander ». « Sois poli avec les clients », contre « vouvoiement, et cette formule de clôture ».

La différence : une contrainte se vérifie. On peut dire si elle a été respectée. Un souhait, non. Et Claude suit les contraintes bien mieux que les souhaits, précisément parce qu'elles sont vérifiables.

Le signal, celui qui vous dit « c'est une ligne de CLAUDE.md » : Claude se trompe deux fois sur la même convention. Une fois, c'est un hasard. Deux fois, c'est une ligne. Je l'écris au tableau à côté de la ligne CLAUDE.md.

Vous avez maintenant une fiche de poste. Mais on ne met pas la procédure de traitement d'un ticket dans une fiche de poste : elle fait trois pages et ne sert qu'une fois sur dix. C'est le Module 2.

**Récap**

- Lire deux lignes relevées pendant l'exercice.
- Contrainte = vérifiable ; Claude la suit mieux.
- Signal : deux fois la même erreur → une ligne. L'écrire au tableau.
- Transition : la procédure de trois pages, c'est un skill.
