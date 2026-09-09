---
name: reponse-ticket
description: Rédige la réponse à un ticket support. À utiliser dès qu'on demande de répondre à un client, une réclamation, un mail ou un message reçu au support, même sans le mot « ticket ». Pas pour les relances commerciales ni les comptes rendus de rendez-vous.
argument-hint: "[numéro de ticket ou nom du client]"
---

Demande : $ARGUMENTS

1. Trouver le ticket dans `tickets/` (par numéro, ou le plus récent du client nommé). Le lire en entier.
2. Classer la demande, une seule catégorie : **bug** (quelque chose ne marche plus), **question** (comment faire), **facturation** (montant, facture, remboursement, remise).
3. Lire la fiche du client : dans `clients/` si elle s'y trouve, sinon par le CRM connecté (serveur MCP `crm`). Relever l'offre, le chargé de compte, et tout ticket précédent sur le même sujet. Si la fiche est introuvable des deux côtés, le dire en tête de réponse.
4. Chercher dans `kb/` un article qui répond à la question ou donne un contournement. En proposer un au plus.
5. Rédiger la réponse en appliquant `CLAUDE.md` : ton, noms officiels, délais du contrat seulement, interdits par écrit.
6. Si la catégorie est facturation, ou si le client demande un geste ou un remboursement : ne rien promettre, indiquer que la demande est transmise au chargé de compte, nommé.

Restituer dans cet ordre : la catégorie, le ou les tickets précédents liés, l'article proposé, puis la réponse prête à envoyer.
