#! /bin/bash


# on supprime tout ce qui est dans _build
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " purge des builds"
rm -rf html/*
echo " fait"
echo ""

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " mise à jour du clone local"

# on va dans le dépôt
cd repo

# on rafraîchit le dépôt
git pull -qf

echo " fait"
echo ""


echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " création de la liste des versions à builder"
echo ""

# on crée une liste de tags / branches à builder
liste_versions=()

# une liste de tags
tags_v2="`git tag -l "*[v|V]2.*"`"
for tag in ${tags_v2}; do
  #echo $tag
  liste_versions+=($tag)
done

# on rajoute des branches à la main + master
liste_versions+=("master")


for tag in "${liste_versions[@]}"; do
  echo " $tag"
  # on crée un fichier qui liste les tags / branches à builder
  echo "$tag" >> docs/git_branch_list.txt
done

echo ""

# et on itère dessus
for item in "${liste_versions[@]}"; do
  
  echo ""
  echo ""
  echo "---------------------------------------------------------"
  echo " build de : $item"
  echo ""
  echo ""

  # on change de branche
  git checkout -qf $item

  # on crée un petit fichier avec le nom de la version courant
  echo "$item" > docs/git_branch_current.txt
  
  # on copie les fichiers nécessaires
  cp -f ../conf.py docs/conf.py
  mkdir docs/_templates
  cp -f ../versions.html docs/_templates/
  
  # on builde la version HTML
  sphinx-build -b html docs/ ../html/$item

  # nettoyage
  git restore docs/conf.py
  rm -rf docs/_templates

  echo ""
  echo "---------------------------------------------------------"
  echo " patch CSS"
  sed -i -e 's/max-width:800px/max-width:1200px/g' ../html/$item/_static/css/theme.css
  echo " fait"
  echo ""
  
done


echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " nettoyage"

# return to master branch
git checkout master

rm docs/git_branch_list.txt
rm docs/git_branch_current.txt


echo ""
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " copie la page de redirection web"
cd ..
cp index.html html/
echo " fait"
echo ""

