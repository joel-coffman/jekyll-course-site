---
layout: page
---

## References

{% for type in site.data.references %}

### {{ type[0] | capitalize }}

  {% for reference in type[1] %}
    {% assign key = reference[0] %}
    {% assign entry = reference[1] %}
{: id="{{ key }}"} {{ entry.inline }}
: {{ entry.citation }}
  {% endfor %}
{% endfor %}

{% include references.md %}
