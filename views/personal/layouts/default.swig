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

            <script>
            var _prum = [['id', '5344e449abe53df94060dbc1'],
                         ['mark', 'firstbyte', (new Date()).getTime()]];
            (function() {
                var s = document.getElementsByTagName('script')[0]
                  , p = document.createElement('script');
                p.async = 'async';
                p.src = '//rum-static.pingdom.net/prum.min.js';
                s.parentNode.insertBefore(p, s);
            })();
            </script>
    
            <link rel="stylesheet" href="/vendor/css/normalize.min.css">
            <link rel="stylesheet" href="/vendor/css/h5bp.css">
            <link rel="stylesheet" href="/vendor/css/bootstrap.min.css">
            <link rel="stylesheet" href="/vendor/css/font-awesome.min.css">
            <link rel="stylesheet" href="/vendor/css/bootstrap-responsive.min.css">
            <!--[if IE 7]><link rel="stylesheet" href="/vendor/css/font-awesome-ie7.min.css"><![endif]-->
            
            <link rel="stylesheet" href="/css/personal/main.css">

            <script src="/vendor/js/modernizr-2.6.2.min.js"></script>

            <link rel="alternate" type="application/rss+xml" href="/rss">
            <meta name="google-site-verification" content="iSBUlB7fQE_Oyk0XhBE1fhxliBEBR-zxGM2yDZ5GoqI" />
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
                <div class="container-fluid container-narrow">
                    {% block pageHeader %}
                        {% include "partials/page-header.swig" %}
                    {% endblock %}
            
                    <div class="row-fluid">
                        <div class="span9">
                            {% block pageContent %}{% endblock %}
                        </div>
                        
                        <div class="span3">
                            {% block pageSidebar %}
                                {% include "partials/page-sidebar.swig" %}
                            {% endblock %}
                        </div>
                    </div>
            
                    {% block pageFooter %}
                        {% include "partials/page-footer.swig" %}
                    {% endblock %}
            
                    {% include "partials/author.swig" %}
                </div>
            
                {% block js %}
                <script>
                      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
                    
                      ga('create', 'UA-40515203-1', 'h4md1.fr');
                      ga('send', 'pageview');

                </script>
                
                <script type="text/javascript">
                    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                    var disqus_shortname = 'h4md1'; // required: replace example with your forum shortname
                    
                    /* * * DON'T EDIT BELOW THIS LINE * * */
                    (function () {
                    var s = document.createElement('script'); s.async = true;
                    s.type = 'text/javascript';
                    s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
                    (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
                    }());
                </script>
                {% endblock %}
            {% endblock %}
    </body>
</html>
