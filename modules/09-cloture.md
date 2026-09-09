# Module 9 — Clôture

**Durée** : 10 min, tous ensemble.
**Plan général** : [[plan-cours-extensions-claude-code]] · Précédent : [[08-restitution]] · Script oral : `scripts/09-cloture.md` · Slides 9.1 à 9.3 dans [[slides]] · Distribué : [[grille-declencheur-mecanisme]], [[fiche-engagement]] · Suite : [[suivi-j15]] · Matériel : [[materiel]].
**Objectif du module** : à la fin, chaque participant (1) repart avec une page qui relie chaque signal à son mécanisme ; (2) a écrit *le* premier ajout qu'il fera lundi, en une ligne vérifiable ; (3) sait qu'un point à J+15 aura lieu et ce qu'on y comparera.

---

## Déroulé minuté

| Min | Séquence | Format |
|---|---|---|
| 0–3 | La grille : une page, six signaux | Slide 9.1, distribution |
| 3–7 | L'engagement : le premier ajout de lundi | Slide 9.2, fiche |
| 7–9 | La suite : J+15 et le plugin d'équipe | Slide 9.3 |
| 9–10 | Le mot de la fin | Slide 0.3, une dernière fois |

---

## 0–3 min — La grille

Distribuer [[grille-declencheur-mecanisme]], une page recto. Slide 9.1, la même grille. Ne pas la lire : la salle l'a construite pendant la journée, signal par signal, au tableau. Dire seulement comment s'en servir : « Lundi, quand Claude vous agace, cherchez la ligne. Le signal vous dit le mécanisme ; la colonne de droite vous dit où est le fichier. »

Deux précisions, une phrase chacune :

- La ligne « jamais » a deux mécanismes, et c'est voulu.
- La dernière ligne de la grille est l'ordre de construction pour une équipe qui part de zéro : fiche de poste, une procédure, un accès, un garde-fou, puis le kit. C'est l'ordre des ateliers.

---

## 3–7 min — L'engagement

Slide 9.2. Fiche [[fiche-engagement]] : la moitié haute a servi en atelier (trois améliorations), la moitié basse est pour maintenant.

Consigne : *le* premier ajout, un seul, que vous ferez lundi. Pas « je vais explorer les skills » : « j'écris le CLAUDE.md du dossier devis, dix lignes, lundi avant 10 h ». Trois critères sur la slide : un mécanisme, un fichier, un moment. Deux minutes seul.

Puis un tour rapide, une phrase par personne, et le formateur note au tableau, à droite, sous le cercle de la boucle : le prénom et le mécanisme. C'est la liste qu'on rouvrira à J+15.

Ce que le formateur repère : un engagement flou (le renvoyer aux trois critères, gentiment), et un engagement trop gros (« le plugin de toute l'équipe » : commencer par la fiche de poste, le plugin viendra à J+15).

---

## 7–9 min — La suite

Slide 9.3. Un point à J+15, une heure, tous ensemble ou par équipe selon les agendas. Trois choses qu'on y fera, détaillées dans [[suivi-j15]] :

1. Chacun montre ce qu'il a réellement construit, en regard de son engagement. Sans jugement : ce qui n'a pas été fait dit quelque chose du signal ou du mécanisme.
2. On rassemble ce qui est réutilisable dans le plugin d'équipe, `norrsken-support` ou `norrsken-dev`, et on fait une première mise à jour de version.
3. On choisit le prochain ajout collectif.

Donner la date, ou la fenêtre, et qui envoie l'invitation.

---

## 9–10 min — Le mot de la fin

Réafficher la slide 0.3, le tableau du nouveau collègue, sans rien surligner. Le mot de la fin, en trois phrases, dans le script. L'idée : ce matin il ne savait rien ; ce soir il a une fiche de poste, des procédures, un stagiaire, des accès, des règles du bâtiment et un kit ; et tout ça est écrit, dans des fichiers que vous pouvez relire, corriger, et donner.

Remercier, libérer.

---

## Supports

Slides 9.1 à 9.3 dans [[slides]], puis la slide 0.3.

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à ce module :

- [[grille-declencheur-mecanisme]] imprimée, une par participant, recto seul.
- [[fiche-engagement]] imprimée, une par participant, distribuée **au début des ateliers** (la moitié haute sert au Module 7).
- La date du J+15 décidée avant la séance, et le nom de la personne qui envoie l'invitation.
- Le tableau de droite avec de la place pour la liste des engagements.

---

## Pièges et questions fréquentes

**« Et si mon engagement demande un dev ? »** Alors l'engagement, c'est de lui demander lundi, et de faire soi-même la partie qu'on peut faire : le CLAUDE.md, la description du skill. Le dev fait le hook.

**« On peut avoir les fichiers de la démo ? »** Oui : `demo-norrsken/.claude-cible/` est la configuration complète, et le catalogue de plugins est dans `demo-norrsken/marketplace/`. Le dire, et dire où c'est.

**« Qui maintient le plugin d'équipe ? »** La question du J+15. Une personne par plugin, nommée ce jour-là, et un dépôt git interne pour le catalogue.

**Dérive à éviter** : un tour de table qui dure. Une phrase par personne ; le formateur écrit et dit « suivant ». Dix minutes, c'est la fin de la journée, la salle est fatiguée.

**Dérive à éviter** : rouvrir un débat technique au moment du mot de la fin. Renvoyer au J+15.
