---
layout: post
title:  "Getting fish play nicely with nixpkg"
image: ''
date:   2018-04-10 00:00:00
tags:
- fish
- nix
description: 'Strategies for using a non-posix shell without pain'
categories:
- Nix
---

Getting rolling with nix has a much steeper learning curve than I imagined. It seems one should treat it more like learning a full programming
language, rather than just a simple utility.

So progress is slow, but I have good successes. The one I'll talk about today isn't really nix related as much. Fish is a _really_ nice shell
to use, but has some serious pain points when trying integrate the thing with the rest of ones system. The reason for both of these is the
same: it ditches posix compliance. In practice that means that using the friendly interactive shell and writing scripts for it is a dream.
Also none of your environment like paths, etc work really, because they are configured through posix compliant shell scripts...

Of course you can setup paths oneself, and do all the other things, but it is a giant pain point, and it's difficult to do so in a cross
platform way. Which means that my shell configuration in my dotfiles is useless.

This time around I took a different tack. Instead of configuring fish to be the default shell, I just made bash the default shell. Next I
configured bash to `exec` fish when it's started interactively. This works fantastically and so far works in both manjaro and os x.