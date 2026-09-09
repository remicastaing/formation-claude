# Module 5 — Hooks : ce qui doit arriver à chaque fois

**Durée** : 20 min, tous ensemble.
**Plan général** : [[plan-cours-extensions-claude-code]] · Précédent : [[04-mcp]] · Script oral : `scripts/05-hooks.md` · Slides 5.1 à 5.5 dans [[slides]] · TP : [[tp-05-garde-fou]] · Matériel : [[materiel]].
**Objectif du module** : à la fin, chaque participant (1) sait qu'un hook est un script déclenché par un événement de Claude Code, qui s'exécute quoi que le modèle décide ; (2) a vu une consigne CLAUDE.md contournée et un hook qui ne l'est pas ; (3) a écrit une règle de garde-fou de son métier et tranché si elle relève d'un hook ou d'une ligne de CLAUDE.md.

Cinquième ligne du tableau de la slide 0.3 : les règles du bâtiment. Troisième des trois questions : ce qui se passe *automatiquement*. C'est le module qui répond à la question posée au Module 0.

---

## Déroulé minuté

| Min | Séquence | Format |
|---|---|---|
| 0–1 | Accroche : la question de ce matin | Oral, slide 0.3 |
| 1–6 | Concept : événements, consigne vs hook, où ça se configure | Slides 5.1 à 5.3 |
| 6–9 | Démo dev : `.env` avec la consigne, puis avec le hook | Écran |
| 9–11 | Exemple métier : `garde-envoi` et l'audit du Module 0 | Écran, fichiers ouverts |
| 11–19 | Exercice en binôme : une règle, hook ou CLAUDE.md ? | Slide 5.4, papier |
| 19–20 | Signal, transition vers les plugins | Slide 5.5 |

---

## 0–1 min — Accroche

Reprendre la question laissée ouverte deux fois : « Qu'est-ce qui empêche la première réponse de ce matin d'être envoyée ? » Rien, jusqu'ici. Tout ce qu'on a construit, CLAUDE.md, skills, MCP, ce sont des choses que Claude *sait* ou *peut*. Rien de ce qu'il *doit*.

Slide 0.3, ligne Hooks en gras. Les règles du bâtiment : le badge, l'alarme incendie. Elles ne dépendent pas de la bonne volonté du collègue.

---

## 1–6 min — Concept

Slide 5.1 : *Un événement, un script.*

**Ce que c'est.** Claude Code émet des événements au fil de son travail : une session démarre, Claude va utiliser un outil, il vient de l'utiliser, il a fini de répondre. Un hook, c'est un script qu'on attache à un événement. Quand l'événement arrive, le script tourne, reçoit ce qui se passe (quel outil, quel fichier, quelle commande), et peut répondre : laisser faire, bloquer, ou renvoyer une information à Claude.

Quatre événements suffisent pour aujourd'hui :

| Événement | Quand | Ce qu'on en fait |
|---|---|---|
| `SessionStart` | La session démarre | Charger un contexte, vérifier un prérequis |
| `PreToolUse` | Claude *va* utiliser un outil | **Bloquer** : refuser une édition, une commande, un envoi |
| `PostToolUse` | Claude *vient* d'utiliser un outil | Réagir : lancer le linter, renvoyer ses erreurs |
| `Stop` | Claude a fini de répondre | Journaliser, vérifier que le travail est complet |

Un hook exécute le plus souvent un script sur le poste. Il peut aussi appeler une adresse web, un outil MCP, ou poser une question à un modèle ; on le cite, on n'en montre qu'un.

Slide 5.2 : *Une consigne demande, un hook garantit.*

C'est la phrase répétée depuis ce matin ; c'est ici qu'elle s'explique.

