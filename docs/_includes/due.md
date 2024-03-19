{% assign assignments = site.collections
    | where: 'label', 'assignments' | first %}
{% assign lessons = site.collections
    | where: 'label', 'lessons' | first %}

{% for lesson in site.data.lessons %}
  {%- assign path = lesson | prepend: '/'
      | prepend: lessons.relative_directory -%}
  {%- if path == page.relative_path -%}
    {%- assign number = forloop.index -%}
    {%- assign due = '' | split: '' -%}
    {%- for assignment in assignments.docs -%}
      {%- if assignment.due == number or assignment.due contains number -%}
        {%- assign due = due | push: assignment -%}
      {%- endif -%}
    {%- endfor -%}
    {%- break -%}
  {%- endif -%}
{% endfor %}

{% if 0 < due.size %}

### Due

As a reminder, the following {% if 1 == due.size %}is{% else %}are{% endif %}
due this lesson:

{% for assignment in due %}
  {%- assign type = assignment.type | default: assignment.layout -%}
  {%- if site.data.assignments[type].label -%}
    {%- assign type = site.data.assignments[type].label -%}
  {%- else -%}
    {%- assign type = type | capitalize -%}
  {%- endif -%}
- [{{ type }}: {{ assignment.title }}]({{ site.baseurl }}{{ assignment.url }})
{% endfor %}

{% endif %}
