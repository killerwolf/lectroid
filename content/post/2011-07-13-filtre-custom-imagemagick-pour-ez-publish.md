---
title: Filtre custom ImageMagick pour eZ Publish
tags:
- ezpublish
- imagemagick
---
Les filtres par défaut d’**eZ Publish**, ne vous permettent pas de rogner les images pour les faire entrer dans des dimensions précises. Le fichier de conf `image.ini` vous permet d’implémenter sous **eZ Publish** toutes les possibilités offertes par les outils CLI d’**ImageMagick**. Voici 2 filtres qui effectuent la même tâche mais avec 2 manières différentes: rogner et redimensionner les images, libre à vous de les utiliser avec vos Alias

    Filters[]=geometry/thumbnailize=-thumbnail "%1x%2^" -gravity center -extent %1x%2
    Filters[]=geometry/thumbnailize2=-geometry %1x%2^ -gravity center -crop %1x%2+0+0 +repage