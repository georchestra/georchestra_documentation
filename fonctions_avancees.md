# Utiliser et configurer les fonctionnalités avancées



## Générer un index des pages pour copier-coller

Le plugin optionnel **mkdocs-toc-md** permet de créer un ficher `tableofcontent.md` à la racine du répertoire `docs`. Celui-ci contient une table des matières avec les liens vers les différentes pages de votre documentation.

Ce fichier est généré à chaque démarrage de `mkdocs serve` ou à chaque build.

Le seul intérêt de ce fichier est que l'on peut l'utiliser en copiant-collant son contenu pour le coller dans les différentes pages d'accueil (`index.md`).


## Masquer la navigation

On peut masquer la partie navigation qui est à gauche sur chaque page, sur la page d'accueil principale en insérant cette balise en haut du markdown :

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