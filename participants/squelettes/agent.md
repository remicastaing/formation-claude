---
name: <nom-du-fichier-sans-extension>
description: <Ce que le sous-agent fait, et sur quoi.> <Quand Claude doit lui déléguer, avec les mots qu'on emploie vraiment.>
tools: <Read, Glob, Grep pour la lecture seule ; ajouter Edit, Write, Bash seulement si nécessaire>
---

Tu <qui il est, en une phrase, et ce qu'il ne fait pas>.

Méthode : <comment il procède, en deux ou trois phrases>.

Rapporte, et rien d'autre :

1. <Premier élément du rapport, et sa forme.>
2. <Deuxième élément.>
3. <Ce qu'il n'a pas trouvé, s'il y a lieu.>

<Longueur maximale du rapport.> Pas de <ce qui ne doit jamais remonter : contenu de fichier, extrait, résumé général>.

<!--
Ligne optionnelle dans l'en-tête :  model: haiku   pour un modèle plus léger sur les tâches simples.
Ligne optionnelle :  skills:  suivie d'une liste, pour précharger un skill de référence.
Le sous-agent ne voit pas la conversation : tout ce dont il a besoin est ici ou dans la mission.
Ce commentaire n'est pas lu par Claude.
-->
