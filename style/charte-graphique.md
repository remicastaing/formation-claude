# Charte graphique

## Couleurs

Définies dans `theme.css`, reprises dans les figures SVG et les prompts d'illustration.

| Rôle | Nom | Hex |
|---|---|---|
| Titres, tableaux, trait principal | bleu marine | `#1F3A5F` |
| Un seul élément d'accent par slide ou par image | orange | `#D97A1E` |
| Texte secondaire, notes, numéro de page | gris ardoise | `#5A6270` |
| Lignes alternées des tableaux, aplats clairs | beige clair | `#F1EFE9` |
| Fond des slides et des images | blanc pur | `#FFFFFF` |
| Texte courant | noir | `#1C1C1C` |

Aucune autre couleur, ni dans les slides ni dans les illustrations.

## Typographie

Sans-serif système (Helvetica Neue, Arial). Corps 30 px dans Marp, titres de slide 1,35 em soulignés d'un filet orange. Tableaux à 0,8 em ; 0,62 em en style local (`<style scoped>`) quand une image occupe une colonne.

## Thème Marp

`style/theme.css`, nom de thème `norrsken`, étend `default`. Chargé avec `--theme-set style/theme.css`. Slide de titre en classe `lead`.

## Mise en page des images

- Colonne gauche : `![bg left:32% fit](figures/nom.png)`, personnages tournés vers la droite.
- Colonne droite : `![bg right:38% fit](figures/nom.png)`, personnages tournés vers la gauche.
- Pleine largeur : `![w:1000](figures/nom.png)` seul sous le titre ; le texte va sur la slide suivante.
- Alterner gauche et droite d'une slide illustrée à la suivante.
- `fit` est obligatoire, sinon Marp recadre l'image pour remplir la colonne.
- Une image par slide au plus. Pas plus d'une slide illustrée sur trois.

## Logo

Le logo du cours est le personnage du stagiaire, de profil, un crayon orange derrière l'oreille, dans un cercle bleu marine : `supports/figures/logo.png` (1254 px, source), `logo-512.png` (livre Quarto : couverture et barre latérale), `favicon.png` (64 px). Sur les slides, il apparaît en bas à gauche de chaque slide par le thème (`section::before`, image encodée dans `style/theme.css`), et en grand sur la slide de titre. Les versions réduites sont obtenues par `sips -Z`, jamais par recadrage.

## Figures schématiques

Les schémas (boucle agentique, etc.) existent en deux formes dans `supports/figures/` : un `.md` avec Mermaid pour la lecture dans Obsidian, un `.svg` dessiné à la main pour les slides. Le SVG fait foi ; il utilise les couleurs ci-dessus et la police système. Marp ne rend pas Mermaid.

## Rendu

Voir `supports/README.md`. Vérification visuelle obligatoire après toute slide avec image : rendu `--images png`, puis lecture des PNG concernés.
