# geOrchestra documentation

Template for the geOrchestra's documentations.

Modèle de documentation d'un produit geOrchestra.


## Utiliser

lien vers [utiliser.md](utiliser.md)


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
pip install -r requirements.txt
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

Si vous êtes dans un environnement réseau restreint / sans accès à internet et sous Windows (désolé…), utilisez les wheels disponibles : `python -m pip install --trusted-host pypi.org modules/3.9_windows/*.whl`.


### Maintien de ce modèle

Si des modifications fonctionnelles nécessite l'utilisation de nouvelles librairies Python ou simplement leur mise à jour, ne pas oublier de figer les dépendances Python :

```bash
pip freeze > requirements.txt
```

Et de reproduire les wheels :

```bash
rm modules/*
python -m pip wheel -r requirements.txt -w modules/
```


##  VRAC

### tableofcontent

Le plugin **mkdocs-toc-md** vas créer (dans docs/tableofcontent.md) une table des matières dynamiquement afin de pouvoir faire uniquement des "copié-collé dans les differents `index.md.


### Convertir un fichier RST (reStructuredText) en MarkDown

L'utilisation de ChatGPT permet de convertir les fichiers

Exemple de prompt :
Can you convert https://raw.githubusercontent.com/georchestra/cadastrapp/master/docs/guide_developpeur/matrice_fonctionnalites.rst to markdown ?

![image info](./images/prompt_chatgpt.PNG)
