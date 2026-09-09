# Module 0 — Cadrage

**Durée** : 15 min, tous ensemble.
**Plan général** : [[plan-cours-extensions-claude-code]] · Script oral : `scripts/00-cadrage.md` · Démo : [[preparation-demo]] · Matériel : [[materiel]].
**Objectif du module** : à la fin, chaque participant sait (1) que Claude Code est une boucle agentique configurable, pas un chatbot ; (2) que « étendre » se résume à trois questions : *que sait-il, à quoi est-il connecté, que se passe-t-il automatiquement* ; (3) qu'il a vu, sur un cas de son métier, l'écart entre un Claude nu et un Claude configuré.

Ce module ne fait rien construire. Il installe le vocabulaire, l'analogie et l'envie.

---

## Déroulé minuté

| Min | Séquence | Format |
|---|---|---|
| 0–2 | Accueil, tour de salle en une phrase | Oral |
| 2–5 | Pourquoi ce cours : chatbot vs boucle agentique | Slide 1 + tableau |
| 5–7 | Ce que « extension » veut dire : les trois questions | Slide 2 |
| 7–12 | Démo d'ouverture : même ticket, Claude nu puis Claude configuré | Écran partagé |
| 12–14 | L'analogie du nouveau collègue et le programme de la demi-journée | Slide 3 |
| 14–15 | Règle de conduite, transition vers le Module 1 | Oral |

Le minutage est serré. La démo est le seul moment qui peut déborder ; tout ce qui précède est un texte appris.

---

## 0–2 min — Accueil

