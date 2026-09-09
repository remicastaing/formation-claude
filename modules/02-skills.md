# Module 2 — Les skills : savoir à la demande et workflows invocables

**Durée** : 35 min, tous ensemble.
**Plan général** : [[plan-cours-extensions-claude-code]] · Précédent : [[01-claude-md]] · Script oral : `scripts/02-skills.md` · Slides 2.1 à 2.6 dans [[slides]] · TP : [[tp-02-reponse-ticket]] · Matériel : [[materiel]].
**Objectif du module** : à la fin, chaque participant (1) sait ce qu'est un skill, où il vit et quand son contenu est chargé ; (2) a construit `/reponse-ticket` en suivant le formateur et l'a testé sur trois tickets ; (3) sait pourquoi la description est la ligne qui compte, et sait la corriger quand le skill ne se déclenche pas.

Deuxième ligne du tableau de la slide 0.3 : les procédures que le collègue consulte quand il en a besoin.

---

## Déroulé minuté

| Min | Séquence | Format |
|---|---|---|
| 0–2 | Accroche : la procédure de trois pages, le prompt retapé | Oral, slide 0.3 |
| 2–9 | Concept : anatomie, deux natures, chargement paresseux, invocation | Slides 2.1 à 2.3 |
| 9–12 | Exemple dev : `/review` | Écran, fichier ouvert |
| 12–14 | Exemple métier : `produits-et-tarifs`, `/compte-rendu-rdv` | Écran, fichier ouvert |
| 14–29 | Démo en direct suivie par la salle : construire `/reponse-ticket`, trois tickets, corriger la description | Écran + postes, slide 2.4 |
| 29–33 | Débrief : pourquoi le deuxième ticket n'a pas déclenché | Slide 2.5 |
| 33–35 | Signal déclencheur, transition vers la pause | Slide 2.6 |

---

## 0–2 min — Accroche

Reprendre la fin du Module 1 : on ne met pas la procédure de traitement d'un ticket dans la fiche de poste. Elle fait trois pages et ne sert qu'une fois sur dix. Où va-t-elle ?

Deuxième accroche, côté dev : « Qui a déjà retapé le même prompt de revue de code trois fois dans la même semaine ? » Mains levées. C'est le signal de ce module, on y revient à la fin.

Réafficher la slide 0.3, ligne Skills en gras : les procédures qu'il consulte quand il en a besoin. Pas celles qu'il connaît par cœur.

---

## 2–9 min — Concept

Slide 2.1 : *Un dossier, un fichier.*

**Ce que c'est.** Un dossier au nom du skill, dans `.claude/skills/`, qui contient un fichier `SKILL.md`. En tête, entre deux lignes `---`, un nom et une description. En dessous, le corps : ce que Claude doit faire ou savoir, en français. Le dossier peut contenir d'autres fichiers (un exemple, une grille, un script) que le corps référence par un lien ; ils ne sont lus que si Claude suit le lien.

**Où il vit.** Trois endroits, comme CLAUDE.md : personnel (`~/.claude/skills/`), projet (`.claude/skills/` à la racine du dossier de travail), plugin (Module 6). Les participants métier travaillent dans `support/`, donc leurs skills vont dans `support/.claude/skills/`.

Slide 2.2 : *Deux natures.*

| Référence | Action |
|---|---|
| Un savoir que Claude applique pendant toute la session | Une procédure qu'on lance |
| La grille tarifaire, le guide de style de l'API | `/reponse-ticket`, `/review` |
| Claude le charge lui-même quand le sujet arrive | On tape `/nom`, ou Claude le déclenche s'il juge que c'est le moment |

Même fichier, même format. La différence est dans l'usage, et dans une ligne d'en-tête pour les actions à effets de bord : `disable-model-invocation: true` réserve le skill à l'invocation manuelle. Un skill qui envoie, publie ou déploie porte cette ligne.

Slide 2.3 : *Ce qui est lu, et quand.*

Au démarrage, Claude ne lit que la description de chaque skill. Toutes les descriptions, de tous les skills. Le corps n'est lu que quand le skill est déclenché, et il reste ensuite dans la conversation jusqu'à la fin.

Deux conséquences, à dire lentement :

