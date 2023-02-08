# geOrchestra documentation

Template for the geOrchestra's documentations.

Modèle de documentation d'un produit geOrchestra.



## Installation et configuration de MkDocs

### Création et activation d'un environnement virtuel Python

Il faut mettre en place un virtualenv Python propre à Mkdocs.

#### Sous Linux

```bash
python -m venv venv_mkdocs
source venv_mkdocs/bin/activate
```

#### Sous Windows

Utiliser un terminal bash, type git-bash.

```bash
python -m venv venv_mkdocs
source venv_mkdocs/Scripts/activate
```

### Installer les modules Python requis 

MkDocs est un module python. Notre template de documentation fait également appel à des modules complémentaires.

Il y a 3 possibilité pour installer ces modules.

#### utiliser les requirements

C'est la meilleure méthode car elle permet de s'assurer que l'on travaille tous sur les mêmes versions.

```bash
pip install -r requirements
```

Pour vérifier :

`mkdocs --version` ==> `mkdocs, version 1.4.2`


#### fresh install

Installation des dernières versions disponibles :

```bash
pip install mkdocs
pip install mkdocs-toc-md
pip install html5lib
pip install mkdocs-material
pip install mkdocs-git-revision-date-localized-plugin
```

#### Utiliser les wheels

Si vous êtes dans un environnement réseau restreint / sans accès à internet, utiliser les wheels disponibles : `python -m pip install --trusted-host pypi.org modules/3.9/*.whl`.



## Un projet MkDocs dans le répertoire `docs`

```bash
mkdocs new ./
```

Puis on prévisualise avec : `mkdocs serve`

Et [http://127.0.0.1:8000/](http://127.0.0.1:8000/)

## Figer les dépendances Python

```bash
pip freeze > requirements.txt
```

Ils seront repris par le compilateur de Read The Docs.



## Configuration d'un projet ReadTheDocs


### Ajout d'un fichier configuration `.readthedocs.yaml`

Dans le répertoire `docs` créer un fichier `.readthedocs.yaml`. Les réglages qui seront mis dans ce fichier seront pris en compte pour la compilation sur Read The Docs (RTD).

```yaml
# .readthedocs.yaml
# Read the Docs configuration file
# See https://docs.readthedocs.io/en/stable/config-file/v2.html for details

# Required
version: 2

# Set the version of Python and other tools you might need
build:
  os: ubuntu-22.04
  tools:
    python: "3.9"

mkdocs:
  configuration: mkdocs.yml

# Optionally declare the Python requirements required to build your docs
python:
   install:
   - requirements: requirements.txt
```


### Création d'un nouveau projet RTD

* Aller sur la page [https://readthedocs.org/dashboard/](https://readthedocs.org/dashboard/).
* Cliquer sur `Importer un projet`.
* Cliquer sur le bouton `Importer manuellement`.
* Mettre un nom en cohérence avec les règles de nommages des projets de documentation de geOrchestra
* Coller l'url du dépôt hébergé sur github.
* **IMPORTANT** spécifier manuellement le nom de la branche par défaut du projet : `master` pour les 'vieux' projets, `main` pour les récents.
* Cocher la case `Modifier les options avancées du projet`.
* Type de documentation : `Mkdocs`.
* Langue : `French`
* Cliquer sur `Terminer`=> le projet RTD est créé

À ce stade : on teste une compilation.
Si elle passe : on peut lancer une compilation de la doc manuellement.


### Compilation d'une release

TODO


### Configuration du webhook

La mise en place d'un webhook est nécessaire si on souhaite une compilation automatique à chaque commit sur une branche spécifique.


[https://docs.readthedocs.io/en/latest/integrations.html](https://docs.readthedocs.io/en/latest/integrations.html)

* Sur la page du projet, en haut, cliquer sur `Admin`.
* Dans les onglets / rubriques de gauche, choisir `Intégrations`.
* Un `Webhook entrant de Github` a été créé automatiquement. Mais à ce stade il est inopérant à cause des permissions sur Github (sauf en cas d'authentification via Github sur RTD).
* Copier l'URL du lien
* Allez sur la page Github du projet
* Allez dans Settings > Webhooks
* Cliquer sur le bouton `Add webhook`
* Coller l'URL dans `Payload URL`
* Content type : `application/json`
* Secret : laisser vide
* Cocher l'option `Let me select individual events.` Et choisir :
  * Pull requests
  * Pushes
  * Releases
* Pour finir, tout en bas, appuyer sur le bouton `Add webhook`

Pour tester si le webhooks fonctionne sur les évènements sélectionnés il suffit de modifier un fichier puis de pousser la modification sur github. Si `Pushes` a été sélectionné, alors, sur le site RTD, vérifier sur l'onglet `Compilations` si une compilation est en cours.


