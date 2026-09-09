# TP 7b — Atelier support et commercial : du ticket à la réponse conforme

**Durée** : 55 minutes après le lancement, en binôme, avec un dev référent à la table.
**Objectif** : construire sur le dossier `support/` la configuration qui a produit la bonne réponse de ce matin, puis la mettre à l'épreuve sur les tickets de votre voisin.

## Prérequis

- Claude Code ouvert sur `demo-norrsken/support/` comme dossier de travail. Aucun `CLAUDE.md`, `.claude/` ni `.mcp.json` au départ.
- Les squelettes de `participants/squelettes/`, dont le sous-dossier `support/` avec les deux scripts.
- Un dossier `norrsken-crm/` vide, à côté du dépôt.

## Étape 1 — Le CLAUDE.md du dossier support (10 min)

À la racine de `support/`, à partir du squelette. Au minimum :

- vouvoiement, pas d'excuses vagues, une formule de clôture fixe ;
- le nom officiel du produit et des trois offres ;
- les seuls délais qu'on écrit : ceux du contrat, dans `tarifs.md` ;
- ce qu'on n'écrit jamais : remboursement, geste commercial, date de correctif.

Test : « Réponds au ticket T-0396. » Le client tutoie ; la réponse vouvoie, nomme Norrsken Planning, et propose l'article sur l'impression.

## Étape 2 — Deux skills (20 min)

**2a. La référence `produits-et-tarifs` (8 min).** `.claude/skills/produits-et-tarifs/SKILL.md`. Pas de `$ARGUMENTS` : le corps est le savoir. Recopiez de `tarifs.md` : les trois offres et leurs prix, les deux remises et la règle « jamais les deux, la plus favorable », les délais SLA par offre, et la ligne « tout prix porte la mention HT ». Description : quand la consulter (prix, remise, délai, engagement).

**2b. L'action `/reponse-ticket` (12 min).** `.claude/skills/reponse-ticket/SKILL.md`. Description en trois parties (fait, quand avec les mots des clients, ne fait pas). Corps en six étapes : trouver le ticket ; classer bug, question ou facturation ; lire la fiche client dans `clients/`, sinon par le CRM connecté ; chercher un article de `kb/` ; rédiger selon `CLAUDE.md` ; si montant ou geste demandé, transmettre au chargé de compte nommé.

Test : « Paolo Marchetti demande combien coûterait Pro pour 6 personnes, et avec engagement. » (ticket T-0419). Attendu : 114 € HT par mois, 102,60 € HT avec engagement annuel, et rien d'autre.

Second test : « Réponds à Hélène Vauclin sur sa facture » (T-0405). Elle demande de confirmer un cumul de remises. Attendu : la réponse ne confirme pas, explique que la plus favorable s'applique, et transmet au chargé de compte.

## Étape 3 — Le CRM par MCP (10 min)

Déplacez `clients/brossard.md` dans `norrsken-crm/clients/`. Nouvelle session : « Réponds à la réclamation de Brossard sur la facture » (T-0431). Constatez : pas de chargé de compte, pas d'historique.

Le dev référent tape, depuis `support/` :

```bash
claude mcp add --scope project --transport stdio crm -- npx -y @modelcontextprotocol/server-filesystem /chemin/vers/norrsken-crm
```

Nouvelle session, approuvez le serveur, `/mcp`. Même demande. Attendu : Thomas Renaud nommé, T-0298 cité.

## Étape 4 — Deux hooks, avec le dev référent (10 min)

Copiez `participants/squelettes/support/garde-envoi.sh` et `audit.sh` dans `.claude/hooks/`, rendez-les exécutables (`chmod +x`). Créez `.claude/settings.json` à partir de `hooks.json` : le garde d'envoi sur `PreToolUse` avec le matcher des outils d'envoi (fourni dans le squelette), l'audit sur `Stop`.

Nouvelle session, `/hooks` les liste.

Test de l'audit : répondez à n'importe quel ticket ; `audit.log` a une ligne de plus.

Test du garde d'envoi, sans outil d'envoi connecté, à la main avec le dev référent :

```bash
echo '{"tool_input":{"body":"Un correctif sera déployé sous 24 heures."}}' | .claude/hooks/garde-envoi.sh; echo "code $?"
```

Attendu : le message de refus et le code 2. Puis le même test avec « sous 2 jours ouvrés » : code 0.

## Étape 5 — Test croisé (10 min)

Prenez trois tickets que vous n'avez pas traités : T-0412, T-0428, T-0416, ou trois tickets réels anonymisés que vous avez apportés. Passez-les dans le workflow de votre voisin, sur son poste, avec son `/reponse-ticket`.

Pour chacun, une ligne sur la fiche : le ticket, ce qui cloche dans la réponse, et quel mécanisme le corrigerait (CLAUDE.md, skill, MCP, hook). S'il n'y a rien qui cloche, écrivez ce qui vous a surpris.

## Livrable

- Un dossier `.claude/` fonctionnel, un `CLAUDE.md`, un `.mcp.json`.
- La fiche du test croisé, et trois améliorations pour la semaine prochaine.

## Si ça ne marche pas

- **Le prix est faux, ou sans HT, ou les remises sont cumulées.** Le skill de référence n'est pas chargé ou ne dit pas la règle. `/skills`, puis relisez sa description et ses lignes.
- **`/reponse-ticket` ne se déclenche pas.** Tapez-le à la main ; si ça marche, la description manque des mots de votre demande.
- **Le serveur CRM est en erreur.** Le chemin dans `.mcp.json` ; Node installé ; relancer la session.
- **Le hook n'est pas listé.** `/hooks`. Confiance du dossier acceptée ? Script exécutable ? `settings.json` bien dans `.claude/` ?
- **Vous êtes sur l'application de bureau et une commande vous manque.** Le dev référent la tape dans un terminal, dans le même dossier ; les fichiers produits sont les mêmes.
