# Préparation de la démo d'ouverture (Module 0)

À faire la veille. Module concerné : [[00-cadrage]].

## Les deux dossiers

Sur la machine de projection, hors du vault :

- `demo-nu/` : contient uniquement `support/tickets/T-0417.md`. Aucun `CLAUDE.md`, aucun `.claude/`.
- `demo-configure/support/` : une copie de `demo-norrsken/support/` (tickets, clients, kb, tarifs), plus le contenu de `demo-norrsken/.claude-cible/support/` copié à sa racine (`CLAUDE.md`, `.claude/`, `.mcp.json`). Le CRM de démo n'est pas nécessaire ici : la fiche Brossard est dans `clients/`.

La demande, tapée à l'identique dans les deux sessions :

```
Prépare la réponse au ticket support/tickets/T-0417.md
```

Générer les deux réponses la veille, avec le même modèle que celui des participants, et les coller ci-dessous en remplacement des versions types. Elles servent de filet si la génération en direct échoue.

## Le ticket

Source : `demo-norrsken/support/tickets/T-0417.md`.

## Réponse type de Claude nu

```
Bonjour Léa,

Nous sommes vraiment désolés pour ce désagrément et comprenons votre
frustration. Nous avons bien identifié le bug d'export PDF dans
Norrsken Planner et notre équipe technique travaille dessus en
priorité. Un correctif devrait être déployé sous 24 heures.

Concernant votre demande de remboursement, nous vous proposons un
geste commercial d'un mois offert pour compenser la gêne occasionnée.

N'hésitez pas à nous recontacter si vous avez d'autres questions.

Cordialement,
L'équipe support
```

## Réponse type de Claude configuré

```
Bonjour Madame Brossard,

Nous accusons réception de votre signalement concernant l'export PDF
du planning hebdomadaire dans Norrsken Planning, et nous vous
remercions de nous l'avoir remonté rapidement.

Nous l'avons enregistré comme incident technique. Conformément à
votre contrat Pro, un diagnostic vous sera communiqué sous deux jours
ouvrés, soit avant le 15/09 en fin de journée.

En attendant, l'export au format tableur reste fonctionnel et peut
être imprimé depuis LibreOffice ou Excel ; la procédure est décrite
dans l'article « Exporter un planning en tableur » que nous joignons.

Nous notons qu'un incident similaire avait été signalé en mai
(ticket T-0298). Cet élément est transmis à l'équipe technique avec
le présent signalement.

Votre demande relative à la facturation du mois est transmise à
votre chargé de compte, Thomas Renaud, qui reviendra vers vous
séparément.

Nous restons à votre disposition.

Service client Norrsken Planning
```

Ligne attendue dans `support/audit.log`, écrite par le hook `Stop` :

```
2026-09-12 09:31  T-0298,T-0417  session=a1b2c3d4  classement=bug
```

## Réponses générées la veille

_(à coller ici)_
