# Module 3 — Sous-agents : déléguer et isoler

**Durée** : 20 min, tous ensemble, au retour de la pause.
**Plan général** : [[plan-cours-extensions-claude-code]] · Précédent : [[02-skills]] · Script oral : `scripts/03-sous-agents.md` · Slides 3.1 à 3.4 dans [[slides]] · TP : [[tp-03-tache-qui-inonde]] · Matériel : [[materiel]].
**Objectif du module** : à la fin, chaque participant (1) sait ce qu'est un sous-agent et ce qu'il rapporte ; (2) a vu, sur `/context`, qu'une recherche déléguée ne charge pas la conversation principale ; (3) a nommé une tâche de sa semaine qui devrait être déléguée.

Troisième ligne du tableau de la slide 0.3 : le stagiaire à qui le collègue délègue une recherche, et qui revient avec un résumé.

Ce module ne construit rien. L'Atelier A construira le sous-agent `verif`.

---

## Déroulé minuté

| Min | Séquence | Format |
|---|---|---|
| 0–2 | Accroche : la conversation inondée | Oral, slide 0.3 |
| 2–8 | Concept : contexte propre, consigne propre, outils propres, un résumé | Slides 3.1 à 3.3 |
| 8–11 | Exemple dev : `explorateur`, `/context` avant et après | Écran |
| 11–13 | Exemple métier : `veille-concurrent` | Écran, fichier ouvert |
| 13–18 | Mini-exercice : la tâche qui inonde, tour de table | Slide 3.4, papier |
| 18–20 | Signal déclencheur, transition vers MCP | Oral |

---

## 0–2 min — Accroche

Au retour de pause, une question : « Qui a déjà demandé à Claude de chercher quelque chose dans un gros dossier, et s'est retrouvé avec quarante pages de sortie qu'il n'a jamais relues ? » Puis : « Et ensuite, la conversation était-elle aussi bonne qu'avant ? » Non. Tout ce qui est entré dans la conversation y reste, et pèse sur ce qui suit.

Slide 0.3, ligne Sous-agents en gras. Le collègue ne lit pas lui-même les deux cents dossiers : il envoie le stagiaire, qui revient avec une page.

---

## 2–8 min — Concept

Slide 3.1 : *Un stagiaire, une mission, un résumé.*

**Ce que c'est.** Un agent lancé par Claude pour une tâche précise, avec :

- son propre contexte, vide au départ ;
- sa propre consigne, écrite dans un fichier ;
- ses propres outils autorisés, qui peuvent être moins nombreux que ceux de la conversation principale.

Quand il a fini, il ne renvoie qu'un résumé. Tout ce qu'il a lu, cherché, exécuté reste chez lui et disparaît.

**Le fichier.** `.claude/agents/<nom>.md`, à côté de `.claude/skills/`. Un en-tête avec le nom, la description (qui dit quand déléguer), la liste des outils, éventuellement le modèle. Le corps est la consigne : qui il est, ce qu'il doit faire, ce qu'il doit rapporter et sous quelle forme.

Slide 3.2 : *Ce qu'il voit, ce qu'il ne voit pas.*

| Il voit | Il ne voit pas |
|---|---|
| Sa consigne | La conversation en cours |
| La mission que Claude lui confie | Ce que vous avez dit avant |
| Le CLAUDE.md du projet | Les skills, sauf ceux préchargés dans son en-tête |

Conséquence pratique : la mission doit être formulée en entier, comme à quelqu'un qui arrive. « Cherche ça » ne suffit pas ; « cherche où est géré X dans ce dépôt et rapporte les fichiers et les fonctions concernés, rien d'autre » suffit.

**Comment on le lance.** En le nommant dans la demande (« utilise le sous-agent explorateur pour… »), ou en laissant Claude décider d'après la description. Par défaut, il tourne en arrière-plan : on continue à travailler et le résumé arrive quand il a fini.

Slide 3.3 : *Trois usages.*

1. **Isoler** : une tâche bavarde (tests, logs, recherche dans deux cents fichiers) dont seule la conclusion compte.
2. **Paralléliser** : trois recherches indépendantes, trois sous-agents en même temps, trois résumés.
3. **Spécialiser et restreindre** : un sous-agent en lecture seule qui ne peut rien modifier ; un sous-agent sur un modèle plus léger pour les tâches simples ; un sous-agent qui a déjà chargé un skill de référence.

Au-delà de quelques sous-agents, il existe les *workflows dynamiques* : un script, écrit par Claude, qui en orchestre des dizaines. À citer en une phrase, sans démonstration ; c'est pour les audits de code entiers et les migrations massives, pas pour un ticket.

**Ce qu'un sous-agent n'est pas.** Ce n'est pas un moyen d'itérer : il n'a pas la mémoire de l'échange. Pour affiner une réponse en trois allers-retours, on reste dans la conversation. Pour une question rapide, aussi.

---

## 8–11 min — Exemple dev

