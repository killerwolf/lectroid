{% extends "layouts/default.swig" %}

{% block title %}Internal Server Error - {{settings.siteName}}{% endblock %}

{% block pageBody %}
    <h2>500 Internal Server Error</h2>

    <p>
    Well, shit. This wasn't supposed to happen.
    </p>
{% endblock %}
