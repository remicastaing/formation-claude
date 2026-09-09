# Le cours écrit

Livre Quarto, un chapitre par module, plus détaillé que les slides et le script. Les fichiers de configuration cités sont **inclus** depuis `demo-norrsken/` par `extraire.sh`, exécuté automatiquement avant chaque rendu : ne pas les recopier dans les chapitres.

```bash
quarto render cours            # HTML dans cours/_book/
quarto render cours --to pdf   # PDF (LaTeX requis : quarto install tinytex)
quarto preview cours           # aperçu en direct
```

Installer Quarto : `brew install --cask quarto` (demande le mot de passe administrateur). Sans droits administrateur, l'archive officielle suffit :

```bash
curl -sL -o /tmp/quarto.tar.gz https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.32/quarto-1.7.32-macos.tar.gz
mkdir -p ~/.local/quarto && tar -xzf /tmp/quarto.tar.gz -C ~/.local/quarto --strip-components=1
~/.local/quarto/bin/quarto render cours
```

Les illustrations sont celles des slides : `cours/figures` est un lien symbolique vers `supports/figures/`.

## Publication

Automatique : chaque push sur `main` du dépôt `remicastaing/formation-claude` déclenche `.github/workflows/publier.yml`, qui rend le cours (Quarto) et les slides (Marp, HTML et PDF) et publie le tout sur <https://remicastaing.github.io/formation-claude/>. Les slides sont à `/slides/`, le PDF à `/slides/slides.pdf`. Le déploiement prend deux à trois minutes ; suivre l'exécution dans l'onglet Actions du dépôt.
