# Script oral — Module 4, MCP

Un bloc par slide. Déroulé, démo et pièges dans [[04-mcp]], slides dans [[slides]], TP dans [[tp-04-mcp-crm]].

---

## Accroche (slide 0.3, ligne MCP en gras)

**À dire**

Ce matin, quand vous avez répondu au ticket, où était la fiche client ? Dans un dossier, à côté du ticket. Parce qu'on l'y avait mise. Et dans la vraie vie ? Dans le CRM. Dans un autre onglet. Et là, on copie, on colle, et Claude travaille sur ce qu'on a bien voulu lui coller.

Le collègue, quatrième ligne. Ses accès. Le CRM, la base, le Drive. Sans ses accès, il travaille sur ce qu'on lui apporte. Avec, il va chercher.

**Récap**

- La fiche était dans un dossier parce qu'on l'y avait mise.
- Dans la vraie vie : un onglet, un copier-coller.
- Ligne 4 : ses accès.

---

## 4.1 — Un protocole, des serveurs, des outils

**À dire**

MCP, c'est un protocole. Ce qui vous intéresse, c'est ce qu'il permet : un serveur MCP est un petit programme, sur votre poste ou à distance, qui présente un système externe sous forme d'outils. Lire une fiche. Lancer une requête. Créer une issue. Envoyer un message. Claude Code se connecte au serveur, découvre ses outils, et les utilise exactement comme il utilise « lire un fichier ».

Le point important pour vous : l'authentification est du côté du serveur. Un serveur distant vous demande de vous connecter une fois, dans le navigateur. Un serveur local reçoit une clé dans sa configuration. Claude ne voit jamais votre mot de passe. On ne donne pas ses identifiants à Claude ; on connecte un serveur qui les garde.

Trois familles. Les serveurs distants publiés par les éditeurs : GitHub, Notion, votre outil de tickets. Les serveurs locaux qu'on lance sur son poste : un dossier de fichiers, une base de données. Et les connecteurs de claude.ai : Drive, Gmail, Slack, qu'on active dans son compte et qui deviennent disponibles ici.

**Récap**

- Serveur = système externe présenté en outils.
- Authentification côté serveur ; Claude ne voit pas le mot de passe.
- Distants (éditeurs), locaux (poste), connecteurs claude.ai.

---

## 4.2 — L'accès et le savoir-faire

**À dire**

Regardez ce tableau, c'est la phrase du module. MCP donne l'accès. Le skill donne le savoir-faire.

L'accès au CRM, c'est MCP. La procédure de réponse, c'est le skill. La requête sur la base, MCP. Ce qu'il faut vérifier et dans quel ordre, le skill. L'écriture dans le ticketing, MCP. Ce qu'on n'écrit jamais, le skill et la fiche de poste.

Les deux se combinent, et aucun des deux ne suffit seul. Un MCP sans skill : Claude a accès au CRM et ne sait pas quoi y chercher. Un skill sans MCP : Claude sait exactement quoi chercher, et ne peut pas. C'est ce deuxième cas que je vais vous montrer dans deux minutes. Puis je le corrige.

**Récap**

- MCP : accès. Skill : savoir-faire.
- Ni l'un ni l'autre ne suffit seul.
- La démo montre « sait mais ne peut pas », puis corrige.

---

## 4.3 — Où ça se configure

**À dire**

Trois portées, comme d'habitude. Locale : mon poste, ce projet, moi seul. Projet : un fichier à la racine, partagé par le dépôt ; toute l'équipe l'a, et chacun approuve le serveur la première fois qu'il ouvre le projet, parce qu'un serveur qui vient du dépôt vient potentiellement de quelqu'un d'autre. Utilisateur : mon poste, tous mes projets.

En cas de doublon, la locale gagne sur le projet, qui gagne sur l'utilisateur. Le fichier de projet, c'est celui de l'équipe. C'est là que l'atelier mettra le CRM.

Dans une session, la commande `/mcp` liste les serveurs, leur état, le nombre d'outils, et permet de s'authentifier. Retenez-la, c'est votre tableau de bord.

