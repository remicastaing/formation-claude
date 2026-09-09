---
name: triage-bug
description: Traite un signalement de bug de bout en bout : reproduit, localise dans le code, propose le correctif minimal, liste les tests à écrire. À utiliser dès qu'on donne un ticket, un message client ou une description de comportement anormal, même sans le mot « bug ».
argument-hint: "[ticket T-NNNN ou description]"
---

Signalement : $ARGUMENTS

Si c'est un numéro de ticket, lire `support/tickets/T-NNNN.md` et la fiche du client dans `support/clients/`.

1. **Reproduire.** Écrire un script ou un test minimal qui montre le comportement décrit, avec la fixture `app/fixtures/brossard.json` si elle convient. Lancer `pnpm test` d'abord : noter si les tests existants passent malgré le bug (c'est fréquent).
2. **Localiser.** Utiliser le sous-agent `explorateur` pour trouver les fichiers et fonctions concernés. Ne pas lire tout le dépôt dans la conversation.
3. **Expliquer** la cause en trois phrases, avec le fichier et la ligne.
4. **Proposer le correctif minimal.** Pas de refonte. Si le correctif touche `app/migrations/`, s'arrêter et demander.
5. **Lister les tests à écrire** : le test qui aurait attrapé le bug, et un test de non-régression sur le cas voisin.

Restituer dans cet ordre : reproduction, cause, correctif (diff), tests à écrire. Ne pas appliquer le correctif sans confirmation.
