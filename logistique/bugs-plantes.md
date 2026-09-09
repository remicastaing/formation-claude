# Bugs plantés dans `demo-norrsken/app/` — réponses pour le formateur

Ne pas distribuer. Tous les tests de `pnpm test` passent malgré les trois bugs : c'est voulu, et c'est le premier enseignement de l'Atelier A.

## Bug 1 — Export PDF vide (T-0417, T-0422, T-0298)

**Symptôme** : l'export PDF ne contient que le titre de la semaine ; l'export tableur est complet.

**Cause** : `src/export/pdf.ts` lit `m.jours`, ancien nom du champ, alors que le modèle commun `buildPlanningModel()` produit `m.journees` depuis la 4.5. Le cast `as unknown as {...}` masque l'erreur de type et le `?? []` masque l'absence à l'exécution. Le tableur lit le bon champ.

**Correctif minimal** : remplacer la ligne du cast par `const jours = m.journees;` et supprimer le type intermédiaire.

**Tests à écrire** : dans `tests/export.test.ts`, le PDF contient une ligne par créneau plus une par journée plus le titre (16 lignes pour la fixture) ; et un test qui vérifie que PDF et tableur listent les mêmes créneaux.

**Ce que `verif` doit signaler** : aucun test ne couvrait le contenu du PDF ; le cast `as unknown` est une odeur à retirer ; `server.ts` appelle `exportPdf` et bénéficie du correctif sans changement.

## Bug 2 — Date limite de diagnostic fausse après un week-end (T-0416, exemple métier)

**Symptôme** : un ticket Pro reçu vendredi 18/09 obtient une date limite au lundi 21 au lieu du mardi 22.

**Cause** : `src/domain/sla.ts`, `estOuvre()` n'exclut que le samedi (`j !== 6`) et compte le dimanche comme ouvré.

**Correctif minimal** : `return j !== 0 && j !== 6;`

**Tests à écrire** : réception un vendredi, un samedi, un dimanche, pour chaque offre. Le test existant ne couvre que le milieu de semaine.

## Bug 3 — Remises cumulées (T-0405)

**Symptôme** : Serres Vauclin, 55 utilisateurs et engagement annuel, se voit appliquer 25 % au lieu de 15 %.

**Cause** : `src/domain/tarifs.ts`, `remise()` additionne les deux remises. Le commentaire au-dessus dit pourtant « jamais les deux ».

**Correctif minimal** : `return Math.max(engagementAnnuel ? REMISE_ANNUELLE : 0, utilisateurs > SEUIL_VOLUME ? REMISE_VOLUME : 0);`

**Tests à écrire** : plus de 50 utilisateurs *avec* engagement annuel → 15 %. Le test existant ne teste que sans engagement.

**Lien avec l'Atelier B** : le ticket T-0405 demande de *confirmer* le cumul. La bonne réponse support dit que la grille prévoit la plus favorable, et transmet au chargé de compte. Au Module 8, faire se rencontrer les deux ateliers sur ce ticket : le support l'a refusé par écrit grâce à la grille, les devs l'ont corrigé dans le code.