1. **La description décide.** C'est la seule chose que Claude voit avant de choisir. Une description vague, et le skill n'est jamais déclenché ; une description trop large, et il se déclenche à tort. La démo va le montrer.
2. **Un skill inutilisé coûte peu**, une ligne. Un CLAUDE.md de 600 lignes coûte 600 lignes à chaque session. C'est pour ça qu'on sort les procédures de CLAUDE.md.

À vérifier avec la salle dev : la liste des descriptions a un budget, environ 1 % du contexte ; au-delà, les descriptions des skills les moins utilisés sont tronquées. `/skill-doctor` donne le coût de chacun. On y reviendra au Module 8.

**Invocation.** `/nom` suivi d'arguments ; dans le corps, `$ARGUMENTS` reprend ce qui a été tapé après le nom. `/skills` liste ce qui est disponible. Les anciennes « slash commands » de `.claude/commands/` sont désormais des skills, avec le même nom ; on ne crée plus de commandes.

---

## 9–12 min — Exemple dev

Ouvrir `demo-norrsken/.claude-cible/dev/.claude/skills/review/SKILL.md`. Trois choses.

1. **La description dit quand.** « Relire un diff ou une PR avant de la proposer. » Pas « outil de revue de code ».
2. **Le corps est une checklist**, pas une dissertation : sécurité, tests, nommage, migrations. Chaque point se vérifie. C'est la même règle qu'au Module 1, à l'échelle d'une procédure.
3. **`$ARGUMENTS`** : `/review` seul relit le diff courant ; `/review 42` relit la PR 42. Une ligne dans le corps suffit.

Faire remarquer que cette checklist est exactement ce que le dev retapait trois fois par semaine.

---

## 12–14 min — Exemple métier

Ouvrir `demo-norrsken/.claude-cible/support/.claude/skills/produits-et-tarifs/SKILL.md`. C'est un skill de *référence* : pas de `/`, pas de procédure. Les trois offres, les prix, les deux remises et leur règle de non-cumul, les délais SLA par offre. Claude le charge quand un ticket parle de prix ou de délai, et cesse d'inventer.

Relier au Module 0 : le « deux jours ouvrés » de la réponse configurée vient d'ici, ligne SLA Pro.

Citer `/compte-rendu-rdv` sans l'ouvrir : notes brutes d'un rendez-vous commercial en entrée, compte rendu structuré et prochaines actions en sortie. Même mécanique que `/reponse-ticket`, autre métier. Il sera dans le plugin du Module 6.

---

## 14–29 min — Démo en direct suivie par la salle

Slide 2.4, consigne. Le formateur construit `/reponse-ticket` à l'écran ; les participants font la même chose sur leur poste, étape par étape, en suivant [[tp-02-reponse-ticket]]. Les tables dev peuvent construire `/review` à la place, même étapes.

Déroulé du formateur (détail, commandes et filet dans [[demos-formateur]]) :

| Min | Étape |
|---|---|
| 14–17 | Créer le dossier et le fichier à partir du squelette. Description **volontairement étroite** : « Rédige la réponse à un ticket support. » |
| 17–19 | Corps : classer (bug / question / facturation), lire la fiche client, rédiger dans le ton de CLAUDE.md, proposer un article KB. |
| 19–22 | Ticket 1, T-0417 : « Prépare la réponse au ticket T-0417. » Le skill se déclenche. Montrer le classement et l'article joint. |
| 22–25 | Ticket 2, T-0402 : « Léa Brossard nous demande comment partager un planning avec un sous-traitant, tu lui réponds quoi ? » Le skill **ne se déclenche pas**. La réponse est correcte mais sans classement, sans KB, hors procédure. Laisser la salle constater. |
| 25–27 | Corriger la description : ajouter les façons dont on parle d'un ticket sans dire « ticket ». Relancer la même demande dans une nouvelle session : le skill se déclenche. |
| 27–29 | Ticket 3, T-0431, facturation : « Réponds à la réclamation de Brossard sur la facture. » Se déclenche, et le classement « facturation » renvoie la question du montant au chargé de compte. |

Ce que le formateur fait entre deux étapes : passer dans les rangs, vérifier que les fichiers sont au bon endroit. Le piège numéro un est le dossier : `.claude/skills/reponse-ticket/SKILL.md`, pas `.claude/reponse-ticket.md`.

