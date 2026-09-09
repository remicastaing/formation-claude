# Script oral — Module 5, Hooks

Un bloc par slide. Déroulé, démo et pièges dans [[05-hooks]], slides dans [[slides]], TP dans [[tp-05-garde-fou]].

---

## Accroche (slide 0.3, ligne Hooks en gras)

**À dire**

Je vous ai posé une question ce matin et je l'ai laissée ouverte deux fois. Qu'est-ce qui empêche la première réponse, celle avec les vingt-quatre heures et le mois offert, d'être envoyée ? Jusqu'ici, rien. Tout ce qu'on a construit, la fiche de poste, les procédures, les accès, ce sont des choses que Claude sait ou peut. Rien de ce qu'il doit.

Le collègue, cinquième ligne. Les règles du bâtiment. Le badge, l'alarme incendie. Elles ne dépendent pas de sa bonne volonté. Elles ne dépendent de la bonne volonté de personne.

**Récap**

- La question ouverte : rien n'empêche, jusqu'ici.
- Sait, peut, mais pas « doit ».
- Ligne 5 : les règles du bâtiment.

---

## 5.1 — Un événement, un script

**À dire**

Claude Code émet des événements pendant qu'il travaille. Une session démarre. Claude va utiliser un outil. Il vient de l'utiliser. Il a fini de répondre. Un hook, c'est un script qu'on attache à un de ces événements. Quand l'événement arrive, le script tourne. Il reçoit ce qui est en train de se passer : quel outil, quel fichier, quelle commande. Et il répond : laisser faire, bloquer, ou renvoyer une information à Claude.

Quatre événements pour aujourd'hui. Au démarrage de la session : charger un contexte, vérifier un prérequis. Avant un outil : c'est celui qui bloque. Refuser une édition, une commande, un envoi. Après un outil : réagir. Lancer le linter, renvoyer ses erreurs. Et à la fin d'une réponse : journaliser, ou vérifier que le travail est complet.

Un hook lance le plus souvent un script sur le poste. Il peut aussi appeler une adresse web, un outil MCP, ou poser une question à un modèle. Je le cite, on n'en montrera qu'un.

**Récap**

- Événement → script → laisser faire, bloquer, ou renvoyer.
- `SessionStart`, `PreToolUse` (bloque), `PostToolUse` (réagit), `Stop` (journalise).
- Script, ou adresse web, ou outil MCP, ou modèle.

---

## 5.2 — Une consigne demande, un hook garantit

**À dire**

Cette phrase, je la répète depuis ce matin. La voici expliquée.

À gauche, la fiche de poste dit : ne jamais éditer le fichier `.env`. Claude la lit, la comprend, et s'y conforme la plupart du temps. À droite, un hook, avant chaque édition, regarde le chemin du fichier et refuse si c'est `.env`. Le script tourne quoi que Claude ait décidé. Il n'a pas d'avis. Il n'a pas de bon jour.

Probabiliste d'un côté. Déterministe de l'autre. Et une différence de plus : la consigne coûte des lignes de contexte à chaque session. Le hook coûte zéro, sauf s'il renvoie quelque chose.

Deux conséquences. La première : ce que vous ne voulez jamais voir partir chez un client, vous ne le confiez pas à une consigne. Vous le mettez dans un hook. La seconde : le hook ne remplace pas la consigne, il la double. La consigne dit à Claude ce qu'on attend, pour qu'il travaille dans le bon sens. Le hook s'assure que ça arrive.

**Récap**

- Consigne : lue, suivie la plupart du temps. Hook : tourne quoi qu'il décide.
- Probabiliste / déterministe. Contexte / zéro.
- Jamais chez un client → hook.
- Le hook double la consigne, il ne la remplace pas.

---

## 5.3 — Où ça se configure

**À dire**

Dans le fichier de réglages du projet, sous une clé qui s'appelle hooks. Pour chaque événement, deux choses : un filtre qui dit sur quels outils ça s'applique, ici les éditions et les écritures de fichiers, et la commande à lancer.

Le script reçoit les détails de ce qui va se passer, et répond par son code de sortie. Zéro : on laisse faire. Deux : on bloque, et le message d'erreur du script est montré à Claude, qui le lit et cherche une autre voie.

Je ne vous fais pas lire le format. Votre squelette est pré-rempli ; l'atelier vous fera en écrire un.

Pour les développeurs, une phrase : les hooks de projet ne tournent qu'après avoir accepté la confiance du dossier, et la commande `/hooks` liste ce qui est configuré et d'où ça vient.

**Récap**

- `.claude/settings.json`, clé `hooks` : événement, matcher, commande.
- Sortie 0 : laisser faire. Sortie 2 : bloquer, message montré à Claude.
- Ne pas lire le format. Squelette pré-rempli.
- Devs : confiance du dossier, `/hooks`.

