# Quiz d'arbitrage — réponses commentées

Pour le formateur. Version distribuée sans réponses : [[quiz-arbitrage]]. Une minute par question : lire, faire voter, donner la réponse et la phrase de justification.

| # | Le besoin | Réponse | Justification en une phrase |
|---|---|---|---|
| 1 | Claude oublie qu'on facture en HT | **CLAUDE.md** | Toujours vrai, une ligne, deux fois la même erreur. |
| 2 | Relire chaque devis avec ma grille | **Skill** | Une procédure qu'on lance, avec un savoir de référence à côté. |
| 3 | Aller chercher l'historique du client tout seul | **MCP** | Il manque l'accès : ce qu'il ne voit pas, il ne peut pas le chercher. |
| 4 | Ne *jamais* envoyer un mail sans validation | **Hook** | « Jamais » sur un événement observable, l'envoi : un `PreToolUse` qui demande. |
| 5 | Tout ce qui touche à l'export PDF dans le code | **Sous-agent** | Beaucoup de lecture, une conclusion courte, pas d'aller-retour. |
| 6 | L'équipe de Lyon veut la même config | **Plugin** | Deuxième équipe, même configuration, installée plutôt que copiée. |
| 7 | Ne jamais promettre de remboursement par écrit | **CLAUDE.md + hook** | La consigne dit ce qu'on attend ; le hook sur l'envoi garantit. Une règle « jamais » a besoin des deux. Accepter l'une ou l'autre réponse, puis donner les deux. |
| 8 | Le même compte rendu structuré à chaque rendez-vous, relu et corrigé | **Skill** | Ça ressemble à une délégation, mais on veut le résultat sous les yeux et on itère dessus : c'est un skill (`/compte-rendu-rdv`), pas un sous-agent. |
| 9 | Il appelle le produit Norrsken Planner | **CLAUDE.md** | Ça ressemble à un savoir de référence, mais c'est une ligne, toujours vraie, dans la fiche de poste. Pas besoin d'un skill pour un nom. |
| 10 | Le CRM est connecté mais il répond sans regarder la fiche | **Skill** | L'accès est là ; le savoir-faire manque. La procédure doit dire « lire la fiche client d'abord ». La salle votera MCP : c'est le piège du Module 4. |

## Si la salle se trompe

- **Question 4 votée CLAUDE.md** : rappeler la démo `.env`. La consigne a été lue ; elle n'a pas suffi.
- **Question 5 votée skill** : un skill fait le travail *dans* la conversation ; les deux cents fichiers y entrent. Le sous-agent ne rapporte que la réponse.
- **Question 8 votée sous-agent** : demander « et si le compte rendu est faux, vous faites quoi ? ». On corrige, on relance : c'est de l'itération, et un sous-agent n'a pas la mémoire de l'échange.
- **Question 10 votée MCP** : « Qu'est-ce qui manque ? Il a l'accès. » Le tableau de la slide 4.2.
