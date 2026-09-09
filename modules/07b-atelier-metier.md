# Module 7b — Atelier support et commercial : « du ticket à la réponse conforme »

**Durée** : 60 min, en parallèle de [[07a-atelier-dev]].
**Plan général** : [[plan-cours-extensions-claude-code]] · Précédent : [[06-plugins]] · Script oral : `scripts/07b-atelier-metier.md` · Slides 7.1, 7.3, 7.4 dans [[slides]] · TP : [[tp-07b-atelier-metier]] · Matériel : [[materiel]].
**Objectif de l'atelier** : à la fin, chaque binôme (1) a un dossier `.claude/` fonctionnel sur `support/` : CLAUDE.md, skill de référence `produits-et-tarifs`, skill d'action `/reponse-ticket`, serveur MCP vers le CRM, deux hooks ; (2) a passé trois tickets dans le workflow du voisin et noté ce qui cloche ; (3) a produit exactement ce que la démo d'ouverture montrait.

Le livrable de référence est `demo-norrsken/.claude-cible/support/`. C'est la configuration de la démo du Module 0 : à la fin de l'atelier, la salle a construit ce qu'elle a vu à neuf heures.

---

## Déroulé minuté

| Min | Étape | Livrable | Point de contrôle |
|---|---|---|---|
| 0–5 | Lancement commun (script de [[07a-atelier-dev]]) | | Slide 7.1 |
| 5–15 | 1. CLAUDE.md du dossier support | `support/CLAUDE.md` | Réponse à T-0396 vouvoyée, produit bien nommé |
| 15–35 | 2. Skill `produits-et-tarifs` puis `/reponse-ticket` | `.claude/skills/…` | T-0419 : prix exact, HT, remise non cumulée |
| 35–45 | 3. Serveur MCP vers le CRM | `.mcp.json` | T-0431 : chargé de compte nommé, historique cité |
| 45–55 | 4. Hooks : audit et garde d'envoi (avec le dev référent) | `.claude/settings.json`, `hooks/` | `audit.log` s'allonge ; un envoi avec « sous 24 h » refusé |
| 55–60 | 5. Test croisé : trois tickets chez le voisin | Fiche des écarts | Trois lignes : ticket, ce qui cloche, quel mécanisme |

Les tickets de chaque étape sont choisis pour que la réponse correcte dépende du mécanisme qu'on vient d'ajouter.

---

## Rôle du formateur et des dev référents

Le formateur métier anime ; un dev référent par table. Le dev n'écrit pas : il indique le chemin, la commande, le nom du fichier, et il prend le clavier uniquement à l'étape 4 si le binôme le demande.

Ce que le formateur fait à chaque étape :

- **Étape 1.** Le CLAUDE.md doit contenir les noms officiels, le vouvoiement, la formule de clôture, et les interdits par écrit. Test sur T-0396 (Petitjean tutoie ; la réponse doit vouvoyer quand même). Repérer les binômes qui écrivent des souhaits.
- **Étape 2.** Deux skills. La référence d'abord : la grille et les SLA, recopiés de `tarifs.md`, avec la règle de non-cumul écrite noir sur blanc. Puis l'action, en six étapes (classer, fiche client, KB, ton, montants → chargé de compte). Test sur T-0419 (Marchetti veut passer à Pro, 6 utilisateurs, engagement annuel) : la réponse doit donner 114 € HT puis 102,60 € HT, et rien d'autre. Un binôme qui obtient un prix sans HT ou un cumul de remises n'a pas de skill de référence chargé.
- **Étape 3.** Comme au Module 4 : la fiche Brossard déplacée dans le CRM, puis le serveur de fichiers. Le dev référent tape la commande si le binôme est sur l'application de bureau. Test sur T-0431.
- **Étape 4.** Les deux scripts sont fournis dans les squelettes ; le binôme les copie, les rend exécutables, écrit le `settings.json`. Test : demander une réponse à T-0407 qui promette un correctif « sous 24 h ». Le garde d'envoi refuse. L'audit s'allonge à chaque réponse.
- **Étape 5.** Chaque binôme prend trois tickets qu'il n'a pas traités (le TP en propose, ou des tickets réels anonymisés apportés par les participants) et les passe dans le workflow du voisin. Trois lignes sur la fiche : le ticket, ce qui cloche, quel mécanisme le corrigerait. C'est la matière du Module 8.

