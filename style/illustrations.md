# Style des illustrations

Les illustrations des slides sont générées dans ChatGPT. Chaque illustration a son fichier `supports/figures/<nom>.prompt.md`, qui contient le prompt complet, prêt à copier-coller sans rien modifier. Ce fichier-ci est le gabarit dont ils dérivent.

## Règles

- **Le format se décide avant la génération, jamais après.** On ne recadre pas une image générée. Si le résultat ne convient pas, on régénère avec le même prompt.
- Le fichier image porte le même nom que son prompt : `nom.prompt.md` → `nom.png`.
- Une illustration illustre un gag ou une situation, pas un concept abstrait. Le nouveau collègue y est reconnaissable d'une image à l'autre.
- Un seul élément orange par image : celui qu'on doit regarder.
- Aucun texte dans l'image.
- Palette et placement : voir [[charte-graphique]].

## Gabarit

Pour créer un nouveau `nom.prompt.md` : copier le bloc ci-dessous, garder une seule des trois options de `FORMAT ET COMPOSITION`, écrire la `SCÈNE`, et mettre en tête du fichier la slide cible et le placement.

```
Dessine une illustration de bande dessinée humoristique, style école franco-belge classique des années 1960, pour une slide de formation. Fond uniformément blanc pur (#FFFFFF), sans décor de fond, sans cadre, sans dégradé, sans texture.

STYLE DU TRAIT
- Trait à l'encre noire, vif et très souple : contours précis mais jamais géométriques, impression de dessin spontané, épaisseur du trait variable.
- Personnages très caricaturaux aux silhouettes immédiatement identifiables : corps longilignes ou exagérés, grands pieds, nez proéminents, chevelures en bataille.
- Expressions faciales poussées : yeux, sourcils, bouche et posture portent l'émotion.
- Gestuelle élastique : les corps se courbent, s'affaissent, bondissent ou se tordent comme s'ils étaient en caoutchouc.
- Mouvement partout : lignes cinétiques, objets qui vibrent, fumée, poussière, projections, petits signes graphiques.
- Accumulation comique de détails : bureaux encombrés, piles de dossiers, câbles, plantes, mobilier malmené. Le décor participe au gag.
- Objets légèrement déformés : parfaitement compréhensibles, mais perspectives et proportions assouplies.
- Décor crédible mais dessiné, sans photoréalisme, limité au strict nécessaire pour la scène : les éléments flottent sur le blanc, pas de sol ni de mur qui remplit le fond.
- Contraste entre quotidien et chaos : un environnement banal de bureau envahi par une situation absurde.

COULEURS, RÈGLE STRICTE
- Aplats simples, sans ombres portées ni modelé ni rendu réaliste. Une seule teinte par zone.
- Palette limitée à exactement quatre couleurs en plus du noir du trait et du blanc du fond :
  - bleu marine #1F3A5F
  - orange #D97A1E
  - gris ardoise #5A6270
  - beige clair #F1EFE9
- Aucune autre couleur. Pas de peau rose, pas de vert, pas de rouge : les visages et les mains sont laissés en blanc ou en beige clair.
- L'orange est réservé à un seul élément par image, celui sur lequel l'œil doit aller.
- La majorité de la surface reste blanche.

TEXTE
- Aucun texte, aucune lettre, aucun chiffre, aucune bulle de dialogue dans l'image. Les bulles vides sont autorisées si la scène le demande.

PERSONNAGE RÉCURRENT
- Le « nouveau collègue » : jeune adulte dégingandé, cheveux en bataille, chemise trop grande, badge d'entreprise épinglé de travers, toujours volontaire, souvent dépassé. Il doit être reconnaissable d'une image à l'autre.

FORMAT ET COMPOSITION
[Option A, colonne gauche de la slide]
- Format portrait 3:4 (par exemple 1024 × 1365).
- Les personnages regardent et agissent vers la droite, vers le texte de la slide.
- L'action principale occupe le centre ; rien d'essentiel dans les 10 % de bord.
- Un seul personnage, ou deux au maximum, en pied.

[Option B, colonne droite de la slide]
- Format portrait 3:4 (par exemple 1024 × 1365).
- Les personnages regardent et agissent vers la gauche, vers le texte de la slide.
- L'action principale occupe le centre ; rien d'essentiel dans les 10 % de bord.
- Un seul personnage, ou deux au maximum, en pied.

[Option C, pleine largeur sous le titre, sans texte à côté]
- Format paysage 16:9 (par exemple 1792 × 1024).
- La scène se lit de gauche à droite.
- Rien d'essentiel dans les 10 % de bord.
- Peut contenir plusieurs personnages ou deux vignettes séparées par un trait vertical.

SCÈNE
[Deux ou trois phrases : qui, quoi, quel gag, quel élément est en orange.]
```

## Génération pilotée depuis Claude Code (circuit validé le 7 septembre 2026)

Claude Code peut piloter ChatGPT dans le Chrome de Rémi, via l'extension Claude in Chrome, sans passer par l'API. Ce qui marche :

1. Ouvrir chatgpt.com, puis le projet « Illustrations Cours Claude » dans la barre latérale (les images précédentes y sont).
2. Cliquer dans la zone de saisie et **taper** le prompt ligne par ligne avec `shift+Return` entre les lignes ; l'affectation directe du champ (`form_input`) n'est pas prise en compte par ChatGPT.
3. Envoyer ; la génération prend une à deux minutes.
4. Cliquer l'icône de partage en bas à droite de l'image, puis « Télécharger » : le fichier arrive dans `~/Downloads/ChatGPT Image <date>.png`. Le téléchargement demande l'accord de Rémi.
5. Copier dans `supports/figures/<nom>.png` et vérifier au rendu.

Réserves : les captures d'écran expirent parfois sur chatgpt.com (lire la page par sa structure) ; un CAPTCHA ou une demande d'autorisation est à traiter par Rémi ; ne jamais s'identifier à sa place.

Les essais non retenus vont dans `supports/figures/_essais/`, jamais dans une slide.

## Poids des fichiers

Les fichiers sortent autour de 1,5 Mo. Le HTML Marp les référence sans les embarquer ; le PDF les embarque. Si le deck devient lourd, `sips -Z 1400 fichier.png` réduit sans recadrer.
