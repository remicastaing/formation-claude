# Module 8 — Restitution croisée et arbitrages

**Durée** : 25 min, tous ensemble, après les ateliers.
**Plan général** : [[plan-cours-extensions-claude-code]] · Précédent : [[07a-atelier-dev]], [[07b-atelier-metier]] · Script oral : `scripts/08-restitution.md` · Slides 8.1 à 8.5 dans [[slides]] · Quiz : [[quiz-arbitrage]], réponses dans [[quiz-reponses]] · Matériel : [[materiel]].
**Objectif du module** : à la fin, chaque participant (1) a vu ce que l'autre équipe a construit et compris que c'est le même outil ; (2) sait choisir le bon mécanisme pour un besoin donné, et sait qu'une règle peut en demander deux ; (3) sait ce que chaque mécanisme coûte en contexte, et connaît les quatre erreurs classiques.

C'est le module qui ferme la boucle avec le tour de salle du matin : les plaintes notées au tableau à gauche reçoivent chacune leur mécanisme.

---

## Déroulé minuté

| Min | Séquence | Format |
|---|---|---|
| 0–5 | Restitution de l'atelier support aux devs | Un binôme à l'écran, slide 8.1 |
| 5–10 | Restitution de l'atelier dev au support | Un binôme à l'écran |
| 10–20 | Quiz d'arbitrage, main levée | Slides 8.2, 8.3 |
| 20–23 | Coût de contexte : ce que chaque mécanisme charge, et quand | Slide 8.4 |
| 23–25 | Erreurs classiques, retour aux plaintes du matin | Slide 8.5, tableau |

---

## 0–10 min — Restitution croisée

Un binôme par atelier, choisi à la clôture. Consigne sur la slide 8.1 : montrer une *réponse* ou un *correctif*, pas une configuration. Trois minutes de démonstration, deux de questions de l'autre équipe.

**Support d'abord.** Le binôme prend un ticket qu'il a traité à l'étape 5, lance `/reponse-ticket`, et montre la réponse avec sa ligne d'audit. Puis il lit une ligne de sa fiche de test croisé : ce qui clochait, quel mécanisme le corrige. Ce que les devs doivent voir : le support a construit un vrai outil, avec une procédure, un accès et un garde-fou, sans écrire une ligne de code.

**Dev ensuite.** Le binôme lance `/triage-bug T-0417` ou montre le correctif et le rapport de `verif`. Puis il tente une édition dans `migrations/` et montre le refus. Ce que le support doit voir : les garde-fous ont une forme concrète, un script qui dit non, et c'est la même chose que leur garde d'envoi.

**Le pont**, à faire par le formateur si aucun binôme ne l'a fait : le ticket T-0405. Le support l'a refusé par écrit grâce à la grille tarifaire ; les devs ont trouvé, ou pourront trouver, le cumul de remises dans le code. Même fait, deux côtés, deux mécanismes.

Tenir le temps : un chronomètre visible, et le formateur coupe à cinq minutes.

---

## 10–20 min — Quiz d'arbitrage

Slide 8.2 : les dix besoins, sans les réponses. Le formateur lit un besoin ; la salle vote à main levée : CLAUDE.md, skill, sous-agent, MCP, hook, plugin. Six cartons de couleur au tableau, ou six gestes convenus. Puis la réponse et une phrase de justification. Les dix besoins et les réponses commentées sont dans [[quiz-reponses]] ; la version distribuée sans réponses est [[quiz-arbitrage]].

Rythme : une minute par question. Les six premières sont celles du plan, une par mécanisme, dans le désordre. Les quatre suivantes sont les pièges :

- une règle qui demande **deux** mécanismes (la consigne et le hook) ;
- un besoin qui ressemble à un sous-agent mais qui est un skill (même procédure, résultat à garder sous les yeux) ;
- un besoin qui ressemble à un skill mais qui est une ligne de CLAUDE.md (toujours vrai, une ligne) ;
- un besoin où la salle votera MCP alors que rien ne manque : Claude a déjà l'accès, il manque le savoir-faire.

Slide 8.3 après le vote de la dernière question : le tableau complet avec les réponses, laissé à l'écran pendant le point suivant.

---

## 20–23 min — Coût de contexte

