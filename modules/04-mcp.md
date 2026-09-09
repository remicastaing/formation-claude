# Module 4 — MCP : connecter au monde extérieur

**Durée** : 20 min, tous ensemble.
**Plan général** : [[plan-cours-extensions-claude-code]] · Précédent : [[03-sous-agents]] · Script oral : `scripts/04-mcp.md` · Slides 4.1 à 4.4 dans [[slides]] · TP : [[tp-04-mcp-crm]] · Matériel : [[materiel]].
**Objectif du module** : à la fin, chaque participant (1) sait qu'un serveur MCP donne à Claude des outils sur un système externe, et que l'authentification est gérée par le serveur ; (2) a vu `/reponse-ticket` aller chercher lui-même une fiche client qu'il ne voyait pas avant ; (3) sait distinguer l'accès (MCP) du savoir-faire (skill), et connaît les deux précautions : serveur de confiance, accès en lecture seule quand c'est possible.

Quatrième ligne du tableau de la slide 0.3 : ses accès. Deuxième des trois questions : à quoi il est *connecté*.

---

## Déroulé minuté

| Min | Séquence | Format |
|---|---|---|
| 0–2 | Accroche : l'onglet qu'il ne voit pas | Oral, slide 0.3 |
| 2–8 | Concept : protocole, outils, accès vs savoir-faire, portées | Slides 4.1 à 4.3 |
| 8–10 | Exemple dev : base de staging et PR, sans démo | Oral |
| 10–16 | Démo suivie : le CRM hors du dossier, `/reponse-ticket` avant et après | Écran + postes |
| 16–18 | Débrief : confiance, lecture seule, coût | Slide 4.4 |
| 18–20 | Signal, transition vers les hooks | Oral |

---

## 0–2 min — Accroche

« Ce matin, quand vous avez répondu au ticket, où était la fiche client ? » Dans un dossier, à côté du ticket, parce qu'on l'y avait mise. « Et dans la vraie vie ? » Dans le CRM, dans un autre onglet. Et là, on copie, on colle, et Claude travaille sur ce qu'on a bien voulu lui coller.

Slide 0.3, ligne MCP en gras. Les accès du collègue : le CRM, la base, le Drive. Sans eux, il travaille sur ce qu'on lui apporte.

---

## 2–8 min — Concept

Slide 4.1 : *Un protocole, des serveurs, des outils.*

**Ce que c'est.** MCP est un protocole. Un *serveur* MCP est un petit programme, local ou distant, qui expose un système externe sous forme d'*outils* que Claude peut appeler : lire une fiche, lancer une requête, créer une issue, envoyer un message. Claude Code se connecte au serveur, découvre ses outils, et les utilise comme il utilise « lire un fichier ».

**L'authentification est du côté du serveur.** Un serveur distant demande une connexion une fois, par le navigateur ; un serveur local reçoit une clé dans sa configuration. Claude ne voit jamais le mot de passe. C'est le point à faire passer aux équipes métier : on ne donne pas ses identifiants à Claude, on connecte un serveur qui les garde.

