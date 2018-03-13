# Admir Trakic Home Page

[![CircleCI](https://circleci.com/gh/atrakic/atrakic.github.io/tree/master.svg?style=svg)](https://circleci.com/gh/atrakic/atrakic.github.io/tree/master)
[![CircleCI](https://circleci.com/gh/atrakic/atrakic.github.io/tree/develop.svg?style=svg)](https://circleci.com/gh/atrakic/atrakic.github.io/tree/develop)

Simple home page where I could put my writing, CI/CD playground, etc.
This is the result.

# Localhost quick start

1. Git clone this repo.
1. Make sure you have [Jekyll](https://jekyllrb.com/docs/installation/) installed.
1. Just the first time: `bundle install`.
1. To build the site and serve it: `bundle exec jekyll serve`.
1. To test: `http://localhost:4000`.

See the [Jekyll](http://jekyllrb.com/) and [GitHub Pages](https://pages.github.com/)
documentation for more info.


# Docker quick start

As an alternative to installing Ruby and Jekyll, if you're a user of
[Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/), which builds all dependencies setup for you.

DIY build on Linux:

1. `git clone`this repo
2. `docker-compose up --build`
3. Go to `http://localhost:4000`to test


or without building, just push my public image from docker: 

1. `make run` which would pull latest docker prebuild image. 

# Technologies

1. Built with [Jekyll](http://jekyllrb.com/). This website is completely static and I use basic HTML or Markdown for everything.
1. Hosted on [GitHub Pages](https://pages.github.com/).
   I'm using the [GitHub Pages Gem](https://help.github.com/articles/using-jekyll-with-pages/)
   and only Jekyll plugins that are [available on GitHub Pages](https://help.github.com/articles/repository-metadata-on-github-pages/).
1. CI/CD [CircleCi] (https://circleci.com/gh/atrakic/atrakic.github.io)
1. Image registry [Docker Hub](https://hub.docker.com/r/xomodo/atrakic.github.io/) 


# License

This code is released under the MIT License. See LICENSE.txt.
