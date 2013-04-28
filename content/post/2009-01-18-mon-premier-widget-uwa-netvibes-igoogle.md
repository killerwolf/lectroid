---
title: Mon premier widget UWA netvibes / iGoogle
tags:
- igoogle
- netvibes
- php5
- uwa
- widget
---

![NetVibes iGoogle Widget](/img/personal/posts/netvibes.jpg "NetVibes iGoogle Widget")

A la base, le projet etait prévu pour mon tag:tag NabKiller, but i wanted to mess with the netvibes UWA. Ce widget affiche les horaires de diffusion des séries que je regarde régulièrement.

Aimant beaucoup les mashups, je me suis pas amusé à lister toutes les séries qui existent. j’ai donc utilisé pour cela un services proposé par TVRage. Une fois votre compte créé sur TVRage et vos séries préférées ajoutées a votre compte, TVRage vous met à disposition un “Personalized RSS Feed” des séries difusées pendant la semaine en cours.

Voici le mien:
http://www.tvrage.com/myweekrss.php?tid=32948&hash=a60a8c06b3fd2afda135e2a42ab88a7e

Comme vous pouvez le voir, le flux est très sale, on peut pas le manipuler aisément , les items sont hétérogènes. Donc ce fut assez laborieux pour agréger ce flux et lui donner l’apparence que j’ai voulu.

Voulant allez le plus rapidement possible pour voir mon widget fonctionner, j’ai écrit une petite API en PHP5 qui agrège ce flux et ordonne correctement les données. Il est aussi possible de se servir du parser UWA/JS fourni par netvibes, et c’est une meilleur solution. car actuellement le widget est dépendant le l’api que j’ai écrite et qui est hostée sur un de mes sites, mais qu’importe, je compte pas diffuser mon widget pour le moment, la solution PHP me convient.

Le widget prend 3 paramètres, le `tid` et le `hash` que vous trouvez dans l’url de votre flux personnalisé, et le troisiéme qui est l’adresse de mon API.

![NetVibes iGoogle Widget](/img/personal/posts/netvibes-param.jpg "NetVibes iGoogle Widget")