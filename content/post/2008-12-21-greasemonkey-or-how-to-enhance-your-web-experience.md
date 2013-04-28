---
title: GreaseMonkey or how to enhance you web experience
tags:
- google
- greasemonkey
- userscripts
---
<img class="thumbnail pull-left" src="/img/personal/posts/greasemonkey.gif" />
[GreaseMonkey](https://addons.mozilla.org/fr/firefox/addon/748) est une extension pour Firefox, elle vous permet de prendre le controle du web. Vous trouvez tel site intéressent malgré le faite qu’il soit infesté de pub. Grace a GreaseMonkey et a un petit script de quelque ligne, le rendu visuel de votre site préféré sera modifié selon votre désir.

Pour illustrer mon propos, j’ai écris à chaud le script JS ci-dessous, il supprime “Les Liens sponorisés” qui peuvent apparaitre lors de vos recherche sur Google. La connaissance du Javascript est biensur indispensable, mais aussi du Dom et/ou XPath .

Je vous ai convaicu d’écrire vos propres scripts , pensez à partagez les partager sur [UserScripts.org](http://userscripts.org/) si vous pensez qu’il peuvent être utiles à d’autre. [Mon Google Sponsored Links remover](http://userscripts.org/scripts/show/38984) est disponible sur UserScripts et est disposé à toute critique de votre part.

    // ==UserScript==
    // @name           Google Sponsored Links remover
    // @namespace      http://www.laadhari.fr
    // @description    remove google sponsored links from SERPS
    // @include        http://www.google.com/*
    // ==/UserScript==
     
    (function() {
      var sidebarads = document.getElementById(‘mbEnd’);
      var skyads = document.getElementById(‘tads’);
      if (sidebarads) {
        sidebarads.parentNode.removeChild(sidebarads);
        }
      if (skyads) {
        skyads.parentNode.removeChild(skyads);
        }  
      }
    )();
