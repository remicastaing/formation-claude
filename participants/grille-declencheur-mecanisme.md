# Étendre Claude Code — quel signal, quel mécanisme

| Le signal | Le mécanisme | Le collègue | Où c'est |
|---|---|---|---|
| Claude se trompe **deux fois** sur la même convention. | **CLAUDE.md** | La fiche de poste | `CLAUDE.md` à la racine du dossier de travail. Moins de 200 lignes. Des contraintes vérifiables, pas des souhaits. |
| Tu retapes le même prompt, ou tu colles la même procédure, pour la **troisième fois**. | **Skill** | Les procédures qu'il consulte | `.claude/skills/<nom>/SKILL.md`. La description décide : ce qu'il fait, quand, avec les mots des gens, ce qu'il ne fait pas. |
| Une tâche annexe produit des **pages de sortie** que tu ne reliras jamais. | **Sous-agent** | Le stagiaire | `.claude/agents/<nom>.md`. Ses outils, sa consigne, le format du rapport. Il ne voit pas la conversation. |
| Tu **copies-colles** des données depuis un onglet que Claude ne voit pas. | **MCP** | Ses accès | `.mcp.json` à la racine (portée projet), ou `claude mcp add`. Lecture seule quand c'est possible. `/mcp` pour vérifier. |
| Tu veux qu'une chose se produise **systématiquement**, sans le demander. | **Hook** | Les règles du bâtiment | `.claude/settings.json`, clé `hooks`, et un script dans `.claude/hooks/`. Sortie 2 = refus, avec le message. `/hooks` pour vérifier. |
| Une **deuxième équipe**, ou un deuxième dépôt, a besoin de la même configuration. | **Plugin** | Le kit d'onboarding | Un dossier avec `.claude-plugin/plugin.json` et les mêmes sous-dossiers. `/plugin marketplace add`, `/plugin install nom@catalogue`. |

**Une règle avec « jamais » dedans demande deux mécanismes** : la consigne dans CLAUDE.md dit à Claude ce qu'on attend ; le hook garantit que ça arrive. Une consigne demande, un hook garantit.

**Les trois questions** : qu'est-ce qu'il *sait* (CLAUDE.md, skills) ; à quoi est-il *connecté* (MCP) ; que se passe-t-il *automatiquement* (hooks). Les sous-agents organisent son travail, les plugins le distribuent.

**Pour vérifier** : `/context` (ce qui est chargé), `/skills`, `/mcp`, `/hooks`, `/skill-doctor` (ce que coûte chaque skill).

**Pour une équipe qui part de zéro**, dans cet ordre : la fiche de poste → une procédure → un accès → un garde-fou → le kit.
