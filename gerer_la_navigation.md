# Gérer la navigation

## Principe

La navigation est assurée de 2 manières.

D'abord par le bandeau qui structure 2 grandes entrées :
  -  une documentation pour les utilisateurs finaux
  -  une entrée pour les administateurs de plate-forme et les développeurs

Puis, une fois entré dans une de ces 2 grandes parties, par le bloc de navigation de gauche qui est un menu qui se déploie.

Cette partie doit être gérée à la main dans le fichier `mkdocs.yml` dans le bloc `nav:`.

[voir la doc officielle](https://squidfunk.github.io/mkdocs-material/setup/setting-up-navigation/#hiding-the-sidebars).


## Masquer la navigation

On peut masquer la partie navigation qui est à gauche sur chaque page, sur la page d'accueil principale en insérant cette balise en haut du markdown :

```
---
hide:
  - navigation
  - toc
---
```


## Générer un index des pages pour copier-coller

Le plugin optionnel **mkdocs-toc-md** permet de créer un ficher `tableofcontent.md` à la racine du répertoire `docs`. Celui-ci contient une table des matières avec les liens vers les différentes pages de votre documentation.

Ce fichier est généré à chaque démarrage de `mkdocs serve` ou à chaque build.

Le seul intérêt de ce fichier est que l'on peut l'utiliser en copiant-collant son contenu pour le coller dans les différentes pages d'accueil (`index.md`).

Voir, pour exemple, la page [http://localhost:8000/guides_techniques/installer/](http://localhost:8000/guides_techniques/installer/ "http://localhost:8000/guides_techniques/installer/")

Pour le désactiver, supprimer ou commenter le bloc et le sous-bloc `toc-md` dans le fichier `mkdocs.yml`.