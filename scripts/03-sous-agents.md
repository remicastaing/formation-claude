# Script oral — Module 3, Sous-agents

Un bloc par slide. Déroulé, démo et pièges dans [[03-sous-agents]], slides dans [[slides]], TP dans [[tp-03-tache-qui-inonde]].

---

## Accroche (slide 0.3, ligne Sous-agents en gras)

**À dire**

Bon retour. Une question pour redémarrer. Qui a déjà demandé à Claude de chercher quelque chose dans un gros dossier, et s'est retrouvé avec quarante pages de sortie qu'il n'a jamais relues ? … Et ensuite, la conversation était-elle aussi bonne qu'avant ? Non. Tout ce qui entre dans une conversation y reste, et pèse sur tout ce qui suit.

Le collègue, troisième ligne. Il ne lit pas lui-même les deux cents dossiers. Il envoie le stagiaire. Et le stagiaire revient avec une page.

**Récap**

- Quarante pages jamais relues ; la conversation en souffre après.
- Ligne 3 : le stagiaire revient avec une page.

---

## 3.1 — Un stagiaire, une mission, un résumé

**À dire**

Un sous-agent, c'est un agent que Claude lance pour une tâche précise. Il a trois choses à lui.

Son contexte, vide au départ. Sa consigne, écrite dans un fichier, dans un dossier agents à côté du dossier skills. Et ses outils, qui peuvent être moins nombreux que ceux de la conversation : par exemple, la lecture seule.

Quand il a fini, il ne renvoie qu'un résumé. Tout ce qu'il a lu, cherché, exécuté, reste chez lui et disparaît. C'est ça, l'intérêt.

Le fichier ressemble à un skill : un en-tête avec le nom, une description qui dit quand lui déléguer, la liste des outils, éventuellement un modèle. Et en dessous, la consigne : qui il est, ce qu'il doit faire, et surtout ce qu'il doit rapporter, sous quelle forme.

**Récap**

- Contexte vide, consigne dans `.claude/agents/<nom>.md`, outils propres.
- Ne rapporte qu'un résumé.
- En-tête : nom, description, outils, modèle. Corps : la consigne et le format du rapport.

---

## 3.2 — Ce qu'il voit, ce qu'il ne voit pas

**À dire**

Ce point-là évite la plupart des déceptions. Le sous-agent voit sa consigne, la mission que Claude lui confie, et la fiche de poste du projet, le CLAUDE.md. Il ne voit pas la conversation. Rien de ce que vous avez dit avant. Et pas les skills non plus, sauf ceux qu'on a listés dans son en-tête pour qu'il les charge au départ.

Conséquence : la mission se formule en entier, comme à quelqu'un qui arrive dans la pièce. « Cherche ça », ça ne suffit pas. « Cherche où est géré l'export dans ce dépôt, et rapporte les fichiers et les fonctions concernés, rien d'autre », ça suffit.

Pour le lancer, deux façons. Vous le nommez dans votre demande : « utilise le sous-agent explorateur pour… ». Ou vous laissez Claude décider, d'après la description. Par défaut, il tourne en arrière-plan : vous continuez à travailler, et le résumé arrive quand il a fini.

**Récap**

- Voit : consigne, mission, CLAUDE.md. Ne voit pas : conversation, skills non préchargés.
- Mission formulée en entier.
- Lancer : le nommer, ou laisser Claude décider. Arrière-plan par défaut.

---

## 3.3 — Trois usages

**À dire**

Trois usages, et vous en reconnaîtrez au moins un.

Isoler. Une tâche bavarde, lancer les tests, lire des logs, fouiller deux cents fichiers, dont seule la conclusion compte.

Paralléliser. Trois recherches indépendantes, trois sous-agents en même temps, trois résumés qui arrivent ensemble.

Restreindre et spécialiser. Un sous-agent en lecture seule, qui ne peut rien modifier, quoi qu'il arrive. Un sous-agent sur un modèle plus léger, pour les tâches simples. Un sous-agent qui a déjà chargé la grille tarifaire avant de commencer.

Au-delà de quelques sous-agents, il existe autre chose : un workflow. Un script, écrit par Claude, qui en orchestre des dizaines. C'est pour auditer un dépôt entier ou migrer cinq cents fichiers. Pas pour un ticket. Je le cite, on ne le fera pas aujourd'hui.

Et une chose qu'un sous-agent n'est pas : un moyen d'itérer. Il n'a pas la mémoire de l'échange. Pour affiner une réponse en trois allers-retours, vous restez dans la conversation.

**Récap**

- Isoler, paralléliser, restreindre (lecture seule, modèle léger, skill préchargé).
- Workflows : des dizaines d'agents, cité seulement.
- Pas pour itérer.

---

## Exemple dev (écran : `explorateur.md`, puis démo)

**À dire**

L'explorateur du dépôt Norrsken. Trois lignes. Ses outils : lecture, recherche, rien d'autre. Son modèle : plus léger. Sa consigne : ce qu'il doit rapporter, et sous quelle forme.

Regardez la taille de ma conversation. *(taper /context)* Notez le chiffre.

*(taper)* « Utilise le sous-agent explorateur : où est géré l'export PDF, et quelles fonctions sont impliquées ? »

… Voilà le résumé. Cinq lignes, des chemins, des noms de fonctions. Et ma conversation ? *(taper /context)* Elle a grossi de ces cinq lignes. Les fichiers qu'il a lus n'y sont pas. Ils n'y seront jamais.

**Récap**

- Fichier : `tools` lecture seule, `model` léger, format du rapport.
- `/context` avant. Mission nommée. Résumé cinq lignes. `/context` après.

---

## Exemple métier (écran : `veille-concurrent.md`)

**À dire**

Côté commercial. Ce sous-agent lit des pages web et une fiche produit concurrente, et ne rapporte que les différences qui comptent pour un argumentaire. Cinq au plus, avec la source de chacune.

Sans lui, quinze pages web entrent dans la conversation, et la réponse au ticket que vous rédigez ensuite en souffre. Avec lui, cinq lignes entrent.

Pour la démo, il lit deux fiches fictives dans un dossier plutôt que le web. Même mécanique, sans dépendre du réseau.

**Récap**

- Lit beaucoup, rapporte cinq différences sourcées.
- Sans : quinze pages dans la conversation. Avec : cinq lignes.

---

## 3.4 — La tâche qui inonde

**À dire**

À vous. Sur la fiche, une ligne. Quelle tâche de votre semaine produit des pages que vous ne relisez jamais ? Et qu'est-ce que vous voudriez en retenir, en cinq lignes ? Deux minutes, seul.

*(après deux minutes)* Une phrase chacun, on fait le tour. Je note.

*(pendant le tour, relever deux ou trois cas qui ne sont pas des sous-agents)* Celle-là, c'est un aller-retour : vous voulez affiner. Ça reste dans la conversation. Celle-ci, c'est la même procédure chaque fois : c'est un skill. Celle-là, oui : beaucoup de sortie, une conclusion, un sous-agent.

Le signal, à côté de la ligne : une tâche annexe produit des pages de sortie que vous ne relirez jamais.

Le stagiaire lit ce qu'on lui donne. Mais jusqu'ici, tout ce que Claude lit, quelqu'un l'a mis dans un dossier. Le CRM, la base de données, le Drive : il ne les voit pas. C'est le Module 4.

**Récap**

- Deux minutes seul, une phrase chacun, noter au tableau.
- Trier en direct : itération → conversation ; procédure → skill ; bavard → sous-agent.
- Signal : des pages jamais relues. L'écrire.
- Transition : ce qu'il ne voit pas encore, Module 4.
