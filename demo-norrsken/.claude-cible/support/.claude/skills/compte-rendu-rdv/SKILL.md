---
name: compte-rendu-rdv
description: Transforme des notes brutes de rendez-vous commercial en compte rendu structuré avec les prochaines actions. À utiliser après un rendez-vous, une démo ou un appel client, quand on demande de « faire le compte rendu », « mettre au propre mes notes » ou « préparer le suivi ».
argument-hint: "[fichier de notes ou notes collées]"
---

Notes : $ARGUMENTS

Produire, dans cet ordre, sans rien inventer qui ne soit dans les notes :

1. **En-tête** : client, date, participants, offre actuelle si connue (fiche dans `clients/` ou CRM connecté).
2. **Contexte** : ce que le client fait et ce qu'il cherche, trois lignes.
3. **Ce qui a été dit** : points abordés, objections, questions restées sans réponse. Une puce par point.
4. **Engagements pris** : par nous, par le client. Si un prix ou un délai a été évoqué, vérifier dans le skill `produits-et-tarifs` qu'il est conforme ; sinon le signaler en tête sous « À corriger ».
5. **Prochaines actions** : qui, quoi, pour quand. Trois au plus.

Ton neutre, phrases courtes. Pas de jugement sur le client. Ce compte rendu est interne : il ne part pas chez le client.
