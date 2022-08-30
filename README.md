# geOrchestra documentation

Gathering of all geOrchestra's documentations.


## Purpose

Ce dépôt rassemble des outils pour builder les documentations rédigées et gérées grâce à Sphinx https://www.sphinx-doc.org



## Installation and configuration

### Sous Linux

On installe le paquet sphinx.

```bash
sudo apt install python3-sphinx
...
sphinx-build --version
sphinx-build 1.8.5
```

On clone ce dépôt.

```bash
git clone https://github.com/georchestra/georchestra_documentation.git
```

On se configure un environnement virtuel Python.

```bash
python --version
Python 3.9.9

# on configure une session virtuelle python
python -m venv .venv
source .venv/bin/activate

# on upgrade pip
python -m pip install --upgrade pip
```

Maintenant au choix on installe manuellement :

```bash
# on installe GitPython
python -m pip install gitpython

# on installe sphinx
python -m pip install sphinx

Collecting sphinx
  Downloading Sphinx-4.4.0-py3-none-any.whl 

Installing collected packages: snowballstemmer, pytz, certifi, alabaster, zipp, urllib3, sphinxcontrib-serializinghtml, sphinxcontrib-qthelp, sphinxcontrib-jsmath, sphinxcontrib-htmlhelp, sphinxcontrib-devhelp, sphinxcontrib-applehelp, pyparsing, Pygments, MarkupSafe, imagesize, idna, docutils, charset-normalizer, babel, requests, packaging, Jinja2, importlib-metadata, sphinx
Successfully installed Jinja2-3.0.3 MarkupSafe-2.0.1 Pygments-2.11.2 alabaster-0.7.12 babel-2.9.1 certifi-2021.10.8 charset-normalizer-2.0.11 docutils-0.17.1 idna-3.3 imagesize-1.3.0 importlib-metadata-4.11.0 packaging-21.3 pyparsing-3.0.7 pytz-2021.3 requests-2.27.1 snowballstemmer-2.2.0 sphinx-4.4.0 sphinxcontrib-applehelp-1.0.2 sphinxcontrib-devhelp-1.0.2 sphinxcontrib-htmlhelp-2.0.0 sphinxcontrib-jsmath-1.0.1 sphinxcontrib-qthelp-1.0.3 sphinxcontrib-serializinghtml-1.1.5 urllib3-1.26.8 zipp-3.7.0

# installation des thèmes sphinx
python -m pip install sphinx-rtd-theme
```

Soit on utilise les requirements :

```bash
python -m pip install -r requirements_ubuntu_2004.txt
```


## Utilisation

Exemple de build avec la documentation Cadastrapp


```bash
source .venv/bin/activate

cd cadastrapp
./build.bash
```

La documentation HTML produite se trouve dans le répertoire `html`.