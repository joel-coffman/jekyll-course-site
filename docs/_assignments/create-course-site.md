---
layout: assignment
title: Course Website

due: 2
schedule: true  # include on the schedule page
type: assignment
---

- Table of Contents
{:toc}

Learning Management Systems (LMSs) traditionally have a reputation for poor
usability or limited feature set. As an alternative, a course website may be
published using GitHub Pages. In this case, the course website serves as a
centralized "landing page" with the syllabus, schedule, descriptions of
assignments, etc. A major benefit of this approach is that the course website
can embrace modern web principles, such as responsive design, which addresses
the aforementioned usability issues.

Deadline
: Lesson {{ page.due }}

Expected duration
: 1 hour

Submission
: [{{ site.data.course.lms }}]({{ site.baseurl }}/lms)

## Learning Objectives

- Create a course website that uses Jekyll
- Publish the course website using GitHub Pages

## Instructions

Use the following steps to create a course website based on this template:

1. Create a [GitHub](https://github.com/) account if you don't have one
   already: <https://github.com/join>
2. Initialize a Git repository for the course website. (You may also use an
   existing Git repository, but be mindful of overwriting existing files.)

   ~~~ shell
   git init course-website && cd course-website
   ~~~

3. Copy the contents of the [jekyll-course-site] repository:[^1]

   ~~~ shell
   wget https://github.com/joel-coffman/jekyll-course-site/archive/HEAD.tar.gz
   tar xfvz HEAD.tar.gz --strip-components=1 && rm HEAD.tar.gz
   ~~~

4. Commit the files from the template:

   ~~~ shell
   git commit --all
   ~~~

5. Update the site with course-specific information (course name, title,
   description, etc.). Don't forget to commit your changes!
6. Create a GitHub repository for the course website.
7. Push the changes from the local to the remote (GitHub) repository by
   following the instructions to "...or push an existing repository from the
   command line."
8. Configure GitHub Pages for your GitHub repository
   ([instructions][creating-your-site]).
9. (Optional) Add the [jekyll-course-site] repository as a remote to facilitate
   cherry-picking future changes.

[^1]: This step may also be performed manually by downloading a ZIP archive of
      the repository and copying all the files (including hidden files).

[jekyll-course-site]: https://github.com/joel-coffman/jekyll-course-site
[creating-your-site]: https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site#creating-your-site

## Submission

Create an archive of your Git repository (you can use "Code" button when
viewing your GitHub repository for this purpose) and submit that archive to [{{
site.data.course.lms }}]({{ site.baseurl }}/lms).

---
