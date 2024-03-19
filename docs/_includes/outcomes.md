Upon completion of this course, you will be able to do the following:

{% for outcome in site.data.course.outcomes %}
1. {% if outcome.first == nil -%}
   {{- outcome | strip -}}
   {%- else %}
   {% comment %}
     Rather obscene, but if the outcome isn't a string (i.e., it has a 'first'
     element), then treat it as a hash (i.e., dictionary) where the key is the
     first element and the value comprises the nested outcomes. This complexity
     can be eliminated if "nested" outcomes are forbidden.
   {% endcomment %}
   {{- outcome.first[0] | strip -}}
     {% for lower in outcome.first[1] %}
     1. {{ lower }}
     {% endfor %}
   {%- endif -%}
{%- endfor %}
