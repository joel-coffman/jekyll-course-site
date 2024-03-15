---
# vim: set formatoptions-=t:

layout: posts-by-tag
title: Schedule

list_title: Changes
tag: schedule

# holidays:
# - lesson: <number of lesson *preceding* the holiday>
#   name: <name of holiday (to appear in the schedule)>
holidays:
---

This schedule provides an overview of the lessons and assignments throughout
the term. See each lesson or assignment for details.

This page is essentially auto-generated using `_data/lessons.yaml` and
assignment metadata (specifically the due "date").

{% assign assignments = site.collections
    | where: 'label', 'assignments' | first %}
{% assign lessons = site.collections
    | where: 'label', 'lessons' | first %}

<!-- markdownlint-disable line-length table-column-count table-pipe-style -->

|    | Lesson | Assignment(s) |
| -: | :----- | :------------ |
{% for lesson in site.data.lessons %}
  {%- assign index = forloop.index -%}
  {%- assign due = '' | split: '' -%}
  {%- for assignment in assignments.docs -%}
    {%- if assignment.due == index or assignment.due contains index -%}
      {%- assign type = assignment.type | default: assignment.layout -%}
      {%- assign schedule = assignment.schedule
          | default: site.data.assignments[type].schedule -%}
      {%- if schedule -%}
        {%- assign due = due | push: assignment -%}
      {%- endif -%}
    {%- endif -%}
  {%- endfor -%}
  {%- assign path = lesson | prepend: '/'
      | prepend: lessons.relative_directory -%}
  {%- assign current = lessons.docs | where: 'path', path | first -%}
| {{ forloop.index }} | [{{ current.title | default: lesson }}]({{ site.baseurl }}{{ current.url | default: path }}) | {%- for assignment in due -%}[{{ assignment.title }}]({{ site.baseurl }}{{ assignment.url }}){%- endfor -%} |
  {%- assign holiday = page.holidays | where: 'lesson', index | first -%}
  {%- if holiday %}
| | *{{ holiday.name }}* | |
  {%- endif %}
{% endfor %}

<!-- markdownlint-enable line-length table-column-count table-pipe-style -->
