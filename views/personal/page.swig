{% extends "layouts/default.swig" %}

{% block title %}{{page.title}}{% endblock %}

{% block pageContent %}
    <section id="page-{{page.slug}}" class="page content{% if page.imported %} imported{% endif %}">
        {{page.html|raw}}
    </section>
{% endblock %}
