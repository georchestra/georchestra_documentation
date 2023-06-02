# Utiliser et configurer les fonctionnalités avancées



## Insérer un sommaire

Le plugin **mkdocs-toc-md**  crée à chaque démarrage de `mkdocs serve`un fichier `tableofcontent.md`. Celui-ci contient une table des matières avec les liens vers les différentes pages.

On peut ensuite l'utiliser en copiant-collant son contenu pour le coller dans les différentes pages d'accueil (`index.md`).



## Masquer la navigation

On veut masquer la partie navigation qui est à gauche sur chaque page, sur la page d'accueil principale.

On insère donc cette balise en haut du markdown :

```
---
hide:
  - navigation
  - toc
---
```

[voir la doc officielle](https://squidfunk.github.io/mkdocs-material/setup/setting-up-navigation/#hiding-the-sidebars).


### Convertir un fichier RST (reStructuredText) en MarkDown

L'utilisation de ChatGPT permet de convertir les fichiers

Exemple de prompt :
Can you convert https://raw.githubusercontent.com/georchestra/cadastrapp/master/docs/guide_developpeur/matrice_fonctionnalites.rst to markdown ?

![image info](./images/prompt_chatgpt.PNG)

# Créer une nouvelle version

Éditer le fichier [docs/versions.json](docs/versions.json)
```
[
  {"version": "latest", "title": "latest", "aliases": ["latest"]},
  {"version": "version_test", "title": "version_test", "aliases": []}
]
```
Deviendra:
```
[
  {"version": "latest", "title": "latest", "aliases": ["latest"]},
  {"version": "nouvelle", "title": "nouvelleversion", "aliases": []},
  {"version": "version_test", "title": "version_test", "aliases": []}
]
```

Il faudra également activer la nouvelle version via l'interface de configuration readthedocs.