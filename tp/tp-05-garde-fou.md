# TP 5 — Hook ou CLAUDE.md ?

**Durée** : 8 minutes, en binôme. Trois minutes pour écrire, trois pour trancher, deux pour le tour de table.
**Objectif** : formuler une règle de garde-fou de votre métier et décider où elle va.

## La fiche

**Notre règle**, en une phrase, ce qu'on ne veut jamais voir arriver :

________________________________________________________________

**Trois questions.**

1. Y a-t-il un moment observable où la règle s'applique ? Une édition de fichier, une commande, un envoi, une fin de réponse.

   Lequel : ________________________  oui / non

2. Peut-on la vérifier par un script, sur ce qui est en train de se passer ? Un chemin de fichier, un mot dans un texte, un montant, un nom de commande.

   Ce que le script regarderait : ________________________  oui / non

3. Que se passe-t-il si elle est ignorée une seule fois ?

   ________________________  bénin / grave

**Verdict** : trois « oui », ou « grave » à la question 3 → **hook**. Sinon → **ligne de CLAUDE.md**.

Notre verdict : hook / CLAUDE.md

## Pour vous aider

- Le ton, le style, une préférence : pas de moment observable, pas de script. CLAUDE.md.
- « Jamais chez un client », « jamais dans ce dossier », « jamais cette commande » : un envoi, une édition, une commande. Hook.
- Un hook regarde un événement et un contenu ; il ne juge pas une intention. « Ne pas être vague » n'est pas un hook. « Pas de montant sans HT » en est un.
- Une règle peut avoir les deux : la ligne de CLAUDE.md dit à Claude ce qu'on attend, le hook s'assure que ça arrive.
