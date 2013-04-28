<article id="post-{{slug}}" class="post">
    <header>
        <h2>
            <a href="{{url}}" rel="bookmark">{{title}}</a>
        </h2>

        <time class="date published" datetime="{{date}}" pubdate>{{date|date("Y-m-d")}}</time>
         - 
        <a href="{{url}}#disqus_thread" rel="comment">{{date|date("Y-m-d")}}</a>
        
    </header>

    <div class="entry-content">
        {{html|raw}}
    </div>

    <footer class="ft meta clearfix">
        {% if tags.length %}
            <h5 class="pull-left">Tags:</h5>
            <ul class="tags pull-left">
                {% for tag in tags %}
                    <li><a href="{{tag|tagUrl}}" rel="tag">{{tag}}</a></li>
                {% endfor %}
            </ul>
        {% endif %}
    </footer>


</article>