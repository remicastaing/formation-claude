# Module 6 — Plugins et marketplaces : emballer et distribuer

**Durée** : 10 min, tous ensemble, juste avant la pause et les ateliers.
**Plan général** : [[plan-cours-extensions-claude-code]] · Précédent : [[05-hooks]] · Script oral : `scripts/06-plugins.md` · Slides 6.1 à 6.3 dans [[slides]] · Pas de TP · Matériel : [[materiel]].
**Objectif du module** : à la fin, chaque participant (1) sait qu'un plugin est un dossier qui regroupe skills, agents, hooks et serveurs MCP en une unité installable ; (2) a vu le plugin `norrsken-support` s'installer en une commande sur un poste vierge, et ses skills apparaître préfixés ; (3) sait qu'un marketplace n'est qu'un catalogue, interne ou public.

Sixième et dernière ligne du tableau de la slide 0.3 : le kit d'onboarding qu'on copie pour la prochaine équipe.

Ce module ne construit rien : l'Atelier A empaquette sa configuration à l'étape 5, et le plugin `norrsken-support` est le livrable de l'Atelier B tel qu'il sera distribué.

---

## Déroulé minuté

| Min | Séquence | Format |
|---|---|---|
| 0–1 | Accroche : l'équipe de Lyon | Oral, slide 0.3 |
| 1–5 | Concept : un dossier, un catalogue, un préfixe | Slides 6.1, 6.2 |
| 5–9 | Démo : installer `norrsken-support` sur un poste vierge | Écran |
| 9–10 | Signal, plugins de code intelligence, transition | Slide 6.3 |

---

## 0–1 min — Accroche

« L'équipe de Lyon veut la même chose. » Jusqu'ici, la seule réponse est : copier le dossier `.claude/` et espérer que rien ne se perde. Puis le recopier à chaque changement.

Slide 0.3, ligne Plugins en gras. Le kit d'onboarding : on ne réexplique pas tout au prochain, on lui donne le kit.

---

## 1–5 min — Concept

Slide 6.1 : *Tout dans un dossier.*

**Ce que c'est.** Un dossier avec un petit fichier d'identité, `.claude-plugin/plugin.json` (nom, description, version), et à côté, à la racine du dossier, exactement ce qu'on a construit aujourd'hui : `skills/`, `agents/`, `hooks/hooks.json`, `.mcp.json`. Mêmes fichiers, mêmes formats. Un plugin, c'est un `.claude/` avec un nom et une version.

**Le préfixe.** Installé, ses skills s'appellent `/norrsken-support:reponse-ticket`. Toujours préfixés, pour que deux plugins puissent avoir un skill du même nom sans se marcher dessus. Le préfixe, c'est le nom du plugin.

**Ce qui change par rapport au dossier `.claude/`** : on l'installe au lieu de le copier, il a une version, et quand elle change, tout le monde reçoit la mise à jour.

Slide 6.2 : *Un catalogue, une commande.*

**Le marketplace.** Un catalogue : un fichier qui liste des plugins et où les trouver. Il peut être un dossier partagé, un dépôt git interne, ou public. Anthropic en tient un officiel, enregistré d'office, avec les intégrations (GitHub, Slack, Jira) et les plugins de code intelligence.

**Installer.** Deux étapes : ajouter le catalogue, installer le plugin. Deux commandes, dans une session. Trois portées : pour moi partout, pour ce projet et toute l'équipe, pour moi sur ce projet. La portée projet écrit le plugin dans les réglages du dépôt : le prochain qui clone l'a.

**Pour une équipe** : le dépôt peut déclarer son catalogue dans ses réglages ; celui qui ouvre le projet et lui fait confiance a le catalogue sans rien faire, et voit la commande d'installation.

---

## 5–9 min — Démo

Le formateur seul, détail dans [[demos-formateur]]. Un dossier `poste-vierge/` sans aucun `.claude/`, avec seulement le dossier `support/` de démo (tickets, fiches, KB, tarifs) et le CRM.