Si la salle n'a pas Claude Code : le formateur seul, la salle dicte la description corrigée. Même durée.

---

## 29–33 min — Débrief

Slide 2.5 : *La description décide.* Côte à côte, la description v1 et la v2.

Ce qui s'est passé au ticket 2 : la demande ne contenait pas le mot « ticket ». Claude a lu toutes les descriptions, aucune ne correspondait, il a répondu avec ce qu'il avait. La réponse n'était pas mauvaise ; elle était hors procédure, et personne ne l'aurait vu.

Règle d'écriture d'une description, trois parties dans cet ordre :

1. Ce que le skill fait, avec un verbe.
2. Quand l'utiliser, avec les mots que les gens emploient réellement : « réponse à un client », « ce client nous écrit », « réclamation », « mail de Brossard ».
3. Ce qu'il ne fait pas, si le voisinage prête à confusion (« pas pour les relances commerciales »).

Contre-exemple : une description qui dit « aide pour le support ». Elle se déclenchera sur tout et sur rien.

Reprendre la question du Module 0 : qu'est-ce qui garantit que le skill est utilisé ? Rien. Claude le déclenche s'il juge que c'est le moment. Un skill est une procédure disponible, pas une procédure imposée. Pour imposer, Module 5.

---

## 33–35 min — Signal et transition

Slide 2.6. Le signal, à écrire au tableau à côté de la ligne Skills : *tu retapes le même prompt, ou tu colles la même procédure, pour la troisième fois.*

Transition : « Pause de quinze minutes. Au retour, on parle du stagiaire : ce que fait le collègue quand une recherche va inonder sa journée. »

---

## Supports

Slides 2.1 à 2.6 dans [[slides]]. Fichiers ouverts à l'écran : les deux skills cibles dans `demo-norrsken/.claude-cible/`, puis le skill construit en direct.

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à ce module :

- Skills cibles écrits et testés : `review` (dev), `produits-et-tarifs` et `reponse-ticket` (support).
- Trois tickets : T-0417, T-0402, T-0431, plus la fiche client Brossard et l'article KB de partage.
- `participants/squelettes/SKILL.md`.
- Un dossier `support/` de démo **sans** `.claude/skills/` au début de la démo ; le formateur le crée devant la salle.
- Les réponses des trois tickets, avec et sans skill, générées la veille ([[demos-formateur]]).

---

## Pièges et questions fréquentes

**« Le skill n'apparaît pas dans `/skills`. »** Le dossier ou le nom. Il faut `.claude/skills/<nom>/SKILL.md`, le fichier en majuscules, et le dossier de travail de la session doit contenir ce `.claude/`. Si la session a été ouverte avant la création du fichier, la relancer.

**« Il apparaît mais ne se déclenche pas. »** Tester d'abord l'invocation manuelle `/nom` : si elle marche, c'est la description. La réécrire avec les mots de la demande qui n'a pas déclenché.

**« Il se déclenche trop. »** Description trop large. La resserrer, ou `disable-model-invocation: true` si le skill doit rester manuel.

**« Skill ou CLAUDE.md ? »** Ce dont il a besoin à chaque session, en quelques lignes : CLAUDE.md. Une procédure, une grille, un savoir qui ne sert qu'à l'occasion : skill. En cas de doute, skill : ça coûte une ligne tant que ce n'est pas utilisé.

**« Peut-on mettre des fichiers à côté ? »** Oui, et c'est le bon réflexe pour une grille tarifaire longue ou un exemple de réponse : le corps du skill reste court et renvoie au fichier par un lien. Le fichier n'est lu que si Claude suit le lien.

**« Claude peut-il lancer un skill tout seul ? »** Oui par défaut, s'il juge que la description correspond. C'est ce qu'on veut pour `/reponse-ticket`. C'est ce qu'on ne veut pas pour un skill qui envoie un mail : `disable-model-invocation: true`.

**Dérive à éviter** : un participant qui écrit un corps de skill de deux pages pendant la démo. Le corps de la démo tient en douze lignes ; le reste va dans un fichier à côté ou attend l'atelier.

**Dérive à éviter** : ouvrir le débat « c'est déterministe ou pas » avant le débrief. La réponse est au débrief, en une phrase, et au Module 5.
