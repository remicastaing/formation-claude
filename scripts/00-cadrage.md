# Script oral — Module 0, Cadrage

Un bloc par slide. Le texte se lit tel quel ; les points sous chaque texte sont le pense-bête si on lâche le script. Déroulé et pièges dans [[00-cadrage]], slides dans [[slides]].

---

## Titre — Étendre Claude Code

**À dire**

Bonjour à tous. On a trois heures et demie ensemble, et une seule idée à faire passer : Claude Code, tel qu'il est installé sur vos postes ce matin, c'est un outil nu. Tout ce qu'il vaudra pour vous dépend de ce que vous allez y ajouter. Il y a six façons de le faire. À la fin de l'après-midi, vous saurez les nommer, choisir la bonne, et vous en aurez construit au moins une vous-même.

Avant de commencer, un tour de salle. Pas ce que vous attendez du cours : votre prénom, votre équipe, et une chose que Claude a mal faite cette semaine. Une seule, concrète. Je les note au tableau, on y reviendra.

**Récap**

- Six mécanismes, un choix, une construction.
- Tour de salle : prénom, équipe, une erreur concrète de Claude.
- Noter les plaintes à gauche du tableau.

---

## 0.1 — Ce n'est pas un chat

**À dire**

Première chose à comprendre, et elle explique tout le reste. Claude Code n'est pas une fenêtre de discussion avec un modèle derrière. C'est une boucle. Vous donnez une demande. Le modèle la lit et choisit un outil : lire un fichier, lancer une commande, interroger un service. L'outil s'exécute, produit un résultat. Le modèle relit ce résultat et décide de la suite. Et ça tourne, autant de fois que nécessaire, jusqu'à ce que la tâche soit finie. Là seulement, vous avez une réponse.

Pour ceux qui ne sont pas développeurs : un chatbot, vous lui parlez. Un agent, vous lui donnez du travail. La différence, c'est qu'un agent va chercher lui-même ce qui lui manque, et que vous pouvez décider à l'avance où il a le droit d'aller chercher.

Pour les développeurs : c'est un `while` avec un modèle de langage dedans et des appels d'outils. Le cours, c'est : qu'est-ce qu'on injecte dans le prompt, quels outils on branche, quels callbacks on pose sur la boucle.

Ces deux phrases décrivent exactement la même chose. C'est pour ça que vous êtes dans la même salle.

Je dessine cette boucle au tableau, à droite. Elle y reste toute la journée. Chaque module viendra y accrocher quelque chose.

**Récap**

- Demande, modèle, outil, résultat, et on recommence.
- Métier : un agent va chercher lui-même ce qui lui manque.
- Dev : un `while` avec un LLM et des tool calls.
- Même outil pour les deux équipes.
- Dessiner la boucle à droite du tableau, la laisser toute la journée.

---

## 0.2 — Trois questions

**À dire**

Étendre Claude Code, ça se résume à trois questions. Retenez-les, elles structurent tout ce qui suit.

Un : qu'est-ce qu'il sait ? Ce qu'il a sous les yeux au moment de travailler. Vos conventions, votre ton, vos tarifs, vos procédures.

Deux : à quoi est-il connecté ? Les systèmes qu'il peut lire ou modifier. Le dépôt de code, une base de données, le CRM, le Drive, l'outil de tickets.

Trois : que se passe-t-il automatiquement ? Ce qui arrive à chaque fois, sans qu'on le demande, et sans que le modèle puisse l'oublier.

Il y a six mécanismes. Je ne les liste pas maintenant. Chacun répond à l'une de ces trois questions, et vous les découvrirez dans l'ordre. Ce que je veux que vous reteniez à cette minute, c'est trois questions, pas six noms.

**Récap**

- Sait, connecté, automatique.
- Ne pas dérouler les six mécanismes ici.
- Trois questions, pas six noms.

---

## Démo — même ticket, deux Claude

*(pas de slide, écran partagé)*

**À dire**

Maintenant, une démo. Je vais faire exactement la même chose deux fois. Un ticket client, une demande d'une ligne : « prépare la réponse à ce ticket ». La première fois sur un Claude Code tel que vous l'avez installé. La deuxième sur un Claude Code configuré. Je ne commente pas la technique. On regarde les deux réponses comme le ferait un responsable support.

