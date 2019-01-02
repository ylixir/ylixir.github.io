---
layout: post
title:  "Getting fish play nicely with nixpkg"
image: ''
date:   2018-06-14 00:00:00
tags:
- nix
description: 'How to bring your nix packages up to date'
categories:
- Nix
---

I've been slacking on my Nix learning. I finally looked up how to update dev environments
(all environments actually) to minty fresh versions. Simply run the following commands:
```
$ sudo nix-channel --update
$ nix-env --u always
```

And that's it. Now you will have the newest versions of all your stuff next time you run
```
$ nix run -f shell.nix
```
