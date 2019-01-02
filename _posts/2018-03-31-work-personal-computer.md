---
layout: post
title:  "Sharing secrets: keeping work and personal cyberlife separately together"
image: ''
date:   2018-03-31 00:00:00
tags:
- firefox
- padlock
description: 'Highlights on how to set up a Mac to share work and personal accounts'
categories:
- Mac OS
---

So my daughter is into Roblox lately, and she's always wanting to use my machine so she can "stream".

Meanwhile, recently my employer allowed me to trade in this god awful 90 pound laptop for a Macbook
that is actually reasonably nice to work with.

In general I like to keep my work and personal life separated, but this Mac makes it really easy
to create encrypted volumes, and I'd already broke down a bit and created a separate Firefox profile.
Meanwhile, I've been eyeing nix and thinking about revamping my dotfiles...

So in order to do this, I wanted to make sure that since my work computer doesn't belong to me,
that if I put something on it that _does_ belong to me, that I have a reasonable guarantee that
it is inaccessible to anyone but me. I approached this basically how I would if I was stashing
all my secrets on a strangers computer. I want to make sure I'm the only one who can get to them.

I use [Padlock](https://www.padlock.io) for my personal secret manager. I install that right off,
since I can't get into hardly anything without it. Padlock has it's own encryption so I don't sweat
storing it's secrets on someone elses machine.

Step two using `Disk Utility` to create a case-sensitive and encrypted volume. Since I've got Padlock,
I just use it to store the password that is used to encrypt/decrypt the volume. Now I've got a place
to stash all my personal things, I can go about stashing things there.

It's very hard to get around without a we browser. Unfortunately, I had already configured my machine
[to have work and personal firefox profiles](https://developer.mozilla.org/en-US/Firefox/Multiple_profiles).
This turned out to be no problem. It was very [easy to move my personal profile to the encrypted drive](
https://wyeworks.com/blog/2018/1/15/automatically-managing-personal-and-work-git-configurations).

Once I had Firefox rolling, then I could set up git and github to seamlessly work with both my personal
and work accounts. This mainly consisted of making a new key (stored on the encrypted volume of course)
and [following a nice guide that the googles found]
(https://wyeworks.com/blog/2018/1/15/automatically-managing-personal-and-work-git-configurations).

Now I'm on to reboot my dotfiles with nix. Stay tuned to see how things work out...