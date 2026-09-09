# Afficher les slides

`slides.md` est au format Marp, avec le thème `style/theme.css` du cours. Node est requis. Installer Marp une fois, globalement :

```bash
npm install -g @marp-team/marp-cli
```

Éviter `npx -y @marp-team/marp-cli` : il re-résout le paquet à chaque appel et reste parfois suspendu plusieurs minutes. Les commandes ci-dessous supposent `marp` installé. Toutes prennent `--theme-set style/theme.css` pour charger le thème ; sans cette option, Marp retombe sur son thème par défaut.

Aperçu en direct (recharge à chaque sauvegarde) :

```bash
marp supports/slides.md --theme-set style/theme.css -p
```

Export HTML autonome, à ouvrir dans un navigateur le jour J :

```bash
marp supports/slides.md --theme-set style/theme.css -o supports/slides.html
```

Export PDF :

```bash
marp supports/slides.md --theme-set style/theme.css --pdf -o supports/slides.pdf
```

Alternative sans rien lancer : activer le plugin de base « Diapositives » dans Obsidian et ouvrir `slides.md` en mode présentation. Il utilise les mêmes séparateurs `---`, mais ignore le frontmatter Marp et n'affiche pas les numéros de page.

Vérification visuelle slide par slide, une image PNG par slide (utile pour contrôler une mise en page avec image) :

```bash
marp supports/slides.md --theme-set style/theme.css --images png --allow-local-files -o /tmp/deck.png
```

## Images

Les illustrations sont dans `figures/`, chacune avec son fichier `nom.prompt.md` prêt à coller dans ChatGPT (gabarit : `style/illustrations.md`). Une image en colonne se place avec `![bg left:32% fit](...)` ou `![bg right:38% fit](...)` ; le mot `fit` est indispensable, sinon Marp recadre l'image pour remplir la colonne. Le fond des slides est blanc pur pour que les images s'y fondent.

## Thèmes

Marp fournit trois thèmes intégrés : `default`, `gaia`, `uncover`. Pour en essayer un, remplacer `theme: norrsken` par l'un de ces noms dans l'en-tête et omettre `--theme-set`.

Le thème du cours, `style/theme.css`, étend `default` : police plus grande pour la projection, tableaux lisibles, titre souligné en orange. Pour surligner la ligne du jour dans le tableau du nouveau collègue, ajouter `<!-- _class: ... -->` n'est pas possible sur une ligne de tableau ; on duplique la slide 0.3 dans le module et on met la ligne concernée en **gras**.

Thèmes communautaires : https://github.com/marp-team/marp-cli/discussions ou rechercher « marp theme » sur GitHub ; un fichier CSS suffit, chargé de la même façon avec `--theme-set`.