---

## Démo dev (écran partagé)

**À dire**

Le dépôt de démo, avec sa fiche de poste. Elle contient : ne jamais modifier `.env`. Je demande : « Le port de dev doit passer à 4000, mets à jour la configuration. »

*(selon l'issue)*
— Il s'arrête et demande. Bien. Il a lu la consigne. Aujourd'hui.
— Il a modifié le fichier. Voilà. La consigne était là. Il l'a lue ce matin. Et là, dans le feu de l'action, il a jugé que c'était la bonne chose à faire.

Maintenant j'active le hook. Avant chaque édition, un script regarde le chemin, et refuse `.env` et les migrations. Nouvelle session, même demande.

Regardez. Il tente l'édition. Le hook refuse. Il reçoit le message, « ce fichier est protégé », et il propose autre chose : me dire quelle ligne changer, ou modifier un fichier d'exemple. Le fichier n'a pas bougé. Et il ne bougera jamais par ce chemin.

Une dernière chose. *(taper /context)* Même taille qu'avant. Le hook n'a rien coûté.

Ce n'est pas que la consigne est inutile. C'est qu'elle ne suffit pas pour ce qui ne doit jamais arriver.

**Récap**

- CLAUDE.md « ne jamais modifier `.env` » ; demande « port 4000 ». Deux issues, les deux servent.
- Hook `PreToolUse` `Edit|Write`, refuse `.env` et `migrations/`. Nouvelle session, même demande : refus, Claude propose autre chose.
- `/context` identique.
- « Ne suffit pas pour ce qui ne doit jamais arriver. »

---

## Exemple métier (écran : `garde-envoi.sh`, `audit.sh`, `audit.log`)

**À dire**

Côté support, deux hooks. Le premier, avant tout envoi. Il lit le texte qui va partir et refuse dans deux cas : un montant en euros sans la mention hors taxes, ou un délai annoncé qui n'est pas dans la liste du contrat. Le message de refus dit lequel.

Le second, à la fin de chaque réponse. Il ajoute une ligne dans un fichier d'audit : la date, le ticket, la session. Vous vous souvenez de la ligne d'audit de ce matin, sous la bonne réponse ? C'était lui. Le voilà.

Et reprenez la première réponse de ce matin. Vingt-quatre heures : pas dans le contrat. Un mois offert : un montant, une promesse. Le hook d'envoi l'aurait arrêtée avant qu'elle parte. Même si la fiche de poste avait été ignorée. Même si le skill ne s'était pas déclenché.

**Récap**

- `garde-envoi` : montant sans HT, délai hors SLA → refus motivé.
- `audit` sur `Stop` : la ligne de ce matin, c'était lui.
- La mauvaise réponse de ce matin aurait été arrêtée.

---

## 5.4 — Exercice : hook ou CLAUDE.md ?

**À dire**

À vous, en binôme. Une règle de garde-fou de votre métier, une seule, en une phrase. Ce que vous ne voulez jamais voir arriver. Trois minutes.

Puis trois questions, elles sont sur la fiche. Y a-t-il un moment observable où la règle s'applique : une édition, une commande, un envoi, une fin de réponse ? Peut-on la vérifier par un script, sur ce qui est en train de se passer ? Et que se passe-t-il si elle est ignorée une seule fois ? Trois oui, ou un « grave » à la troisième : c'est un hook. Sinon, c'est une ligne de fiche de poste. Trois minutes.

*(tour de table)* Chaque binôme, la règle et le verdict.

*(contester un ou deux)* « Toujours être aimable » : quel est le moment observable ? Il n'y en a pas. Fiche de poste. « Ne jamais promettre de remboursement » : vous l'avez mise en fiche de poste. Si c'est ignoré une fois ? Un client a une promesse écrite. C'est un hook sur l'envoi.

**Récap**

- 3 min écrire, 3 min trancher, 2 min tour.
- Trois questions : moment observable, vérifiable par script, gravité d'un seul écart.
- Contester : le ton n'est pas un hook ; « jamais chez un client » en est un.

---

## 5.5 — Signal

**À dire**

Le signal, à côté de la ligne Hooks : vous voulez qu'une chose se produise systématiquement, sans avoir à le demander.

Vous avez maintenant tout ce que l'atelier va construire. Une fiche de poste, des procédures, un stagiaire, des accès, des règles du bâtiment. Reste une question : comment on donne tout ça à l'équipe de Lyon ? Module 6, dix minutes, et on passe aux ateliers.

**Récap**

- Signal : systématiquement, sans le demander. L'écrire.
- Transition : « l'équipe de Lyon », Module 6.
