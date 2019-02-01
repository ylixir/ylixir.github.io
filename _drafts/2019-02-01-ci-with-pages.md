---
published: false
description: Setting up nix and travis with jekyll for more professionalism
tags:
  - jekyll
---
Github pages combined with jekyll is such a fantastic and easy way to professional looking web pages with zero effort. Unfortunately that effort comes with a cost. As you tweak and play with the look of your site, your readers are also seeing this.

And if you break something it can be a little challenging to figure out what went wrong.

The solution of course is a reproducible development environment and continuous integration (CI).
We will use nix for the first, and travis-ci for the second.