**Récap**

- Locale, projet (`.mcp.json`, approuvé une fois), utilisateur.
- Locale > projet > utilisateur.
- `/mcp` : le tableau de bord.

---

## Exemple dev (pas de slide)

**À dire**

Deux exemples côté code, sans démo.

La base de staging. Un serveur connecté à la base avec un compte en lecture seule. « Le client Brossard a-t-il bien douze utilisateurs actifs ? » Claude écrit la requête, la lance, lit le résultat. Plus de copier-coller depuis un client SQL.

GitHub. Claude lit la PR liée au ticket, les commentaires, le diff. Et le skill de revue de ce matin peut prendre un numéro de PR.

Vous avez entendu « lecture seule ». Retenez-le, on y revient.

**Récap**

- Base de staging, compte lecture seule.
- GitHub : PR, commentaires, diff ; `/review 42`.
- « Lecture seule » : à retenir.

---

## Démo suivie (écran partagé)

**À dire**

Voilà la situation. La fiche Brossard n'est plus dans le dossier clients. Elle est dans un dossier à part, en dehors de mon dossier de travail, qui joue le rôle du CRM. Claude ne le voit pas.

*(taper)* « Réponds à la réclamation de Brossard sur la facture. »

Le skill se déclenche. Il cherche la fiche, comme sa procédure le lui dit. Il ne la trouve pas. Et il répond quand même, avec ce qu'il a. Regardez ce qui manque : pas de chargé de compte nommé. Pas de ticket précédent. La réponse est propre, et incomplète, et personne ne le verrait.

Maintenant je connecte un serveur. Le plus simple qui existe : un serveur de fichiers, pointé sur ce dossier CRM. Une ligne de commande, portée projet. *(taper)* Voilà. `/mcp` : le serveur est là, connecté, avec ses outils.

Nouvelle session. Même demande, mot pour mot. *(taper)* … Le skill se déclenche, il cherche la fiche dans le dossier, ne la trouve pas, et cette fois il a un autre chemin : il passe par le serveur. Et la réponse retrouve Thomas Renaud, et l'historique.

Je n'ai rien changé dans le skill. Le savoir-faire était là. Il manquait l'accès.

**Récap**

- Fiche déplacée dans `norrsken-crm/`, hors du dossier de travail.
- Demande 1 : skill déclenché, fiche introuvable, réponse incomplète (pas de chargé de compte, pas d'historique).
- `claude mcp add` fichiers sur le CRM, portée projet. `/mcp`.
- Nouvelle session, même demande : fiche trouvée par le serveur.
- « Rien n'a changé dans le skill. »

---

## 4.4 — Trois précautions

**À dire**

Trois précautions, et la première est la plus importante.

Un serveur, c'est quelqu'un qu'on laisse entrer. Un serveur qui ramène du contenu extérieur, des pages web, des mails, des tickets, peut ramener des instructions cachées dans ce contenu. On ne connecte que des serveurs qu'on connaît : publiés par l'éditeur du système, ou relus par un développeur.

Lecture seule quand c'est possible. Compte de base de données en lecture. Jeton GitHub limité. Dossier de fichiers restreint. Et quand il faut écrire, c'est un hook qui garde la porte. Module 5.

Un serveur inutilisé coûte. Chaque serveur ajoute des outils que Claude doit connaître, et une requête bavarde remplit vite la conversation. On débranche ce qu'on n'utilise pas.

Le signal, à côté de la ligne MCP : vous copiez-collez des données depuis un onglet que Claude ne voit pas.

Claude sait maintenant ce qu'il doit faire, et il a accès à ce qu'il lui faut. Reste la question de ce matin. Qu'est-ce qui empêche une mauvaise réponse de partir ? Rien, jusqu'ici. Module 5.

**Récap**

- Confiance : serveurs connus seulement ; contenu extérieur = instructions cachées possibles.
- Lecture seule ; écriture gardée par un hook.
- Débrancher l'inutile.
- Signal : le copier-coller depuis un onglet. L'écrire.
- Transition : « Rien, jusqu'ici. »
