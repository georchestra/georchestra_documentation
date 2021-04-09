#! /bin/bash


# on supprime tout ce qui est dans _build
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " purge des builds"
rm -rf html/*
echo " fait"
echo ""


echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " liste des versions"

# on va dans le dépôt
cd repo

# on crée une liste de tags / branches à builder
liste_versions=()

# une liste de tags
tags_v2="`git tag -l "*v2.*"`"
for tag in ${tags_v2}; do
  #echo $tag
  liste_versions+=($tag)
done

# on rajoute des branches à la main + master
liste_versions+=("master")
liste_versions+=("docs_mapstore2")

echo " fait"
echo ""


# et on itère dessus
for item in "${liste_versions[@]}"; do
  
  echo ""
  echo ""
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo " build de : $item"

  # on change de branche
  git checkout $item

  # on copie le fichier conf.py
  cp -f ../conf.py docs/conf.py
  mkdir docs/_templates
  cp -f ../versions.html docs/_templates/

  # on builde la version HTML
  sphinx-build -b html docs/ ../html/$item

  # nettoyage
  git checkout docs/conf.py
  rm -rf docs/_templates

  echo ""
  echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo " patch CSS"
  sed -i -e 's/max-width:800px/max-width:1200px/g' ../html/$item/_static/css/theme.css
  echo " fait"
  echo ""

  #read -p "Press any key to resume ..."
  
done

# return to master branch
git checkout master


