---
layout: post
title: Syllabus
---

> Learning is not compulsory; it's voluntary. Improvement is not compulsory;
> it's voluntary. But to survive, we must learn. ~&nbsp;W. Edwards Deming
> ([Voehl 1995])

- Table of Contents
{:toc}

A syllabus can take many forms. In this example, the syllabus contains
"boilerplate" information, which is typically taken from the course catalog
(e.g., the course description and prerequisites), and course policies set by
the instructor. A detailed list of topics may be found on the [schedule]({{
site.baseurl }}{% link schedule.md %}).

## Instructor

| Name    | {{ site.author }} |
| Office  | |
| Phone   | |
| Email   | |
| Website | |

## Course Description

{{ site.data.course.description }}

### Prerequisites

{% for prerequisite in site.data.course.prerequisites %}
- {{ prerequisite }}
{%- endfor %}

### Course Outcomes

{% include objectives.md %}

## Policies

Add additional sections, paragraphs, etc. as needed.

<!-- references -->
{% include references.md %}
