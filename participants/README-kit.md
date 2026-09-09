# Kit des participants — cours « Étendre Claude Code »

Ce dépôt contient tout ce dont vous avez besoin pendant la demi-journée, et rien d'autre. Il est généré automatiquement depuis les sources du cours : ne le modifiez pas en ligne, travaillez dans votre copie.

```bash
git clone https://github.com/remicastaing/norrsken-demo.git
```

Ou, sans terminal : bouton **Code** puis **Download ZIP**, et décompressez.

## Ce qu'il contient

| Dossier | Pour quoi |
|---|---|
| `demo-norrsken/` | Le dépôt de démo. Développeurs : ouvrez Claude Code à sa racine. Support et commercial : ouvrez le dossier `demo-norrsken/support/`. |
| `demo-norrsken/app/` | L'application Norrsken Planning, version 4.5. `pnpm test` passe. Des clients signalent pourtant des problèmes… |
| `demo-norrsken/support/` | 21 tickets, 5 fiches clients, la base de connaissances, la grille tarifaire. |
| `tp/` | Les travaux pratiques, un fichier par TP, dans l'ordre de la journée. Commencez par `tp/README.md`. |
| `participants/squelettes/` | Les fichiers à moitié remplis dont partent les TP : `CLAUDE.md`, `SKILL.md`, agent, hooks, plugin. |
| `participants/` | La grille « quel signal, quel mécanisme », le quiz, la fiche de fin de journée. |

## Avant la séance

1. Claude Code installé : en ligne de commande, ou l'application de bureau.
2. Node 22.6 ou plus (`node --version`) ; `jq` pour les développeurs (`which jq`).
3. Ce dépôt cloné ou décompressé, et un dossier vide `norrsken-crm/` créé **à côté** de `demo-norrsken/` (il servira au TP 4).

Le cours écrit et les slides : https://remicastaing.github.io/formation-claude/
