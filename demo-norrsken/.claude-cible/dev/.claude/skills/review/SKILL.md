---
name: review
description: Relit un diff ou une PR avant de la proposer, avec la checklist maison. À utiliser quand on demande de relire, vérifier ou passer en revue des changements avant commit, push ou ouverture de PR.
argument-hint: "[numéro de PR]"
---

Cible : $ARGUMENTS. Si vide, le diff courant (`git diff` puis `git diff --cached`). Si c'est un numéro, la PR correspondante.

Pour chaque point, répondre « ok » ou citer le fichier et la ligne :

1. **Sécurité** : aucune entrée utilisateur passée telle quelle à une requête, un chemin ou une commande. Aucun secret en clair.
2. **Tests** : tout comportement modifié a un test qui échouait avant. Le test porte le nom du module suffixé `.test.ts`.
3. **Nommage** : conventions de `CLAUDE.md` ; pas d'abréviation nouvelle.
4. **Migrations** : aucun fichier de `app/migrations/` modifié. Si oui, s'arrêter et le signaler en premier.
5. **Export** : si `app/src/export/` est touché, `buildPlanningModel()` n'est pas dupliqué et les deux formats restent alignés.
6. **Message de commit** : anglais, impératif, sans point final.

Terminer par une ligne : « Prêt à proposer » ou « À reprendre : » suivi des points bloquants.
