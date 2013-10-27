<div id="header">

    <div class="clearfix">
        <h1 class="pull-left">
            h4md1.fr 
            <span class="lead muted hidden-phone">by killerwolf</span>
        </h1>
        
        <ul id="social-icon" class="nav nav-pills pull-right">
            <li>
                <a href="https://twitter.com/killerwolf">
                    <i class="icon-twitter icon-2x"></i>
                    <span class="hidden-phone">Twitter<span>
                </a>
            </li>
            <li>
                <a href="http://fr.linkedin.com/in/hamdilaadhari/">
                    <i class="icon-linkedin icon-2x"></i>
                    <span class="hidden-phone">LinkedIn<span>
                </a>
            </li>
            <li>
                <a href="https://plus.google.com/116743009329723208522?rel=author">
                    <i class="icon-google-plus icon-2x"></i>
                    <span class="hidden-phone">Google+<span>
                </a>
            </li>
            <li>
                <a href="https://github.com/killerwolf">
                    <i class="icon-github icon-2x"></i>
                    <span class="hidden-phone">GitHub<span>
                </a>
            </li>
        </ul>
    </div>

    <div class="hidden-phone">
        <img width="100%" src="/img/personal/header-image.jpg" />
    </div>

    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <a href="#" class="brand brandtag">Menu</a>
                <a class="btn btn-navbar visible-phone" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
            
                <ul class="nav visible-tablet">
                    <li{% if page && page.slug == 'home' %} class="active"{% endif %}><a href="/">Home</a></li>
                    <li{% if page && page.slug == 'cv' %} class="active"{% endif %}><a href="/page/cv">CV</a></li>
                    <li{% if page && page.slug == 'about' %} class="active"{% endif %}><a href="/page/about">About</a></li>
                    <li{% if page && page.slug == 'contact' %} class="active"{% endif %}><a href="/page/contact">Contact</a></li>
                </ul>
                
                <div class="nav-collapse collapse text-center">
                    <ul class="nav">
                        <li{% if page && page.slug == 'home' %} class="active"{% endif %}><a href="/">Home</a></li>
                        <li{% if page && page.slug == 'cv' %} class="active"{% endif %}><a href="/page/cv">CV</a></li>
                        <li{% if page && page.slug == 'about' %} class="active"{% endif %}><a href="/page/about">About</a></li>
                        <li{% if page && page.slug == 'contact' %} class="active"{% endif %}><a href="/page/contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>