**Trois familles de serveurs**, à citer sans détailler : les serveurs distants publiés par les éditeurs (GitHub, Notion, Stripe, l'outil de ticketing) ; les serveurs locaux qu'on lance sur son poste (fichiers, base de données) ; et les connecteurs de claude.ai (Drive, Gmail, Slack), qu'on active dans son compte et qui deviennent disponibles dans Claude Code.

Slide 4.2 : *L'accès et le savoir-faire.*

| MCP donne | Le skill donne |
|---|---|
| L'accès au CRM | La procédure de réponse |
| La requête sur la base | Ce qu'il faut vérifier et dans quel ordre |
| L'écriture dans le ticketing | Ce qu'on n'écrit jamais |

Les deux se combinent, et ni l'un ni l'autre ne suffit. Un MCP sans skill : Claude a accès au CRM et ne sait pas quoi y chercher. Un skill sans MCP : Claude sait quoi chercher et ne peut pas. La démo montre le second cas, puis le corrige.

Slide 4.3 : *Où ça se configure.*

| Portée | Où | Qui |
|---|---|---|
| Locale | Mon poste, ce projet | Moi seul |
| Projet | Un fichier `.mcp.json` à la racine, partagé par le dépôt | Toute l'équipe, chacun approuve à la première ouverture |
| Utilisateur | Mon poste, tous mes projets | Moi seul |

En cas de doublon, la locale l'emporte sur le projet, qui l'emporte sur l'utilisateur. Le fichier de projet est celui de l'équipe : c'est là que l'atelier mettra le CRM.

`/mcp` dans une session liste les serveurs, leur état, le nombre d'outils, et permet de s'authentifier. En ligne de commande, `claude mcp add` ajoute un serveur.

---

## 8–10 min — Exemple dev

Pas de démo, deux phrases chacun.

- **Base de staging** : un serveur MCP connecté à la base avec un compte *en lecture seule*. « Le client Brossard a-t-il bien douze utilisateurs actifs ? » Claude écrit la requête, la lance, lit le résultat. Sans copier-coller depuis un client SQL.
- **GitHub** : Claude lit la PR liée au ticket, les commentaires, le diff. Le skill `/review` du Module 2 peut alors prendre un numéro de PR.

Insister sur *lecture seule* : c'est la précaution numéro un, on y revient au débrief.

---

## 10–16 min — Démo suivie par la salle

Le formateur à l'écran, les participants en ligne de commande suivent sur [[tp-04-mcp-crm]] ; ceux qui sont sur l'application de bureau regardent ou suivent en binôme. Détail et filet dans [[demos-formateur]].

| Min | Étape |
|---|---|
| 10–11 | État de départ : la fiche Brossard n'est plus dans `support/clients/`, elle est dans un dossier `norrsken-crm/` hors du dossier de travail, qui joue le rôle du CRM. |
| 11–13 | « Réponds à la réclamation de Brossard sur la facture. » Le skill se déclenche, cherche la fiche, ne la trouve pas, répond sans : pas de chargé de compte nommé, pas de ticket précédent. La salle constate. |
| 13–14 | Connecter le serveur de fichiers sur `norrsken-crm/`, portée projet. `/mcp` : le serveur est là, avec ses outils. |
| 14–16 | Nouvelle session, même demande mot pour mot. Le skill se déclenche, va chercher la fiche par le serveur, et la réponse retrouve Thomas Renaud et l'historique. Rien n'a changé dans le skill. |

Le skill `reponse-ticket` dit « lire la fiche client dans `clients/`, sinon par le CRM connecté ». C'est cette ligne qui fait le lien : le savoir-faire était déjà là, il manquait l'accès.

Si la salle n'a pas Claude Code : le formateur seul, même déroulé, et il fait deviner à la salle ce qui manquera dans la première réponse avant de la montrer.

---

## 16–18 min — Débrief

Slide 4.4 : *Trois précautions.*

1. **Un serveur, c'est quelqu'un qu'on laisse entrer.** Un serveur qui ramène du contenu extérieur (pages web, mails, tickets) peut ramener des instructions cachées dans ce contenu. On ne connecte que des serveurs qu'on connaît, publiés par l'éditeur du système ou relus par un dev.
2. **Lecture seule quand c'est possible.** Compte de base de données en lecture, jeton GitHub limité, dossier de fichiers restreint. Un accès en écriture, c'est un hook qui le garde (Module 5).
3. **Un serveur inutilisé coûte.** Chaque serveur ajoute des outils que Claude doit connaître ; les sorties sont plafonnées mais une requête bavarde remplit vite la conversation. On débranche ce qu'on n'utilise pas ; `/mcp` le permet par projet.

---

## 18–20 min — Signal et transition

Le signal, au tableau à côté de la ligne MCP : *tu copies-colles des données depuis un onglet que Claude ne voit pas.*

Transition : « Claude sait maintenant ce qu'il doit faire, et il a accès à ce qu'il lui faut. Reste la question de ce matin : qu'est-ce qui empêche une mauvaise réponse de partir ? Rien, jusqu'ici. Module 5. »

---

## Supports

Slides 4.1 à 4.4 dans [[slides]]. À l'écran : le terminal du formateur, `/mcp`, le fichier `.mcp.json` créé.

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à ce module :

- Node et `npx` sur la machine de projection ; le serveur de fichiers téléchargé la veille (une première exécution) pour ne pas attendre en séance.
- Le dossier `norrsken-crm/` hors du dépôt, avec `clients/brossard.md` ; et `support/clients/` vidé dans `demo-configure/`.
- Le skill `reponse-ticket` avec la ligne « sinon par le CRM connecté ».
- `.claude-cible/support/.mcp.json` comme configuration finale.
- Les deux réponses, sans et avec serveur, générées la veille ([[demos-formateur]]).
- Pour les participants sur l'app de bureau : vérifier la veille où se configure un serveur MCP dans l'app (à vérifier : chemin exact du réglage), pour répondre à la question sans chercher.

---

## Pièges et questions fréquentes

**« Il faut donner mon mot de passe à Claude ? »** Non. Le serveur distant demande une connexion dans le navigateur, une fois, et garde le jeton. Le serveur local reçoit une clé dans sa configuration. Claude n'y a pas accès.

**« Le serveur apparaît dans `/mcp` mais Claude ne l'utilise pas. »** D'abord vérifier qu'il est connecté (état, nombre d'outils). Ensuite, la demande ou le skill doit donner une raison d'aller chercher : « lire la fiche client » ne suffit pas si le skill dit « dans `clients/` » seulement. Le savoir-faire doit mentionner l'accès.

**« Ça marche dans l'application de bureau ? »** Oui, les serveurs MCP et les connecteurs claude.ai y sont disponibles. Le réglage n'est pas en ligne de commande ; le formateur a vérifié le chemin la veille.

**« Le fichier `.mcp.json` contient un jeton, je le commite ? »** Non. On y met une variable d'environnement (`${MA_CLE}`), jamais la valeur. Le fichier de projet décrit *quel* serveur, pas *avec quel secret*.

**« Pourquoi il me demande d'approuver le serveur ? »** Un serveur de portée projet vient du dépôt, donc potentiellement de quelqu'un d'autre. Claude Code demande une fois. C'est voulu.

**« On peut connecter Drive ? »** Oui, par les connecteurs claude.ai, activés dans le compte. Le compte rendu de rendez-vous peut alors se ranger tout seul dans le bon dossier. Pas de démo aujourd'hui : dépend des comptes de chacun.

**Dérive à éviter** : passer dix minutes sur l'installation d'un serveur qui ne démarre pas. Le filet : la réponse « avec serveur » générée la veille, et on avance.