---

## Tickets utilisés

| Étape | Ticket | Ce qu'il teste |
|---|---|---|
| 1 | T-0396 | Vouvoiement malgré le tutoiement du client, nom du produit, article KB |
| 2 | T-0419 | Prix exact, mention HT, remise annuelle non cumulée |
| 2 | T-0405 | Piège : le client demande de confirmer un cumul de remises. La bonne réponse dit que ce n'est pas prévu et transmet au chargé de compte (c'est aussi un bug du logiciel, que l'atelier dev voit passer) |
| 3 | T-0431 | Fiche client par le CRM : chargé de compte, historique |
| 4 | T-0407 | Tentation d'un délai de correctif ; le hook refuse |
| 5 | T-0412, T-0428, T-0416 | Résiliation avec remboursement demandé ; geste commercial demandé ; délai contractuel réclamé |

---

## Si la salle n'a pas Claude Code

Un seul atelier piloté par le formateur, décrit dans [[demos-formateur]] : les tables métier produisent le CLAUDE.md et la description du skill sur papier, le formateur assemble et exécute sur les tickets du tableau ci-dessus. Trente minutes.

---

## Supports

Slides 7.1, 7.3 (les cinq étapes B), 7.4 dans [[slides]].

---

## Matériel à préparer

Liste consolidée dans [[materiel]]. Propre à cet atelier :

- `demo-norrsken/support/` sur chaque poste, ouvert comme dossier de travail, **sans** `CLAUDE.md`, `.claude/` ni `.mcp.json`.
- Le dossier CRM de démo à côté (`norrsken-crm/`), vide au départ ; la fiche Brossard y est déplacée à l'étape 3.
- Squelettes : `CLAUDE.md`, `SKILL.md`, `hooks.json`, `garde-fou.sh`, plus les deux scripts support (`garde-envoi.sh`, `audit.sh`) fournis tels quels dans `participants/squelettes/support/`.
- Fiche papier du test croisé (étape 5).
- Les participants qui le peuvent apportent trois tickets réels anonymisés.

---

## Pièges et questions fréquentes

**« Le prix est bon mais sans HT. »** Le skill de référence n'est pas chargé, ou ne dit pas « tout prix porte la mention HT ». Vérifier `/skills`, puis la ligne.

**« Il a cumulé les remises sur T-0405. »** Même cause. Et c'est le piège voulu : le client *demande* de confirmer le cumul, et le logiciel *fait* le cumul. Seule la grille dit non.

**« Il a promis un correctif. »** Avant l'étape 4, c'est attendu : CLAUDE.md le demande, rien ne le garantit. Après l'étape 4, le hook doit refuser. Si l'envoi passe, le matcher ne correspond pas à l'outil d'envoi utilisé ; en atelier, sans vrai outil d'envoi, on teste le script à la main (voir TP).

**« On n'a pas d'outil d'envoi, le hook ne sert à rien. »** Il sert le jour où l'outil de ticketing est connecté par MCP. En atelier, on teste le script directement avec un texte, et on montre qu'il refuse. C'est le dev référent qui fait ça.

**« L'app de bureau ne me laisse pas ajouter le serveur MCP. »** Le dev référent le fait en ligne de commande dans le même dossier ; le fichier `.mcp.json` est le même.

**Dérive à éviter** : un binôme qui passe vingt minutes sur le ton du CLAUDE.md. Dix minutes, dix lignes, on avance : le skill est plus important.
