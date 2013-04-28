{% extends "layouts/default.swig" %}

{% block title %}Not Found - {{settings.siteName}}{% endblock %}

{% block pageBody %}
    <h2>404 Not Found</h2>

    <p>
    The URL <code>{{url}}</code> was not found on this server.
    </p>
{% endblock %}