1. Session dans `poste-vierge/support/`. Taper `/`, faire défiler : aucun skill Norrsken. « C'est le poste d'un nouveau chargé de support, lundi matin. »
2. Ajouter le catalogue : `/plugin marketplace add <chemin du marketplace de démo>`.
3. Installer : `/plugin install norrsken-support@norrsken`, portée projet. Si le résumé le demande, `/reload-plugins`.
4. Taper `/` : `/norrsken-support:reponse-ticket`, `/norrsken-support:compte-rendu-rdv`. `/hooks` : le garde d'envoi et l'audit. `/mcp` : le CRM.
5. `/norrsken-support:reponse-ticket T-0417`. La réponse de ce matin, sur un poste qui n'avait rien il y a deux minutes.

Deux phrases pour clore : tout ce que l'atelier support va construire cet après-midi tient dans ce dossier ; et l'équipe de Lyon l'installe en deux commandes.

---

## 9–10 min — Signal et transition

Slide 6.3. Le signal, au tableau à côté de la ligne Plugins : *une deuxième équipe, ou un deuxième dépôt, a besoin de la même configuration.*

Une mention pour les devs, dix secondes : sur le marketplace officiel, les plugins de *code intelligence* (`typescript-lsp`, `pyright-lsp`…) branchent un serveur de langage : Claude voit les erreurs de type après chaque édition et navigue par définitions et références plutôt que par recherche de texte. À installer sur le dépôt Norrsken si le temps le permet en atelier.

Transition : « Le tableau est complet. Pause de dix minutes, puis les ateliers : les devs à gauche, le support et le commercial à droite, un dev référent par table métier. Le clavier est chez le métier. »

---

## Supports

Slides 6.1 à 6.3 dans [[slides]]. À l'écran : le dossier du plugin ouvert dans l'explorateur de fichiers, puis le terminal de la démo.

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à ce module :

- `demo-norrsken/marketplace/` généré par `construire.sh` depuis `.claude-cible/`, validé avec `claude plugin validate`.
- Un dossier `poste-vierge/support/` sans `.claude/`, avec le contenu support et le CRM à côté.
- Le skill `compte-rendu-rdv` dans `.claude-cible/support/`, pour que le plugin le contienne.
- `participants/squelettes/plugin.json` et `marketplace.json`.
- La sortie de `/norrsken-support:reponse-ticket T-0417` sur le poste vierge, générée la veille ([[demos-formateur]]).

---

## Pièges et questions fréquentes

**« Les skills n'apparaissent pas après l'installation. »** `/reload-plugins`, ou relancer la session. Puis `/plugin`, onglet Erreurs : un composant mal placé y est signalé.

**« J'ai mis `skills/` dans `.claude-plugin/`. »** L'erreur classique. Seul `plugin.json` va dans `.claude-plugin/` ; tout le reste est à la racine du dossier du plugin.

**« Mon skill existe deux fois : `/reponse-ticket` et `/norrsken-support:reponse-ticket`. »** Normal si le dossier `.claude/skills/` d'origine est encore là. Une fois le plugin installé, on supprime l'original. Pour les agents c'est l'inverse : l'agent du projet masque celui du plugin tant qu'il existe.

**« Il faut un serveur pour héberger le marketplace ? »** Non. Un dossier partagé suffit pour commencer, un dépôt git interne ensuite. Le catalogue est un fichier.

**« Et l'application de bureau ? »** Elle a son propre navigateur de plugins ; les marketplaces et les portées sont les mêmes. Le formateur a vérifié la veille où il se trouve (à vérifier).

**« Peut-on tester sans installer ? »** Oui : `claude --plugin-dir ./mon-plugin` charge le dossier pour la session, et `/reload-plugins` reprend les modifications. C'est ce que l'Atelier A fera avant d'installer chez le voisin.

**Dérive à éviter** : détailler le format du catalogue ou les options de version. Dix minutes, un message : ça s'installe en deux commandes, et c'est ce que l'atelier livre.
