<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>
            {% block title %}
                {{settings.siteName}}
                {% if pagination && pagination.page > 1 %}
                    - Page {{pagination.page}} of {{pagination.totalPages}}
                {% endif %}
            {% endblock %}        
        </title>
        {% block head %}
            <meta name="description" content="">
            <meta name="viewport" content="width=device-width">

            <link rel="stylesheet" href="/vendor/css/normalize.min.css">
            <link rel="stylesheet" href="/vendor/css/h5bp.css">
            <link rel="stylesheet" href="/vendor/css/bootstrap.min.css">
            <link rel="stylesheet" href="/vendor/css/font-awesome.min.css">
            <link rel="stylesheet" href="/vendor/css/bootstrap-responsive.min.css">
            <!--[if IE 7]><link rel="stylesheet" href="/vendor/css/font-awesome-ie7.min.css"><![endif]-->
            
            <link rel="stylesheet" href="/css/personal/main.css">

            <script src="/vendor/js/modernizr-2.6.2.min.js"></script>

            <link rel="alternate" type="application/rss+xml" href="/rss">
        {% endblock %}

    </head>
    <body>
            <!--[if lt IE 7]>
                <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
            <![endif]-->
    
            <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
            <script>window.jQuery || document.write('<script src="/vendor/js/jquery-1.9.1.min.js"><\/script>')</script>

            <script src="/vendor/js/plugins.js"></script>
            <script src="/vendor/js/bootstrap.min.js"></script>
            <script src="/js/personal/main.js"></script>
    
            <script>
                var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
                (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
                g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
                s.parentNode.insertBefore(g,s)}(document,'script'));
            </script>
            
            {% block body %}
                <div class="container container-narrow">
                    {% block pageHeader %}
                        {% include "partials/page-header.swig" %}
                    {% endblock %}
            
                    <div class="row-fluid">
                        <div class="span9">
                        {% block pageBody %}{% endblock %}
                        </div>
                        <div class="span3">
                            <h2>SideBar</h2>
                            this is a placeholder for the sidebar
                        </div>
                    </div>
            
                    {% block pageFooter %}
                        {% include "partials/page-footer.swig" %}
                    {% endblock %}
            
                    {% include "partials/author.swig" %}
                </div>
            
                {% block js %}{% endblock %}
            {% endblock %}
    </body>
</html>
