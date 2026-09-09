# Script oral — Module 6, Plugins

Un bloc par slide. Déroulé, démo et pièges dans [[06-plugins]], slides dans [[slides]].

---

## Accroche (slide 0.3, ligne Plugins en gras)

**À dire**

L'équipe de Lyon veut la même chose. Jusqu'ici, la seule réponse, c'est : copier le dossier, espérer que rien ne se perde, et recopier à chaque changement.

Le collègue, dernière ligne. Le kit d'onboarding. On ne réexplique pas tout au prochain, on lui donne le kit.

**Récap**

- « L'équipe de Lyon. » Copier et espérer.
- Ligne 6 : le kit.

---

## 6.1 — Tout dans un dossier

**À dire**

Un plugin, c'est un dossier. Dedans, un petit fichier d'identité : le nom, une description, une version. Et à côté, à la racine du dossier, exactement ce qu'on a construit aujourd'hui. Les skills. Les agents. Les hooks. Le serveur MCP. Mêmes fichiers, mêmes formats. Un plugin, c'est votre dossier `.claude` avec un nom et une version.

Une fois installé, ses skills portent un préfixe : le nom du plugin, deux-points, le nom du skill. Toujours. C'est pour que deux plugins puissent avoir un skill du même nom sans se gêner.

Ce qui change par rapport au dossier qu'on copie : on l'installe. Il a une version. Et quand elle change, tout le monde reçoit la mise à jour.

**Récap**

- Dossier : `plugin.json` + skills, agents, hooks, MCP à la racine.
- Préfixe systématique : `/norrsken-support:reponse-ticket`.
- Installé, versionné, mis à jour.

---

## 6.2 — Un catalogue, une commande

**À dire**

Pour le distribuer, un marketplace. Le mot fait peur, la chose est simple : un catalogue. Un fichier qui liste des plugins et dit où les trouver. Il peut être dans un dossier partagé, dans un dépôt git interne, ou public. Anthropic en tient un officiel, enregistré d'office, avec les intégrations GitHub, Slack, Jira, et les plugins de code intelligence dont je dirai un mot.

Installer, c'est deux étapes. Ajouter le catalogue. Installer le plugin. Deux commandes, dans une session. Et trois portées, les mêmes que ce matin : pour moi partout, pour ce projet et toute l'équipe, pour moi sur ce projet seulement. La portée projet écrit le plugin dans les réglages du dépôt : le prochain qui clone l'a.

**Récap**

- Marketplace = catalogue : fichier, dossier, dépôt git, public.
- Officiel enregistré d'office.
- Deux commandes ; trois portées ; projet = dans le dépôt.

---

## Démo (écran partagé)

**À dire**

Voici le poste d'un nouveau chargé de support, lundi matin. Un dossier support avec les tickets, les fiches, la base de connaissances. Et rien d'autre. Je tape une barre oblique : aucun skill Norrsken.

J'ajoute le catalogue. *(taper)* J'installe le plugin, portée projet. *(taper)* … Je recharge.

Barre oblique : réponse-ticket, compte-rendu de rendez-vous, préfixés. Les hooks : le garde d'envoi, l'audit. Le serveur : le CRM.

*(taper)* Réponse au ticket T-0417. … La réponse de ce matin. Sur un poste qui n'avait rien il y a deux minutes.

Tout ce que l'atelier support va construire cet après-midi tient dans ce dossier. Et l'équipe de Lyon l'installe en deux commandes.

**Récap**

- Poste vierge : `/` sans skill Norrsken.
- `marketplace add`, `install` portée projet, `/reload-plugins`.
- `/` préfixés ; `/hooks` ; `/mcp`.
- `reponse-ticket T-0417` : la réponse de ce matin.
- « Deux commandes. »

---

## 6.3 — Signal

**À dire**

Le signal, à côté de la dernière ligne : une deuxième équipe, ou un deuxième dépôt, a besoin de la même configuration.

Pour les développeurs, dix secondes. Sur le catalogue officiel, les plugins de code intelligence branchent un serveur de langage. Claude voit les erreurs de type après chaque édition, et navigue par définitions et références au lieu de chercher du texte. Si vous avez le temps en atelier, installez celui de TypeScript sur le dépôt.

Le tableau est complet. Six lignes, six signaux. Pause de dix minutes. Au retour : les développeurs à gauche, le support et le commercial à droite, un dev référent par table métier. Et le clavier est chez le métier.

**Récap**

- Signal : deuxième équipe, deuxième dépôt. L'écrire.
- LSP : erreurs de type, navigation ; `typescript-lsp` en atelier si temps.
- Tableau complet. Pause 10 min. Placement des ateliers, clavier chez le métier.
