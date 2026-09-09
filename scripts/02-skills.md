# Script oral — Module 2, Skills

Un bloc par slide. Déroulé, démo et pièges dans [[02-skills]], slides dans [[slides]], TP dans [[tp-02-reponse-ticket]].

---

## Accroche (slide 0.3, ligne Skills en gras)

**À dire**

Je vous ai laissés sur une question. On ne met pas la procédure de traitement d'un ticket dans la fiche de poste. Elle fait trois pages, elle ne sert qu'une fois sur dix. Alors où va-t-elle ?

Autre question, pour les développeurs. Qui a déjà retapé le même prompt de revue de code trois fois dans la même semaine ? Gardez la main levée une seconde. C'est le signal de ce module.

Retour au collègue, deuxième ligne. Les procédures qu'il consulte quand il en a besoin. Pas celles qu'il connaît par cœur : celles qu'il va chercher.

**Récap**

- La procédure de trois pages : où ?
- Mains levées : même prompt retapé trois fois.
- Ligne 2 : procédures consultées, pas apprises.

---

## 2.1 — Un dossier, un fichier

**À dire**

Un skill, c'est un dossier. Il porte le nom du skill, il est rangé dans un dossier `.claude/skills/` à la racine de votre dossier de travail, et il contient un fichier qui s'appelle SKILL.md, en majuscules.

Dans ce fichier, deux parties. En tête, entre deux lignes de tirets, un nom et une description. En dessous, le corps : ce que Claude doit faire ou savoir, écrit en français, comme vous l'écririez pour un collègue.

Le dossier peut contenir d'autres fichiers. Un exemple de réponse, une grille complète, un script. Le corps y renvoie par un lien, et ils ne sont lus que si Claude suit ce lien.

Où ça vit ? Comme la fiche de poste : chez vous pour tous vos projets, ou dans le projet. Pour l'équipe support, qui travaille dans le dossier support, ce sera `support/.claude/skills/`.

**Récap**

- Dossier au nom du skill, dans `.claude/skills/`, fichier `SKILL.md`.
- En-tête : nom, description. Corps : la procédure ou le savoir.
- Fichiers à côté, lus seulement si lien suivi.
- Support : `support/.claude/skills/`.

---

## 2.2 — Deux natures, un format

**À dire**

Il y a deux façons d'utiliser un skill, et c'est le même fichier.

La première, c'est la référence. Un savoir que Claude applique pendant toute la session. La grille tarifaire. Le guide de style de l'API. On ne le lance pas : Claude le charge lui-même quand le sujet arrive, et il s'en sert jusqu'à la fin.

La seconde, c'est l'action. Une procédure qu'on lance en tapant son nom précédé d'une barre oblique. Réponse à un ticket. Revue de code. Claude peut aussi la déclencher tout seul s'il juge que c'est le moment.

Une ligne d'en-tête change ça. Pour tout skill qui a des effets de bord, qui envoie, qui publie, qui déploie, on écrit « disable-model-invocation: true ». Ça veut dire : seulement si un humain tape la commande. Jamais de sa propre initiative.

**Récap**

- Référence : savoir chargé quand le sujet arrive, appliqué toute la session.
- Action : `/nom`, ou déclenché par Claude.
- Effets de bord → `disable-model-invocation: true`.

---

## 2.3 — Ce qui est lu, et quand

**À dire**

Voilà le point qui explique tout le reste du module. Écoutez bien.

Au démarrage d'une session, Claude ne lit que la description de chaque skill. Toutes les descriptions, de tous les skills, mais rien d'autre. Le corps du skill, il ne le lit que si le skill est déclenché. Et à ce moment-là, le corps entre dans la conversation et y reste jusqu'à la fin.

Deux conséquences.

Un. La description décide. C'est la seule chose que Claude voit avant de choisir. Si elle est vague, le skill n'est jamais déclenché. Si elle est trop large, il se déclenche à tort. Vous allez le voir dans dix minutes, en direct.

Deux. Un skill qu'on n'utilise pas coûte une ligne. Une seule. Alors qu'une fiche de poste de six cents lignes coûte six cents lignes à chaque session. C'est exactement pour ça qu'on sort les procédures de CLAUDE.md et qu'on les met dans des skills.

Pour les développeurs, une précision : la liste des descriptions a un budget, à peu près un pour cent du contexte. Au-delà, les descriptions des skills les moins utilisés sont tronquées. Il y a une commande pour voir ce que coûte chacun. On en reparle en fin de journée.

Pour lancer un skill : barre oblique, le nom, et éventuellement des arguments derrière. Dans le corps, un mot-clé récupère ce que vous avez tapé après le nom. Et pour ceux qui connaissaient les anciennes commandes, elles sont devenues des skills. Même nom, même barre oblique. On n'en crée plus.

**Récap**

- Démarrage : descriptions seulement. Déclenchement : le corps, qui reste.
- La description décide.
- Skill inutilisé = une ligne. CLAUDE.md = tout, à chaque fois.
- Budget ~1 % du contexte, `/skill-doctor`. Module 8.
- `/nom args`, `$ARGUMENTS`. Anciennes commandes = skills.

---

## Exemple dev (écran : `review/SKILL.md`)

**À dire**

Le skill de revue du dépôt Norrsken. Trois choses.

La description dit quand. « Relire un diff ou une PR avant de la proposer. » Pas « outil de revue de code ».

Le corps est une checklist. Sécurité, tests, nommage, migrations. Chaque point se vérifie. C'est la règle du Module 1, à l'échelle d'une procédure.

Et la dernière ligne : si on tape un numéro après le nom, il relit cette PR-là. Sinon, le diff courant. Une ligne.