Une phrase par personne : prénom, équipe, *une chose que Claude a mal faite cette semaine*. Pas « ce que vous attendez du cours » : la plainte concrète est plus utile, et le formateur en réutilise deux ou trois pendant la journée (« vous vous souvenez, Karim disait que Claude oubliait le HT… c'est une ligne de CLAUDE.md »).

Noter les plaintes au tableau, à gauche. On y revient au Module 8.

---

## 2–5 min — Pourquoi ce cours

**Message** : Claude Code n'est pas une fenêtre de chat avec un modèle derrière. C'est une **boucle** : le modèle lit la demande, choisit un outil (lire un fichier, lancer une commande, interroger un service), regarde le résultat, recommence jusqu'à ce que la tâche soit finie. Tout ce qui entre dans cette boucle se configure.

Dessiner au tableau, à droite, un cercle avec quatre cases : *demande → modèle → outil → résultat → modèle…*. Ce dessin reste toute la journée ; chaque module viendra y accrocher un mécanisme.

**Formulation pour les commerciaux et le support** : « Un chatbot, vous lui parlez. Un agent, vous lui donnez du travail. La différence, c'est qu'un agent va chercher lui-même ce qui lui manque, et que vous pouvez décider à l'avance où il a le droit d'aller chercher. »

**Formulation pour les devs** : « C'est un `while` avec un LLM dedans et des tool calls. Le cours, c'est : qu'est-ce qu'on injecte dans le prompt système, quels outils on branche, quels callbacks on pose sur la boucle. »

Les deux formulations décrivent la même chose. Le dire explicitement : « c'est le même outil pour les deux équipes, et c'est pour ça qu'on est dans la même salle ».

---

## 5–7 min — Ce que « extension » veut dire

Trois questions, et c'est tout le cours :

1. **Qu'est-ce qu'il sait ?** Ce qui est dans son contexte au moment de travailler : conventions, ton, tarifs, procédures. → CLAUDE.md, skills.
2. **À quoi est-il connecté ?** Les systèmes qu'il peut lire ou modifier : dépôt, base de données, CRM, Drive, ticketing. → MCP.
3. **Que se passe-t-il automatiquement ?** Ce qui arrive à chaque fois sans qu'on le demande, et sans que le modèle puisse l'oublier. → Hooks.

Puis deux mécanismes d'organisation, qu'on annonce sans les détailler : les **sous-agents** (comment il répartit son travail) et les **plugins** (comment on donne la même configuration à toute une équipe).

Ne pas dérouler les six mécanismes maintenant. Le but est que la salle retienne *trois questions*, pas six noms.

---

## 7–12 min — Démo d'ouverture

### Principe

Même demande, deux environnements, résultats côte à côte. On ne commente pas la technique : on regarde les deux réponses comme le ferait un responsable support, et on demande à la salle laquelle elle enverrait.

La demande, tapée à l'identique dans les deux sessions :

```
Prépare la réponse au ticket support/tickets/T-0417.md
```

### Préparation

Détail dans [[preparation-demo]] : deux dossiers `demo-nu/` et `demo-configure/`, les réponses générées la veille comme filet. Le dossier configuré est exactement ce que l'Atelier B va construire. Le dire en fin de démo : « ce que vous venez de voir, c'est ce que vous aurez construit à 16 h ».

### Le ticket

`demo-norrsken/support/tickets/T-0417.md` : Léa Brossard, menuiserie de 12 utilisateurs, export PDF du planning vide depuis la mise à jour, deuxième incident du genre, demande de remboursement du mois, « URGENT ».

### Réponse de Claude nu

Texte type dans [[preparation-demo]]. Ce qui cloche, à faire trouver par la salle plutôt qu'à lister :

- Le produit s'appelle *Norrsken Planning*, pas Norrsken Planner.
- « Sous 24 heures » : personne n'a validé ce délai, et le SLA dit autre chose.
- Un mois offert : promesse commerciale écrite, inventée, sans validation.
- Aucune trace de l'historique du client : c'est pourtant « la deuxième fois ».
- Ton : excuses vagues, « désagrément », « gêne occasionnée ».
- Rien n'a été classé, rien n'a été journalisé ; le ticket est traité comme un texte libre.

### Réponse de Claude configuré

Texte type dans [[preparation-demo]], avec la ligne d'audit écrite par le hook `Stop`.

Ce qui a changé, et d'où ça vient (on le dit en une phrase par ligne, on ne détaille pas) :

| Dans la réponse | Vient de |
|---|---|
| Vouvoiement, pas d'excuses vagues, nom officiel du produit | CLAUDE.md du dossier `support/` |
| Classement « incident technique », structure de la réponse, article KB joint | Skill `/reponse-ticket` |
| Délai « deux jours ouvrés » calculé, pas inventé | Skill de référence `produits-et-tarifs` (section SLA) |
| Ticket T-0298, contrat Pro, chargé de compte | Fichier client (demain : MCP vers le CRM) |
| Remboursement transmis, pas promis | CLAUDE.md, liste des « interdits par écrit » |
| Ligne d'audit | Hook `Stop` |

### Question à la salle

« Laquelle vous envoyez ? » Puis, plus important : « Qu'est-ce qui empêche la première d'être envoyée ? » Réponse attendue : rien. C'est le moment de planter l'idée qui portera le Module 5 : une consigne demande, un hook garantit.

---

## 12–14 min — L'analogie du nouveau collègue et le programme

Slide 3. Claude Code est un nouveau collègue, compétent, qui arrive lundi matin sans rien savoir de l'entreprise.

| Le collègue | Le mécanisme | Module |
|---|---|---|
| La fiche de poste qu'on lui donne le premier jour | CLAUDE.md | 1 |
| Les procédures qu'il consulte quand il en a besoin | Skills | 2 |
| Le stagiaire à qui il délègue une recherche | Sous-agents | 3 |
| Ses accès : CRM, base de données, Slack | MCP | 4 |
| Les règles du bâtiment : badge, alarme incendie | Hooks | 5 |
| Le kit d'onboarding qu'on copie pour la prochaine équipe | Plugins | 6 |

Puis les ateliers en parallèle, la restitution, la clôture. Rappeler les heures des deux pauses.

L'analogie a une limite à nommer tout de suite pour éviter les fausses attentes : le collègue oublie tout entre deux sessions. Ce qui n'est pas écrit dans un des six mécanismes n'existe pas le lendemain. C'est précisément pour ça qu'on écrit.

---

## 14–15 min — Règle de conduite et transition

**La règle** : dans les ateliers, les devs n'expliquent pas aux commerciaux. Ils pairent. Le clavier est chez la personne du métier ; le dev regarde, répond aux questions, et n'écrit que si on le lui demande. Motiver la règle : ce que le support construit aujourd'hui doit pouvoir être modifié par le support la semaine prochaine, sans dev à côté.

**Transition** : « On commence par la fiche de poste. Ouvrez votre dépôt de démo. »

---

## Supports

Slides 0.1 à 0.3 dans [[slides]] ; le cercle de la boucle dans [[boucle]].

Tableau blanc : à gauche les plaintes du tour de salle, à droite le cercle de la boucle. On ne les efface pas de la journée.

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à ce module : les deux dossiers de démo ([[preparation-demo]]), les trois slides, le tableau blanc, et l'app desktop déjà ouverte chez les non-développeurs avant l'accueil.

---

## Pièges et questions fréquentes

**« Est-ce que Claude apprend de ce qu'on lui dit ? »** Un peu, pour lui-même : il tient une mémoire automatique de vos corrections, sur votre poste. Mais rien de ce qui compte pour l'équipe ne doit reposer dessus : ce qu'on veut qu'il retienne, on l'écrit, dans un fichier partagé. La journée entière porte sur *où* l'écrire. Détail au Module 1.

**« Pourquoi on ne met pas tout dans un gros prompt ? »** Parce qu'un prompt se lit en entier à chaque fois, coûte du contexte, et reste une demande que le modèle peut ne pas suivre. La suite du cours répond point par point : ce qui est toujours nécessaire (CLAUDE.md), ce qui ne l'est qu'à l'occasion (skills), ce qui ne doit jamais dépendre du modèle (hooks).

**« C'est de la magie ou c'est déterministe ? »** Les deux, et le cours sépare les deux. Ce que le modèle décide (déclencher un skill, appeler un outil) est probabiliste. Ce qu'un hook fait est déterministe. Savoir lequel utiliser est l'objet du Module 5 et du quiz de clôture.

**Dérive à éviter** : un dev qui veut voir le contenu du dossier `.claude/` pendant la démo. Réponse : « à 16 h vous l'aurez écrit vous-même ». Ne pas ouvrir les fichiers maintenant, ça casse le rythme et perd la moitié de la salle.

**Si la démo en direct échoue** : basculer sur le document de secours sans commentaire. La démo montre un écart, pas une fiabilité réseau.