Ouvrir `demo-norrsken/.claude-cible/dev/.claude/agents/explorateur.md`. Trois lignes à pointer : `tools` limité à la lecture ; `model` plus léger ; la consigne qui dit exactement quoi rapporter.

Démo courte, sur le dépôt de démo :

1. `/context` : noter la taille de la conversation.
2. « Utilise le sous-agent explorateur : où est géré l'export PDF, et quelles fonctions sont impliquées ? »
3. Le résumé arrive : cinq lignes, des chemins, des noms de fonctions.
4. `/context` : la conversation n'a grossi que de ces cinq lignes. Les fichiers lus par le sous-agent n'y sont pas.

Détail et filet dans [[demos-formateur]]. Le dépôt applicatif `demo-norrsken/app/` suffit (une vingtaine de fichiers) ; l'explorateur y trouve `src/export/` et `buildPlanningModel()`.

---

## 11–13 min — Exemple métier

Ouvrir `demo-norrsken/.claude-cible/support/.claude/agents/veille-concurrent.md`. Il lit des pages web et une fiche produit concurrente, et ne rapporte que les différences qui comptent pour un argumentaire : cinq au plus, avec la source de chacune.

Le point à faire passer : sans sous-agent, quinze pages web entrent dans la conversation et la réponse au ticket qui suit en souffre. Avec, seules cinq lignes entrent.

Pour la démo, le sous-agent lit deux fiches concurrentes fictives dans `support/veille/` plutôt que le web : même mécanique, sans dépendre du réseau.

---

## 13–18 min — Mini-exercice

Slide 3.4. Chacun, sur la fiche [[tp-03-tache-qui-inonde]], écrit en une ligne une tâche de sa semaine qui inonde une conversation, et ce qu'il voudrait en retenir. Deux minutes seul, puis tour de table rapide : une phrase par personne, le formateur note au tableau.

Ce que le formateur fait des réponses : il en marque deux ou trois qui ne sont *pas* des sous-agents (une tâche d'itération, une question courte, une procédure répétée qui est en fait un skill). C'est là que la distinction se fixe.

Pas de version démo pour ce module : l'exercice est oral.

---

## 18–20 min — Signal et transition

Le signal, au tableau à côté de la ligne Sous-agents : *une tâche annexe produit des pages de sortie que tu ne reliras jamais.*

Transition : « Le stagiaire lit ce qu'on lui donne. Mais jusqu'ici, tout ce que Claude lit, quelqu'un l'a mis dans un dossier. Le CRM, la base de données, le Drive, il ne les voit pas. C'est le Module 4. »

---

## Supports

Slides 3.1 à 3.4 dans [[slides]]. Fichiers ouverts à l'écran : les deux agents cibles dans `demo-norrsken/.claude-cible/`.

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à ce module :

- Agents cibles écrits et testés : `explorateur` (dev), `veille-concurrent` (support).
- `demo-norrsken/` sur la machine de projection, avec le contenu de `.claude-cible/dev/` copié à sa racine.
- Deux fiches concurrentes fictives dans `demo-norrsken/support/veille/`.
- `participants/squelettes/agent.md`.
- La fiche papier du TP 3, une par participant.
- Les deux `/context` et le résumé de l'explorateur, générés la veille ([[demos-formateur]]).

---

## Pièges et questions fréquentes

**« Il ne se souvient pas de ce que je lui ai dit. »** Normal : il ne voit pas la conversation. Tout ce dont il a besoin doit être dans sa consigne ou dans la mission. Si on a besoin de mémoire d'échange, ce n'est pas un sous-agent, c'est la conversation.

**« Comment je sais qu'il a été utilisé ? »** Claude l'indique dans sa sortie, et `/context` montre que la conversation n'a pas grossi. Pour l'imposer, le nommer dans la demande.

**« Sous-agent ou skill ? »** Le skill est une procédure que Claude suit *dans* la conversation : le résultat et tout ce qui a servi à le produire y entrent. Le sous-agent produit *à côté* et ne rapporte que la fin. Bavard et jetable : sous-agent. Court et à garder sous les yeux : skill. Un skill peut d'ailleurs demander à tourner dans un sous-agent ; on ne le montre pas aujourd'hui.

**« Ça coûte plus cher ? »** Il fait le travail une fois, ailleurs, au lieu de le faire dans une conversation qui traîne ensuite tout ce contexte à chaque échange. Sur une session longue, c'est moins cher. Et on peut lui donner un modèle plus léger.

**« Peut-il modifier des fichiers ? »** S'il a l'outil. Un sous-agent de relecture ou de recherche n'a que la lecture, et c'est une garantie : il ne peut rien casser. C'est ce que l'Atelier A construira avec `verif`.

**« Et `/agents` ? »** La commande ne fait plus qu'afficher un rappel : on crée le fichier dans `.claude/agents/`, à la main ou en demandant à Claude de l'écrire.

**Dérive à éviter** : l'exercice qui devient une liste de souhaits d'automatisation. La question est « qu'est-ce qui inonde », pas « qu'est-ce que je voudrais automatiser ». Ramener à la sortie qu'on ne relit pas.