Cette checklist, c'est celle que vous retapiez trois fois par semaine.

**Récap**

- Description : quand, pas quoi.
- Corps : checklist vérifiable.
- `$ARGUMENTS` : numéro de PR ou diff courant.

---

## Exemple métier (écran : `produits-et-tarifs/SKILL.md`)

**À dire**

Côté support, un skill de référence. Pas de barre oblique, pas de procédure. Les trois offres, les prix, les deux remises et la règle qui dit qu'on ne les cumule jamais, et les délais par offre.

Claude le charge quand un ticket parle de prix ou de délai. Et à partir de là, il n'invente plus. Rappelez-vous la démo de ce matin : le « deux jours ouvrés » de la bonne réponse, il vient de cette ligne-là, SLA de l'offre Pro.

Il y en a un autre que je ne vous montre pas, pour les commerciaux : des notes brutes de rendez-vous en entrée, un compte rendu structuré avec les prochaines actions en sortie. Même mécanique, autre métier. Il sera dans le kit du Module 6.

**Récap**

- Référence : offres, prix, remises non cumulables, SLA.
- Chargé quand le sujet arrive ; plus d'invention.
- Lien démo Module 0 : « deux jours ouvrés ».
- `/compte-rendu-rdv` : cité, pas ouvert.

---

## 2.4 — Construire `/reponse-ticket`

**À dire**

Maintenant on construit. Moi à l'écran, vous sur votre poste, étape par étape. Les développeurs qui préfèrent peuvent construire le skill de revue à la place, les étapes sont les mêmes, c'est dans le TP.

Je crée le dossier, je crée le fichier à partir du squelette. La description, je l'écris comme la plupart des gens l'écrivent la première fois : « Rédige la réponse à un ticket support. » Point. Faites pareil.

Le corps, en douze lignes. Classer la demande : bug, question, ou facturation. Lire la fiche client. Rédiger dans le ton de CLAUDE.md. Proposer un article de la base de connaissances s'il en existe un. Pas plus.

Premier ticket. *(taper)* « Prépare la réponse au ticket T-0417. » Regardez : le skill se déclenche, il classe, il joint l'article. Bien.

Deuxième ticket. *(taper)* « Léa Brossard nous demande comment partager un planning avec un sous-traitant, tu lui réponds quoi ? » … Regardez la réponse. Elle est correcte. Le vouvoiement est là, le produit est bien nommé. Mais : pas de classement, pas d'article joint. Le skill ne s'est pas déclenché. Pourquoi ?

*(laisser répondre)* Je n'ai pas dit « ticket ». Claude a lu ma description, qui parle de ticket, il a lu ma demande, qui n'en parle pas, et il a conclu que ça ne correspondait pas. Il a répondu avec ce qu'il avait.

On corrige. Je réécris la description : ce que le skill fait, puis quand l'utiliser, avec les mots que vous employez vraiment. « Répondre à un client, une réclamation, un mail reçu au support, même sans le mot ticket. » Et ce qu'il ne fait pas : pas les relances commerciales. Nouvelle session, même demande, mot pour mot. … Déclenché.

Troisième ticket, facturation. *(taper)* « Réponds à la réclamation de Brossard sur la facture. » Déclenché, classé facturation, et regardez la fin : la question du montant est renvoyée au chargé de compte. Ça, c'est la fiche de poste qui a joué en même temps que le skill.

**Récap**

- v1 étroite : « Rédige la réponse à un ticket support. »
- Corps 12 lignes : classer, fiche client, ton, KB.
- T-0417 : déclenche. T-0402 sans le mot « ticket » : ne déclenche pas, réponse correcte mais hors procédure.
- v2 : fait / quand, mots réels / ne fait pas. Nouvelle session : déclenche.
- T-0431 : facturation → chargé de compte. CLAUDE.md + skill ensemble.
- Passer dans les rangs : le dossier, le nom du fichier.

---

## 2.5 — La description décide

**À dire**

Ce qui vient de se passer, en une phrase : au deuxième ticket, ma demande ne contenait pas le mot que ma description attendait. Claude n'a rien vu qui corresponde, il a fait sans. La réponse n'était pas mauvaise. Elle était hors procédure, et personne ne l'aurait remarqué.

Une description, c'est trois parties, dans cet ordre. Ce que le skill fait, avec un verbe. Quand l'utiliser, avec les mots que les gens emploient vraiment, pas les mots du manuel : « ce client nous écrit », « la réclamation de Brossard », « le mail de ce matin ». Et si un autre skill est proche, ce qu'il ne fait pas.

Le contre-exemple : « aide pour le support ». Ça se déclenchera sur tout et sur rien.

Et je reviens à la question de ce matin. Qu'est-ce qui garantit que le skill est utilisé ? Rien. Claude le déclenche s'il juge que c'est le moment. Un skill est une procédure disponible. Pas une procédure imposée. Pour imposer, c'est le Module 5.

**Récap**

- T-0402 : le mot manquait ; réponse correcte, hors procédure, invisible.
- Description : fait / quand, mots réels / ne fait pas.
- Contre-exemple : « aide pour le support ».
- Disponible, pas imposée. Module 5.

---

## 2.6 — Signal

**À dire**

Le signal, je l'écris à côté de la ligne Skills : vous retapez le même prompt, ou vous collez la même procédure, pour la troisième fois. La troisième, pas la première : la première fois, vous ne savez pas encore que ça reviendra.

Pause de quinze minutes. Au retour, on parle du stagiaire : ce que fait le collègue quand une recherche va lui manger la journée.

**Récap**

- Signal : troisième fois. L'écrire au tableau.
- Pause 15 min. Suite : sous-agents.