| CLAUDE.md dit « ne jamais éditer `.env` » | Un hook `PreToolUse` refuse l'édition de `.env` |
|---|---|
| Claude lit, comprend, et s'y conforme la plupart du temps | Le script tourne avant chaque édition, quoi que Claude ait décidé |
| Probabiliste | Déterministe |
| Coûte des lignes de contexte à chaque session | Coûte zéro contexte, sauf s'il renvoie quelque chose |

Deux conséquences. Un : *ce que vous ne voulez jamais voir partir chez un client, vous ne le confiez pas à une consigne, vous le mettez dans un hook.* Deux : un hook ne remplace pas la consigne, il la double. La consigne dit à Claude ce qu'on attend ; le hook s'assure que ça arrive.

Slide 5.3 : *Où ça se configure.*

Dans le fichier de réglages du projet, `.claude/settings.json`, sous une clé `hooks`. Pour chaque événement : un *matcher* qui dit sur quels outils le hook s'applique (`Edit|Write`, `Bash`, un outil MCP par son nom), et la commande à lancer. Le script reçoit les détails en entrée et répond par son code de sortie : zéro, on laisse faire ; deux, on bloque, et le message d'erreur est montré à Claude.

Montrer la structure à l'écran, dix secondes, sans la lire : un événement, un matcher, une commande. Le squelette des participants est pré-rempli.

À dire aux devs en une phrase : les hooks de projet ne tournent qu'après avoir accepté la confiance du dossier, et `/hooks` liste ce qui est configuré et d'où ça vient.

---

## 6–9 min — Démo dev

Le formateur seul, détail et filet dans [[demos-formateur]]. Le dépôt de démo avec le CLAUDE.md dev, qui contient « Ne jamais commiter de fichier `.env` » et, pour la démo, une ligne ajoutée : « Ne jamais modifier `.env` ».

1. Demande : « Le port de dev doit passer à 4000, mets à jour la configuration. » Claude cherche, trouve `.env`, et selon le jour : s'arrête et demande, ou modifie. Les deux issues servent : s'il demande, dire « il a bien lu la consigne, aujourd'hui » ; s'il modifie, la démonstration est faite.
2. Activer le hook `PreToolUse` sur `Edit|Write` qui refuse tout chemin contenant `.env` ou `app/migrations/`. Nouvelle session, même demande. Claude tente l'édition, le hook la refuse, Claude reçoit le message et propose une autre voie. Le fichier n'a pas bougé.
3. Montrer que ça n'a rien coûté : `/context` avant et après sont identiques.

Ce qu'on dit à la salle : ce n'est pas que la consigne est inutile. C'est qu'elle ne suffit pas pour ce qui ne doit *jamais* arriver.

---

## 9–11 min — Exemple métier

Ouvrir `demo-norrsken/.claude-cible/support/.claude/hooks/garde-envoi.sh`. Un hook `PreToolUse` sur tout outil MCP qui envoie (le matcher vise les outils dont le nom contient `send`). Il lit le texte à envoyer et refuse si : un montant en euros sans la mention « HT », ou un délai annoncé qui n'est pas dans la liste du SLA. Le message de refus dit lequel.

Puis `audit.sh`, sur `Stop` : chaque réponse rédigée ajoute une ligne dans `audit.log` avec la date, le ticket, la session. Ouvrir le fichier : la ligne de la démo du Module 0 y est. C'est ce qu'on avait montré sans l'expliquer.

Relier : la première réponse de ce matin, avec ses « 24 heures » et son mois offert, aurait été arrêtée par `garde-envoi` avant de partir. Même si CLAUDE.md avait été ignoré. Même si le skill ne s'était pas déclenché.

---

## 11–19 min — Exercice en binôme

Slide 5.4. Fiche [[tp-05-garde-fou]]. Chaque binôme écrit *une* règle de garde-fou de son métier, en une phrase, puis répond à trois questions qui tranchent : hook ou ligne de CLAUDE.md. Trois minutes pour écrire, trois pour trancher, deux pour un tour rapide : chaque binôme lit sa règle et son verdict.

