# Ré-utiliser ce modèle

## Cloner ou télécharger ce dépôt de code

TODO

## Importer dans votre projet

Copier les éléments suivants à la racine de votre projet :

- le répertoire `docs`
- le fichier de configuration de la documentation `mkdocs.yml`
- le fichier de configuration de compilation de documentation pour ReadTheDocs `.readthedocs.yaml`
- le fichier `requirements.txt` pour l'installation de MkDocs


## Modifier le .gitignore de votre projet

Modifier le fichier `.gitignore` pour rajouter une exclusion pour ne pas comitter le fichier `docs/tableofcontent.md` qui est un fichier généré à chaque build de la documentation.


## Modifier la configuration

Ouvrir le fichier `mkdocs.yml` et modifier :

- `repo_url`
- `repo_name`
- la partie `nav:`

### Créer une session virtuelle Python et installer

Voir la partie [Installation et configuration de MkDocs](https://github.com/georchestra/georchestra_documentation#installation-et-configuration-de-mkdocs) du [README](https://github.com/georchestra/georchestra_documentation#readme).


### Prévisualiser

Dans le terminal faire un  `mkdocs serve` et ouvrir un navigateur sur [http://127.0.0.1:8000/](http://127.0.0.1:8000/).

