---
layout: default
title: Sitemap
permalink: /sitemap
---
<!-- https://jekyllrb.com/docs/posts/#displaying-an-index-of-posts -->
<!-- rumdl-disable MD033 -->

# Sitemap

**Pages**
<ul>
  {% for page in site.pages %}
    <li>
      <a href="{{ page.url }}">{{ page.title }}</a>
    </li>
  {% endfor %}
</ul>

**Posts**
<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
