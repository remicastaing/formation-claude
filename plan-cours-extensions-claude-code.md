# Étendre Claude Code — plan de cours

**Public** : une équipe de développeurs + une équipe commerciale / support client, en même temps.
**Durée** : une demi-journée (≈ 3 h 30 hors pauses), découpée en un tronc commun, deux ateliers parallèles, puis une restitution croisée.
**Objectif** : à la fin, chaque participant sait nommer les 6 mécanismes d'extension, choisir le bon pour un besoin donné, et en a construit au moins un lui-même.

Hypothèses : chaque participant a Claude Code installé (CLI ou desktop) et un accès à un dépôt de démo. Pour les non-développeurs, l'app desktop (ou Claude Cowork, qui exploite les mêmes skills, MCP et plugins) évite le terminal.

---

## Fil rouge pédagogique

Un seul cas fictif sert toute la journée : **Norrsken**, une PME qui vend un logiciel de planification. Les devs maintiennent le produit, les commerciaux vendent, le support répond aux tickets. Chaque mécanisme est illustré deux fois — une fois côté code, une fois côté métier — pour que les deux publics voient que c'est le même outil.

Analogie à installer dès le début et à réutiliser : **le nouveau collègue**.
- CLAUDE.md = la fiche de poste qu'on lui donne le premier jour
- Skill = les procédures qu'il consulte quand il en a besoin
- Sous-agent = le stagiaire à qui il délègue une recherche et qui revient avec un résumé
- MCP = ses accès (CRM, base de données, Slack)
- Hook = les règles automatiques du bâtiment (badge, alarme incendie) qui ne dépendent pas de sa bonne volonté
- Plugin = le kit d'onboarding qu'on copie pour chaque nouvelle équipe

---

## Module 0 — Cadrage (15 min, tous ensemble)

- Pourquoi ce cours : Claude Code n'est pas un chatbot mais une boucle agentique (modèle + outils) qu'on peut configurer.
- Ce que « extension » veut dire : ce que Claude *sait*, à quoi il est *connecté*, ce qui se passe *automatiquement*.
- Démo d'ouverture (5 min) : la même demande (« prépare la réponse à ce ticket client ») sur un Claude Code nu, puis sur un Claude Code configuré. L'écart visible motive la suite.
- Règle de conduite : les devs n'expliquent pas aux commerciaux, ils *pairent* avec eux dans l'atelier.

## Module 1 — Le contexte permanent : CLAUDE.md et règles (25 min, tous ensemble)

**Concept**
- Chargé à chaque session, en entier ; c'est le seul mécanisme « toujours actif ».
- Garder sous ~200 lignes ; déplacer le reste dans des skills ou dans `.claude/rules/` (règles ciblées par chemin de fichier).
- Empilement : fichiers utilisateur + projet + sous-dossiers sont additifs.

**Exemple dev** : CLAUDE.md du dépôt Norrsken — `pnpm` pas `npm`, lancer les tests avant commit, structure des dossiers, « ne jamais toucher aux migrations sans demander ».

