#! /bin/bash

# on supprime tout ce qui est dans _build
rm -rf html/*

echo "+++++++++++++++++++++++++++++++++++"
echo " liste des versions"

# on va dans le dépôt
cd repo

# on crée une liste de tags
liste_versions=()

tags_v1="`git tag -l "*v1.[8-9]*"`"
for tag in ${tags_v1}; do
  #echo $tag
  liste_versions+=($tag)
done

tags_v2="`git tag -l "*v2.*"`"
for tag in ${tags_v2}; do
  #echo $tag
  liste_versions+=($tag)
done

# on rajoute des branches à la main
liste_versions=("docs_mapstore2")
liste_versions+=("master")

echo " fait"
echo ""


# et on itère dessus
for item in "${liste_versions[@]}"; do
  
  echo "+++++++++++++++++++++++++++++++++++"
  echo " build de : $item"

  # on change de branche
  git checkout $item

  # on copie le fichier conf.py
  cp -f ../conf.py docs/conf.py
  mkdir docs/_templates
  cp -f ../versions.html docs/_templates/

  read -p "Press any key to resume ..."

  # on builde la version HTML
  sphinx-build -b html docs/ ../html/$item

  read -p "Press any key to resume ..."

  # nettoyage
  git checkout docs/conf.py
  rm -rf docs/_templates

  read -p "Press any key to resume ..."

  echo " patch CSS"
  sed -i -e 's/max-width:800px/max-width:1200px/g' ../cadastrapp_docs/html/$item/_static/css/theme.css
  
done

# return to master branch
git checkout master