Ce que le formateur fait pendant le tour : il conteste un ou deux verdicts. Les cas qui basculent : une règle formulée en hook qui n'a pas d'événement observable (« toujours être aimable » n'est pas un hook) ; une règle laissée en CLAUDE.md alors qu'elle décrit une chose qui ne doit jamais partir (« ne pas promettre de remboursement » est un hook sur l'envoi).

Si la salle n'a pas Claude Code : inchangé, l'exercice est sur papier.

---

## 19–20 min — Signal et transition

Slide 5.5. Le signal, au tableau à côté de la ligne Hooks : *tu veux qu'une chose se produise systématiquement, sans avoir à le demander.*

Transition : « Vous avez maintenant tout ce que l'atelier va construire : une fiche de poste, des procédures, un stagiaire, des accès, des règles du bâtiment. Reste une question : comment on donne tout ça à l'équipe de Lyon ? Module 6, dix minutes, et on passe aux ateliers. »

---

## Supports

Slides 5.1 à 5.5 dans [[slides]]. À l'écran : le `settings.json` dev, les deux scripts support, `audit.log`.

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à ce module :

- `jq` installé sur la machine de projection et sur les postes dev (les scripts l'utilisent).
- `.claude-cible/dev/.claude/settings.json` et `hooks/` : `garde-fichiers.sh`, `garde-rm.sh`, `lint.sh`, testés.
- `.claude-cible/support/.claude/settings.json` et `hooks/` : `garde-envoi.sh`, `audit.sh`, testés.
- Pour la démo : `app/.env` copié depuis `app/.env.example`, et le hook désactivé au départ (renommer `settings.json` en `settings.demo.json` et le remettre en séance).
- `participants/squelettes/hooks.json`.
- Fiche papier du TP 5.
- Les deux sorties de la démo `.env`, générées la veille ([[demos-formateur]]).

---

## Pièges et questions fréquentes

**« Le hook ne se déclenche pas. »** Dans l'ordre : `/hooks` pour vérifier qu'il est chargé et d'où ; la confiance du dossier acceptée ; le matcher, qui doit nommer l'outil exact (`Edit|Write`, pas `edit`) ; le script exécutable (`chmod +x`).

**« Il bloque mais Claude réessaie. »** C'est normal, et c'est bien : Claude reçoit le message de refus et cherche une autre voie. Si le message dit *pourquoi*, il ne tourne pas en rond. Un hook muet qui refuse sans raison produit des boucles.

**« Un hook peut-il faire quelque chose de dangereux ? »** Oui, c'est un script qui tourne avec vos droits. On relit un hook comme on relit un script de déploiement. C'est pour ça que les hooks de projet demandent la confiance du dossier.

**« Hook ou permission ? »** Les règles de permission de Claude Code (`permissions.deny`) bloquent aussi, sans script, pour les cas simples : « jamais cet outil », « jamais cette commande ». Le hook sert quand la règle regarde le *contenu* : ce fichier-ci mais pas celui-là, ce texte contient un montant sans HT. Pour une équipe métier, retenir le hook : une seule chose à apprendre.

**« Ça ralentit ? »** Un script qui teste un chemin prend quelques millisecondes. Un linter sur tout le projet, non : on le lance sur le fichier édité seulement.

**« Le hook `Stop` peut-il empêcher Claude de s'arrêter ? »** Oui, s'il renvoie un refus : Claude continue. Utile pour « ne t'arrête pas tant que les tests ne passent pas ». À manier avec une limite, sinon il ne s'arrête jamais.

**Dérive à éviter** : l'exercice qui produit des règles de ton (« être poli ») classées en hook. Un hook regarde un événement observable et un contenu vérifiable. Le ton, c'est CLAUDE.md.

**Dérive à éviter** : expliquer le format JSON d'entrée et de sortie des hooks à toute la salle. Le squelette et l'atelier suffisent ; les devs qui veulent le détail ont la référence en ligne.
