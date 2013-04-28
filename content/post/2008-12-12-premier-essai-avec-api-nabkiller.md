---
title: Premier essai avec l’API de mon nabkiller
tags:
- api
- javascript
- messenger plus live
- nabaztag
- violet
- windows live messenger
---
<img class="thumbnail pull-left" src="/img/personal/posts/nabkiller.jpg" />
J’ai récemment fait l’acquisition il y a une semaine d’un Nabaztag:tag, voir le site officiel si vous ne savez pas ce que c’est.
Violet, le fabricant du Nabaztag:tag fournit une API avec son lapin. On peut interagir avec son propre lapin, lui faire faire plein de chose.
Mon idée était de pouvoir faire faire lire les messages qu’on m’écrivait sur MSN par mon lapin, quand je met met en statut “AFK” (c-a-d Away from keyboard pour les non geek), je pourrais entendre les messages de mes amis quand je ne suis pas derrière mon écran pour les lire.
Le lapin a une fonctionnalité Text To Speech, on lui envoie un texte par l’intermédiaire de l’API, et il les lit dès réception.

Dernière étape: faire en sorte que MSN puisse déclencher certaines actions de l’API en fonctions de certains de ses événements interne. Et c’est la que Messenger plus live trouve son utilité. Tout le monde connait cet addon de MSN, mais ses possiblité de scripting ne sont pas connu de tous, c’est qu’on a la possibilité d’exécuter nos propres commandes grâce à l’environnement Javascript embarqué dans Mesenger plus live. En plus des Événements basique de MSN, cet addon implémente toutes une séries d’évènements très utile, il suffit donc d’implémenter les fonctions-évènements qui nous intéressent dans notre script JS.
Voici la documentation fourni par Mesenger.
Ci-dessous une courte vidéo montrant mes premier tests effectué avec mon NabKiller (c’est le nom que j’ai donné à mon lapin).

<div class="video-wrapper">
    <iframe width="735" height="413" src="http://www.youtube.com/embed/4BKnJzcEGio" frameborder="0" allowfullscreen></iframe>
</div>

Idée que je vais surement développer avec mon lapin:
Mon Nabkiller me préviendra dès qu’un nouvelle épisode des séries que je regarde est publié, et il me dira si les sous-titres de ce même épisode sont disponibles, à défault il me préviendra dès que ce sera le cas
Doter mon lapin d’une intelligence artificiel, avec un bot pandorabot par exemple. Pour exemple voici [Voldo](http://sycophante.vhost.pandorabots.com/pandora/talk-oddcast?botid=a77514392e359d3d) un bot doté d’un IA.