<!-- references -->

<!-- markdownlint-disable link-image-reference-definitions -->
{% for type in site.data.references %}
  {% for reference in type[1] %}
    {% assign key = reference[0] %}
    {% assign entry = reference[1] %}
[{{ entry.inline }}]: {{site.baseurl }}{% link references.md %}#{{ key }}
  {% endfor %}
{% endfor %}
