# Maintenir à jour ce modèle

Si des modifications fonctionnelles nécessite l'utilisation de nouvelles librairies Python ou simplement leur mise à jour, ne pas oublier de figer les dépendances Python :

```bash
pip freeze > requirements.txt
```

Et de reproduire les wheels :

```bash
rm modules/*
python -m pip wheel -r requirements.txt -w modules/{version python + os}
```