# TP 4 — Connecter un CRM à `/reponse-ticket`

**Durée** : 6 minutes, en suivant le formateur.
**Objectif** : voir un skill échouer faute d'accès, connecter un serveur MCP, et le voir réussir sans avoir changé le skill.

Ce TP se fait en ligne de commande. Si vous êtes sur l'application de bureau, suivez en binôme avec un voisin en terminal ; le principe est le même, seul le réglage change de place.

## Prérequis

- Le TP 2 terminé : `/reponse-ticket` en place dans `support/.claude/skills/`.
- Node installé (le formateur l'a vérifié avec vous ce matin).

## Étapes

### 1. Déplacer la fiche client (1 min)

Créez un dossier `norrsken-crm/clients/` **en dehors** de votre dossier `support/`, par exemple à côté du dépôt. Déplacez-y `support/clients/brossard.md`.

Vérification : `support/clients/` ne contient plus la fiche Brossard.

### 2. Demander sans accès (2 min)

Nouvelle session dans `support/`. Tapez : « Réponds à la réclamation de Brossard sur la facture. »

Regardez la réponse : le skill s'est déclenché, mais le chargé de compte n'est pas nommé et l'historique n'apparaît pas. Il n'a pas trouvé la fiche.

### 3. Connecter le serveur de fichiers (1 min)

Quittez la session. Dans le terminal, depuis `support/`, remplacez le chemin par celui de votre dossier CRM :

```bash
claude mcp add --scope project --transport stdio crm -- npx -y @modelcontextprotocol/server-filesystem /chemin/vers/norrsken-crm
```

Vérification : un fichier `.mcp.json` est apparu à la racine de `support/`.

### 4. Demander avec accès (2 min)

Nouvelle session. Claude Code demande d'approuver le serveur du projet : acceptez. Tapez `/mcp` : le serveur `crm` est connecté, avec ses outils.

Retapez la même demande, mot pour mot.

Vérification : la réponse nomme Thomas Renaud et cite le ticket précédent. Vous n'avez rien changé dans le skill.

## Si ça ne marche pas

- **Le serveur est en erreur dans `/mcp`.** Le chemin du dossier CRM est faux, ou Node n'est pas installé. Corrigez le chemin dans `.mcp.json` et relancez la session.
- **Claude ne va pas chercher la fiche.** Ouvrez votre skill : l'étape « lire la fiche client » doit dire « dans `clients/`, sinon par le CRM connecté ». Sans cette phrase, il ne pense pas à l'autre chemin.
- **Il demande d'approuver le serveur à chaque fois.** Répondez « oui pour ce projet » plutôt que « oui une fois ».
- **Vous n'avez pas Node.** Suivez avec votre voisin ; l'atelier reprendra ce point avec un dev référent.
