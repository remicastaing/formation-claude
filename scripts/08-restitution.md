# Script oral — Module 8, Restitution croisée et arbitrages

Un bloc par slide. Déroulé, quiz et pièges dans [[08-restitution]], réponses dans [[quiz-reponses]], slides dans [[slides]].

---

## 8.1 — Restitution croisée

**À dire**

On se retrouve. Chaque atelier montre à l'autre ce qu'il a construit. Un binôme par atelier, trois minutes, puis deux minutes de questions de l'autre équipe. La consigne : montrez une réponse ou un correctif. Pas un fichier de configuration.

Le support d'abord. *(le binôme montre un ticket, la réponse, la ligne d'audit, une ligne du test croisé)*

*(à la fin, aux devs)* Ce que vous venez de voir : une procédure, un accès, un garde-fou. Un vrai outil. Sans une ligne de code.

Les développeurs. *(le binôme montre le triage, le rapport de vérification, l'édition refusée)*

*(à la fin, au support)* Le script qui a dit non à cette édition, c'est le même mécanisme que votre garde d'envoi. Un événement, un script, un refus motivé.

*(si personne ne l'a fait)* Un dernier mot sur le ticket T-0405. La cliente demandait de confirmer deux remises. Le support a répondu non, grâce à la grille. Et dans le code, le logiciel applique bien les deux : c'est un des bugs. Même fait, deux côtés, deux mécanismes.

**Récap**

- Un binôme par atelier, 3 + 2 min, chronomètre visible.
- Support : ticket, réponse, audit, une ligne du test croisé. Aux devs : « sans une ligne de code ».
- Dev : triage, `verif`, édition refusée. Au support : « le même mécanisme que votre garde d'envoi ».
- Pont T-0405 si personne ne l'a fait.

---

## 8.2 — Quiz : quel mécanisme ?

**À dire**

Dix besoins. Pour chacun, vous votez à main levée : fiche de poste, procédure, stagiaire, accès, règle du bâtiment, ou kit. Les six premiers, un par mécanisme. Les quatre derniers sont des pièges. Une minute par question, je donne la réponse et une phrase.

*(lire chaque question, faire voter, répondre avec [[quiz-reponses]])*

Question sept, j'insiste. « Ne jamais promettre de remboursement par écrit. » Vous avez voté fiche de poste, et vous avez voté hook. Vous avez tous raison, et il faut les deux. La fiche de poste dit à Claude ce qu'on attend, pour qu'il rédige dans le bon sens. Le hook sur l'envoi garantit que ça ne part pas. Une règle avec « jamais » dedans, c'est toujours les deux.

Question dix. Le CRM est connecté, il répond sans regarder la fiche. Vous avez voté accès. Mais il a l'accès. Qu'est-ce qui lui manque ? La procédure. « Lire la fiche client d'abord. » C'est un skill. L'accès et le savoir-faire, ce n'est pas la même chose ; c'était le tableau du Module 4.

**Récap**

- Dix questions, une minute chacune, vote à main levée.
- Q7 : les deux, et insister.
- Q8 : skill, pas sous-agent (on itère). Q9 : CLAUDE.md, pas skill (une ligne). Q10 : skill, pas MCP (l'accès est là).

---

## 8.3 — Quiz : réponses

**À dire**

Le tableau complet reste à l'écran. Gardez votre feuille : la grille d'une page que vous emporterez tout à l'heure reprend ces signaux.

**Récap**

- Laisser la slide affichée.

---

## 8.4 — Ce que chaque mécanisme charge, et quand

**À dire**

Dernier point technique, et il explique pourquoi on a passé la journée à ranger les choses au bon endroit. Regardez ma session, ouverte depuis ce matin. *(taper /context)* Les fichiers mémoire. La liste des skills, avec sa taille. Les outils des serveurs connectés.

Ligne par ligne. La fiche de poste : tout le fichier, à chaque session. Un skill : sa description au démarrage, son corps seulement s'il est déclenché, et alors il reste jusqu'à la fin. Un sous-agent : le résumé, rien d'autre. Un serveur MCP : la liste de ses outils, puis les résultats de chaque appel. Un hook : rien, sauf ce qu'il renvoie exprès.

Deux conséquences. La première : trop de skills mal décrits rendent Claude moins bon. Les descriptions se partagent un budget ; au-delà, celles des skills les moins utilisés sont tronquées, et il déclenche moins bien. La commande `/skill-doctor` vous dit ce que chacun coûte et combien il sert. Ce qu'on n'utilise pas, on le désactive.

La seconde : ce qui entre reste. Une recherche dans deux cents fichiers faite dans la conversation pèse sur tout ce qui suit. La même faite par un sous-agent pèse cinq lignes. C'est toute la raison du Module 3.

**Récap**

- `/context` sur la session du matin.
- Lire le tableau ligne par ligne.
- Budget des descriptions ; `/skill-doctor` ; désactiver l'inutile.
- « Ce qui entre reste. »

---

## 8.5 — Quatre erreurs classiques

**À dire**

Quatre erreurs que vous ferez, parce que tout le monde les fait.

Le CLAUDE.md de six cents lignes. Il coûte à chaque session et il est moins suivi. Ce qui n'est pas toujours vrai va ailleurs.

La description de skill vague. « Aide pour le support » : jamais déclenché, ou tout le temps.

Le garde-fou dans un prompt. Une consigne demande, un hook garantit. Si ça ne doit jamais partir, c'est un script.

Les serveurs qui traînent. Des outils chargés pour rien, et une porte ouverte de plus. On débranche.

Et maintenant, le tableau de ce matin. *(aller à gauche)* Vos plaintes, une par une. Vous me dites le mécanisme en un mot. « Il utilise npm » ? … Fiche de poste. « Il tutoie le client » ? … Fiche de poste, et le garde d'envoi si ça part. « Quarante pages de sortie » ? … Stagiaire. *(continuer jusqu'au bout de la liste, deux minutes)*

Tout ce que vous avez noté ce matin a maintenant un endroit où aller. C'est ce qu'on va écrire dans dix minutes, chacun pour soi.

**Récap**

- Quatre erreurs, une phrase chacune.
- Tableau de gauche : chaque plainte, un mot de la salle. Deux minutes.
- Transition : « chacun pour soi », clôture.
