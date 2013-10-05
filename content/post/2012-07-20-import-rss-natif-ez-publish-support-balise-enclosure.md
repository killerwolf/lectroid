---
title: L’import RSS natif d’eZ Publish avec support de la balise enclosure
tags:
- ezpublish
- php5
---
<img class="thumbnail pull-left" src="/img/personal/posts/ezpublish_media_import_rss-150x150.jpg" />
###Le besoin###
eZ publish offre la possibilité sans écrire une seule ligne de code, d’importer des contenus d’un flux RSS, sous forme de contenus eZpublish. Mais cette fonctionnalité native ne permet pas d’importer les média inclus dans la balise `<enclosure>`

Je vais donc vous montrer comme vous permettre de récupérer ce media (image ou autre fichier tel que pdf, doc ou flv) et de l’insérer de manière transparente dans vos contenus eZ Publish.
Cette fonctionnalité est un peu codé en dur dans eZ Publish et n’est pas extensible proprement. Je vais vous la manière *Quick and dirty* pour arriver à vos fin. A vous ensuite de choisir si vous voulez passer du temp à faire cela proprement.

    <enclosure url="http://www.example.com/images/voiture.jpg" length="" type="image/jpeg"/>

###Implémentation quick and dirty###
Voici les fichiers qui seront impacter par nos modifications. Ce sont des fichiers du noyau eZPublish

* La fonction `setObjectAttributeValue()` dans le fichier `cronjobs/rssimport.php` (script php apellé par crond pour aller récupérer les nouveaux items des flux RSS configurés en Back Office)
* La methode `rssFieldDefinition()` dans le fichier `kernel/classes/ezrssimport.php`

La fonction `setObjectAttributeValue()` permet de traiter la récupération des différents types d’attributs (ligne de texte, bloc xml), c’est donc ici que nous allons naturellement ajouter le traitement de notre attribut ezimage (cela fonctionne aussi avec ezfile). Nous allons rajouter le `case ‘ezimage’`

    function setObjectAttributeValue( $objectAttribute, $value )
    {
        //…
        switch( $dataType )
        {
            //…
            case ‘ezimage’:
            {
                $file = pathinfo($value);
                $image = eZHTTPTool::getDataByURL( $value );
                if($image !== false)
                {
                    $fp = fopen(‘/tmp/’.$file[‘basename’],‘wb’);
                    fwrite($fp, $image, strlen($image));
                    fclose($fp);
                    $objectAttribute->fromString( ‘/tmp/’.$file[‘basename’] );
                }
            } break;
            //..
        }
    }

Après s’être occupé d’apprendre à **eZ Publish** comment traiter les ezimage. Nous allons maintenant ajouter `Item – Enclosure – Url` dans le `<select>` (voir image plus haut). Occupons nous de la méthode `rssFieldDefinition()`

    case ’2.0′:
    case ’0.91′:
    case ’0.92′:
    {
      return array( ‘item’ => array( ‘elements’ => array( ‘title’,
                                                          ‘link’,
                                                          ‘description’,
                                                          ‘author’,
                                                          ‘category’,
                                                          ‘comments’,
                                                          ‘guid’,
                                                          ‘pubDate’,
                                                          ‘enclosure’ => array( ‘attributes’ => array( ‘url’ ) ) ) ),
                    ‘channel’ => array( ‘elements’ => array( ‘title’,
                                                             ‘link’,
                                                             ‘description’,
                                                             ‘copyright’,
                                                             ‘managingEditor’,
                                                             ‘webMaster’,
                                                             ‘pubDate’,
                                                             ‘lastBuildDate’,
                                                             ‘category’,
                                                             ‘generator’,
                                                             ‘docs’,
                                                             ‘cloud’,
                                                             ‘ttl’ ) ) );
    }

###Implémentation plus propre###
Au lieu de modifier le cron `rssimport.php` vous pouvez le copier dans votre extension y apporter les modifications pour le ezimage. Et appeler ce dernier au lieu du `rssimport.php` par défaut d’eZ Publish.
La méthode `rssFieldDefinition()` est utilisé dans une autre méthode de la même classe, on remarque la présence d’un hook qui permet d’étendre sa définition a partir des classes présentes dans nos extensions custom.
Voici le hook qui est dans la méthode `fieldMap()`

    $fieldDefinition = eZRSSImport::rssFieldDefinition();
     
    $ini = eZINI::instance();
    foreach( $ini->variable( ‘RSSSettings’, ‘ActiveExtensions’ ) as $activeExtension )
    {
        if ( file_exists( eZExtension::baseDirectory() . ‘/’ . $activeExtension . ‘/rss/’ . $activeExtension . ‘rssimport.php’ ) )
        {
            include_once( eZExtension::baseDirectory() . ‘/’ . $activeExtension . ‘/rss/’ . $activeExtension . ‘rssimport.php’ );
            $fieldDefinition = eZRSSImport::arrayMergeRecursive( $fieldDefinition, call_user_func( array(  $activeExtension . ‘rssimport’, ‘rssFieldDefinition’ ), array() ) );
        }
    }

Il nous suffit donc de créer une classe dans `extension/monextension/rss/ezrssimage.php` avec ce code, avec une methode du même nom: `rssFieldDefinition()`

    class ezrssimagerssimport
    {
        static function rssFieldDefinition()
        {
            return array( ‘item’ => array( ‘elements’ => array( ‘enclosure’ => array( ‘attributes’ => array( ‘url’ ) ) ) ) );
        }
    }

et de déclarer cette classe dans le fichier `monextension/settings/site.ini.append.php`.

    [RSSSettings]
    ActiveExtensions[]=ezrssimage
    
Voila pour ce tutoriel. Si je trouve le temps je packagerai cela dans une extension que je publierai sur **GitHub** ou **projects.ez.no** (sauf si quelqu'un me devance d’ici là).
N’hésitez pas à me signaler des erreurs ou améliorations que vous jugerez utiles.

Vous pouvez retrouver les snippets PHP précédent ici https://gist.github.com/killerwolf/5430167