Le ticket. Léa Brossard, une menuiserie, douze utilisateurs. L'export PDF du planning est vide depuis la mise à jour. C'est la deuxième fois. Elle veut être remboursée du mois, et elle écrit « urgent ».

Voici la première réponse. Prenez trente secondes. Qu'est-ce qui cloche ?

*(laisser la salle trouver ; compléter si besoin)*

Le produit s'appelle Norrsken Planning, pas Planner. « Sous 24 heures » : qui a validé ce délai ? Personne. Un mois offert : c'est une promesse commerciale écrite, inventée. Et rien sur l'historique : elle dit que c'est la deuxième fois, et la réponse fait comme si c'était la première.

Voici la seconde. Même demande, même ticket.

Vouvoiement, nom exact du produit. Le délai vient du contrat, deux jours ouvrés, avec la date. Elle a trouvé le ticket précédent et le cite. Le remboursement n'est pas promis, il est transmis au chargé de compte, nommé. Un article de contournement est joint. Et en dessous, une ligne dans un fichier d'audit : qui a répondu, quand, à quel ticket.

Laquelle vous envoyez ? Évidemment. Mais la vraie question est celle-ci : qu'est-ce qui empêche la première d'être envoyée ? Rien. Gardez cette question en tête, on y répond au Module 5.

Ce que vous venez de voir, l'équipe support l'aura construit elle-même à seize heures.

**Récap**

- Même demande, deux dossiers, réponses côte à côte.
- Faire trouver les défauts par la salle : Planner, 24 h, mois offert, pas d'historique.
- Seconde réponse : ton, SLA du contrat, T-0298, chargé de compte, article joint, ligne d'audit.
- « Qu'est-ce qui empêche la première d'être envoyée ? Rien. » Module 5.
- « À seize heures vous l'aurez construit. »
- Filet : [[preparation-demo]].

---

## 0.3 — Le nouveau collègue

**À dire**

Pour toute la journée, une seule image. Claude Code, c'est un nouveau collègue. Compétent, rapide, qui arrive lundi matin et qui ne sait rien de l'entreprise.

Qu'est-ce que vous faites avec un nouveau collègue ? Vous lui donnez une fiche de poste le premier jour. Ce sera le fichier CLAUDE.md, Module 1. Vous lui montrez où sont les procédures, qu'il consultera quand il en aura besoin. Ce sont les skills, Module 2. Quand il a une recherche fastidieuse, il la délègue à un stagiaire qui revient avec un résumé. Ce sont les sous-agents, Module 3. Vous lui ouvrez des accès : le CRM, la base de données, Slack. C'est MCP, Module 4. Et il y a les règles du bâtiment : le badge, l'alarme incendie. Elles ne dépendent pas de sa bonne volonté. Ce sont les hooks, Module 5. Enfin, quand la prochaine équipe arrive, vous ne recommencez pas tout : vous copiez le kit d'onboarding. Ce sont les plugins, Module 6.

Ensuite, deux ateliers en parallèle, une restitution croisée, et on termine par une grille d'une page à emporter. Deux pauses, je vous donne les heures.

Une limite de l'image, à dire tout de suite : ce collègue oublie tout entre deux sessions. Ce qui n'est pas écrit dans un de ces six endroits n'existe pas le lendemain. C'est exactement pour ça qu'on écrit.

**Récap**

- Lire le tableau ligne par ligne, avec le numéro de module.
- Annoncer ateliers, restitution, clôture, heures des pauses.
- Limite : il oublie tout entre deux sessions ; d'où l'écriture.

---

## Règle de conduite et transition

*(pas de slide)*

**À dire**

Une règle pour les ateliers, et j'y tiens. Les développeurs n'expliquent pas aux commerciaux. Ils pairent. Le clavier est chez la personne du métier. Le dev regarde, répond aux questions, et n'écrit que si on le lui demande. La raison est simple : ce que le support construit aujourd'hui doit pouvoir être modifié par le support la semaine prochaine, sans dev à côté.

On commence par la fiche de poste. Ouvrez votre dépôt de démo.

**Récap**

- Clavier chez le métier, le dev pair.
- Motif : autonomie du support la semaine suivante.
- Transition : « ouvrez votre dépôt de démo ».
