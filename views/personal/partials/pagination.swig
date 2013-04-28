{% if pagination %}
    <div class="pagination pagination-centered">
    <ul>
        {% if pagination.prevUrl %}
            <li class="previous">
                <a rel="prev" href="{{pagination.prevUrl}}">
                    {{pagination.labelPrev|raw}}
                </a>
            </li>
        {% endif %}

        {# TODO: figure out why the number of pages seems to increase after reloading in dev mode #}
        {% for page in pagination.navigation %}
            {% if page.isCurrentPage %}
                <li class="active"><span>{{page.page}}</span></li>
            {% else %}
                <li><a href="{{page.url}}">{{page.page}}</a></li>
            {% endif %}
        {% endfor %}

        {% if pagination.nextUrl %}
            <li class="next"><a rel="next" class="next" href="{{pagination.nextUrl}}">
                {{pagination.labelNext|raw}}
            </a></li>
        {% endif %}
    </ul>
    </div>
{% endif %}