Slide 8.4. Un tableau, une ligne par mécanisme, ce qu'il charge et quand. Le lire en montrant `/context` sur la machine du formateur, après une journée de session : on y voit les fichiers mémoire, la taille de la liste des skills, les outils MCP.

| Mécanisme | Ce qui entre dans la conversation | Quand |
|---|---|---|
| CLAUDE.md | Tout le fichier, et ceux des dossiers parents | À chaque session, en entier |
| Skill | La description ; le corps seulement si déclenché, et il reste ensuite | Démarrage ; puis à l'usage |
| Sous-agent | Le résumé qu'il rapporte, rien d'autre | À la fin de sa mission |
| MCP | La liste des outils du serveur, et les résultats des appels | Connexion ; puis à chaque appel |
| Hook | Rien, sauf ce qu'il renvoie explicitement | Jamais, ou au retour |
| Plugin | La somme de ce qu'il contient | Selon chaque composant |

Deux conséquences à dire :

1. **Trop de skills mal décrits rendent Claude moins bon.** Chaque description occupe une part d'un budget limité ; au-delà, les descriptions des skills les moins utilisés sont tronquées, et Claude déclenche moins bien. `/skill-doctor` donne le coût et l'usage de chacun. Un skill qu'on n'utilise pas se désactive.
2. **Ce qui entre reste.** Une recherche de deux cents fichiers faite dans la conversation pèse sur tout ce qui suit ; la même faite par un sous-agent pèse cinq lignes. C'est la raison d'être du Module 3.

---

## 23–25 min — Erreurs classiques et retour au tableau

Slide 8.5, quatre erreurs, une phrase chacune :

1. **Le CLAUDE.md de 600 lignes.** Il coûte à chaque session et il est moins suivi. Ce qui n'est pas toujours vrai va dans un skill ou une règle ciblée.
2. **La description de skill vague.** « Aide pour le support » : jamais déclenché, ou tout le temps.
3. **Le garde-fou dans un prompt.** Une consigne demande, un hook garantit. Si ça ne doit jamais partir, c'est un script.
4. **Les serveurs MCP qui traînent.** Des outils chargés pour rien, et une porte ouverte de plus. On débranche.

Puis le tableau de gauche, celui du tour de salle. Le formateur reprend chaque plainte notée le matin et demande à la salle, en un mot, le mécanisme. Deux minutes, pas plus : c'est la conclusion du cours avant la clôture.

---

## Supports

Slides 8.1 à 8.5 dans [[slides]]. À l'écran pendant la restitution : les postes des deux binômes. Pendant le coût de contexte : `/context` du formateur.

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à ce module :

- [[quiz-arbitrage]] imprimé, un par participant, distribué au début du quiz (pas avant).
- [[quiz-reponses]] pour le formateur seulement.
- Six cartons ou six gestes pour le vote ; un chronomètre visible.
- Une session du formateur ouverte depuis le matin, pour montrer un `/context` chargé.
- Le tableau du tour de salle intact.

---

## Pièges et questions fréquentes

**« Pourquoi deux réponses sont acceptées à la question 7 ? »** Parce que c'est vrai : la ligne de CLAUDE.md dit à Claude ce qu'on attend, le hook garantit. Une règle « jamais » a besoin des deux. C'est la question la plus importante du quiz.

**« MCP à la question 10, pourquoi c'est faux ? »** Le CRM est déjà connecté ; Claude ne sait pas *quoi* y chercher. L'accès est là, le savoir-faire manque : skill. C'est le tableau du Module 4.

**« Le sous-agent coûte zéro ? »** Non : il coûte son travail, ailleurs. Ce qui est vrai, c'est que la conversation principale ne porte que le résumé.

**« Combien de skills, c'est trop ? »** Il n'y a pas de chiffre ; il y a `/skill-doctor`. Si des descriptions sont tronquées, c'est trop. On désactive ceux qu'on n'utilise pas plutôt que d'en supprimer.

**Dérive à éviter** : une restitution qui montre des fichiers de configuration pendant cinq minutes. Couper : « Montrez-nous une réponse. »

**Dérive à éviter** : débattre dix minutes sur une question du quiz. Donner la réponse, la justification en une phrase, et passer. Le débat est pour le J+15.