**Exemple métier** : CLAUDE.md du dossier `support/` — ton de la marque (vouvoiement, pas d'excuses vagues), délais d'engagement SLA, ce qu'on ne promet jamais par écrit, liste des produits et leurs noms officiels.

**Exercice (10 min, en binôme dev + métier)** : écrire 10 lignes de CLAUDE.md pour son propre contexte. Puis lancer une session et vérifier que Claude les applique. Piège à montrer : une règle formulée comme un souhait (« essaie de… ») vs comme une contrainte.

**Signal déclencheur** : Claude se trompe deux fois sur la même convention → c'est une ligne de CLAUDE.md.

## Module 2 — Les skills : savoir à la demande et workflows invocables (35 min, tous ensemble)

**Concept**
- Un fichier markdown `SKILL.md` avec un en-tête (nom, description) et un corps.
- Deux natures : *référence* (un guide de style API, une grille tarifaire) ou *action* (un workflow lancé par `/nom`).
- Chargement paresseux : seule la description est lue au démarrage, le contenu complet à l'usage. D'où l'importance d'une description précise — c'est elle qui décide si Claude déclenche le skill.
- `disable-model-invocation: true` : réservé à l'invocation manuelle (pour tout ce qui a des effets de bord).
- Les anciennes « slash commands » sont désormais des skills.

**Exemple dev** : `/review` — checklist de revue de code maison (sécurité, tests, nommage) que Claude déroule sur un diff.

**Exemple métier** :
- `/reponse-ticket` — prend un ticket, classe la demande (bug / question / facturation), rédige une réponse dans le ton de la marque, propose les articles de la base de connaissances à joindre.
- `/compte-rendu-rdv` — transforme des notes brutes d'un rendez-vous commercial en compte rendu structuré + prochaines actions.
- Skill de référence : `tarifs-2026` — la grille tarifaire et les règles de remise, pour que Claude ne les invente jamais.

**Démo en direct** : écrire le skill `/reponse-ticket` devant tout le monde, le tester sur 3 tickets, puis corriger la description parce que Claude ne l'a pas déclenché sur le deuxième.

**Signal déclencheur** : tu retapes le même prompt ou tu colles la même procédure pour la troisième fois.

## Pause (15 min)

## Module 3 — Sous-agents : déléguer et isoler (20 min, tous ensemble)

**Concept**
- Un agent avec son propre contexte, sa propre consigne, ses propres outils autorisés ; il ne renvoie qu'un résumé.
- Intérêt : ne pas polluer la conversation principale, paralléliser, spécialiser.
- Peut précharger des skills (`skills:`), tourner sur un modèle plus léger, être restreint en lecture seule.
- Au-delà de quelques sous-agents : les *dynamic workflows* (un script écrit par Claude qui en orchestre beaucoup).

**Exemple dev** : un sous-agent `explorateur` en lecture seule qui parcourt 200 fichiers pour répondre « où est géré l'expiration des sessions ? » sans que les 200 fichiers entrent dans ta conversation.

**Exemple métier** : un sous-agent `veille-concurrent` qui lit 15 pages web et une fiche produit concurrente et ne rapporte que les 5 différences qui comptent pour un argumentaire.

**Mini-exercice (5 min)** : chacun identifie une tâche de sa semaine qui « inonde » une conversation. Tour de table rapide.

**Signal déclencheur** : une tâche annexe produit des pages de sortie que tu ne reliras jamais.

## Module 4 — MCP : connecter au monde extérieur (20 min, tous ensemble)

**Concept**
- Un protocole ; un serveur MCP donne à Claude des *outils* (lire, écrire, agir) sur un système externe, avec l'authentification gérée par le serveur.
- MCP fournit l'accès, le skill fournit le savoir-faire : les deux se combinent (le MCP se connecte au CRM, le skill explique le pipeline commercial et les champs obligatoires).
- Portées : local > projet > utilisateur.

**Exemple dev** : MCP Postgres → Claude interroge la base de staging pour vérifier une hypothèse de bug ; MCP GitHub → il lit la PR liée au ticket.

**Exemple métier** : MCP vers l'outil de ticketing ou le CRM → `/reponse-ticket` récupère lui-même l'historique du client au lieu qu'on le lui colle. MCP Gmail/Drive → le compte rendu de rendez-vous se range tout seul dans le bon dossier.

**Démo** : connecter un MCP simple (fichiers ou Drive), puis relancer `/reponse-ticket` en le laissant chercher lui-même le contexte.

**Signal déclencheur** : tu copies-colles des données depuis un onglet que Claude ne voit pas.

## Module 5 — Hooks : ce qui doit arriver à chaque fois (20 min, tous ensemble)

**Concept**
- Déclenchés par des événements du cycle de vie (`SessionStart`, `PreToolUse`, `PostToolUse`, `Stop`…) ; exécutent un script, une requête HTTP, un appel MCP, un prompt ou un sous-agent.
- Déterministes : c'est le seul mécanisme *garanti*. Une phrase « ne jamais éditer `.env` » dans CLAUDE.md est une demande ; un hook `PreToolUse` qui bloque l'édition est une application.
- Coût de contexte nul, sauf si le hook renvoie quelque chose.

**Exemple dev** : `PostToolUse` sur les éditions → lance le linter et renvoie les erreurs ; `PreToolUse` → refuse `rm -rf` et toute écriture dans `.env`.

**Exemple métier** :
- `PreToolUse` sur l'envoi d'e-mail → bloque tout envoi qui contient un montant sans mention « HT » ou une promesse de délai non listée dans le SLA.
- `Stop` → journalise chaque réponse client générée dans un fichier d'audit (qui, quand, quel ticket).
- Message d'ouverture : « ce que tu ne veux jamais voir partir chez un client, tu ne le confies pas à une consigne — tu le mets dans un hook ».

**Exercice (8 min)** : chaque binôme écrit *une* règle de garde-fou de son métier et discute si elle relève d'un hook ou d'une ligne de CLAUDE.md.

**Signal déclencheur** : tu veux qu'une chose se produise systématiquement sans avoir à le demander.

## Module 6 — Plugins et marketplaces : emballer et distribuer (10 min, tous ensemble)

**Concept**
- Un plugin regroupe skills, hooks, sous-agents et serveurs MCP en une unité installable ; les skills y sont préfixés (`/norrsken-support:reponse-ticket`).
- Un marketplace héberge et distribue des plugins (interne à l'entreprise ou public).
- Mention rapide : les plugins de *code intelligence* (LSP) pour les langages typés.

**Exemple unique** : le plugin `norrsken-support` qui contient tout ce que l'atelier métier va construire, installé en une commande sur le poste d'un nouveau chargé de support.

**Signal déclencheur** : une deuxième équipe ou un deuxième dépôt a besoin de la même configuration.

## Pause (10 min)

## Module 7 — Ateliers parallèles (60 min)

Chaque atelier construit un petit ensemble cohérent, en binômes mixtes quand c'est possible (un dev accompagne un binôme métier sur la partie technique, sans faire à sa place).

### Atelier A — Développeurs : « du bug au correctif audité »
1. CLAUDE.md du dépôt de démo (10 min).
2. Skill `/triage-bug` : reproduit, localise, propose un correctif, liste les tests à écrire (15 min).
3. Sous-agent `verif` en lecture seule qui relit le diff et signale les régressions possibles (15 min).
4. Hook `PostToolUse` linter + hook `PreToolUse` qui interdit d'écrire dans `migrations/` (10 min).
5. Empaqueter le tout en plugin et l'installer sur le poste du voisin (10 min).

### Atelier B — Commerciaux / support : « du ticket à la réponse conforme »
1. CLAUDE.md du dossier support : ton, SLA, interdits (10 min).
2. Skill de référence `produits-et-tarifs` + skill d'action `/reponse-ticket` (20 min).
3. Connexion d'un MCP (Drive ou ticketing de démo) pour que le skill trouve le contexte seul (10 min).
4. Hook `Stop` d'audit + hook `PreToolUse` sur les envois (10 min, avec l'aide d'un dev).
5. Test croisé : chacun passe 3 tickets réels anonymisés dans le workflow de son voisin et note ce qui cloche (10 min).

Livrable de chaque atelier : un dossier `.claude/` fonctionnel + une liste de 3 améliorations à faire la semaine suivante.

## Module 8 — Restitution croisée et arbitrages (25 min, tous ensemble)

- Chaque atelier montre son résultat à l'autre en 5 min. Objectif : les devs voient que le support a construit un vrai outil ; le support voit d'où viennent les garde-fous.
- Quiz d'arbitrage (10 min, main levée) : on lit un besoin, la salle vote « CLAUDE.md / skill / sous-agent / MCP / hook / plugin » :
  - « Claude oublie qu'on facture en HT » → CLAUDE.md
  - « Je veux qu'il relise chaque devis avec ma grille » → skill
  - « Il doit aller chercher l'historique du client tout seul » → MCP
  - « Il ne doit *jamais* envoyer un mail sans que je valide » → hook
  - « Trouve-moi tout ce qui touche à l'export PDF dans le code » → sous-agent
  - « L'équipe de Lyon veut la même config » → plugin
- Coût de contexte (5 min) : ce que chaque mécanisme charge et quand ; pourquoi trop de skills mal décrits rendent Claude moins bon ; `/context` pour mesurer.
- Erreurs classiques : CLAUDE.md de 600 lignes, description de skill vague, garde-fou mis dans un prompt au lieu d'un hook, MCP inutilisés qui traînent.

## Clôture (10 min)

- Grille « quel déclencheur → quel mécanisme » distribuée sur une page.
- Engagement individuel : chacun note *le* premier ajout qu'il fera lundi.
- Suite proposée : point à J+15 pour comparer ce qui a réellement été construit, et faire évoluer le plugin d'équipe.

---

## Matériel à préparer

- Dépôt de démo Norrsken (petit projet avec 2–3 bugs plantés, un dossier `support/` avec 20 tickets anonymisés, une grille tarifaire).
- Un serveur MCP de démo accessible sans configuration lourde (Drive ou un ticketing bac à sable).
- Squelettes de fichiers : `CLAUDE.md`, `SKILL.md`, agent, `hooks.json`, `plugin.json` — pré-remplis à 50 % pour que les non-devs ne partent pas d'une page blanche.
- Réponse « avant/après » de la démo d'ouverture, préparée à l'avance.
- Un dev référent par table métier.

## Références

- Vue d'ensemble des extensions : https://code.claude.com/docs/en/features-overview
- Skills, sous-agents, MCP, hooks, plugins : pages dédiées liées depuis cette vue d'ensemble.
