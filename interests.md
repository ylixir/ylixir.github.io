---
title: Interests
permalink: /interests/
---

So I guess this page will more or less be a conglomeration of random links.

- [Dotfiles](#dotfiles)
- [Mechanical Keyboards](#mechanical-keyboards)
- [Nix](#nix)
- [Shell](#shell)

## Dotfiles
I would like a completely portable working environment. To be able to sit down in front of a new computer and replicate my workspace in minutes.

Originally this was a random collection of shell scripts and config files, but this didn't work out.
Every system required minor tweaks and the central repo never kept up to date.
Currenlty my plan of attack is to move everything into the terminal (`tmux`, `vim`, etc) and use `nix` to manage creating a consitent and idempotent environment.

### Resources
#### others dotfiles
- <https://github.com/najeeb-rifaat/nix-config>
- <https://github.com/ErnWong/dotfiles-nix>
- <https://github.com/igsha/dotfiles>
- <https://github.com/garbas/dotfiles>
- <https://nmattia.com/posts/2018-03-21-nix-reproducible-setup-linux-macos.html>
- <https://github.com/nmattia/homies>

#### Tmux
- <https://medium.freecodecamp.org/tmux-in-practice-series-of-posts-ae34f16cfab0>
- <https://hackernoon.com/tmux-in-practice-copy-text-from-remote-session-using-ssh-remote-tunnel-and-systemd-service-dd3c51bca1fa>
- <https://sunaku.github.io/tmux-yank-osc52.html>
- <https://blog.carbonfive.com/2017/08/17/copying-and-pasting-with-tmux-2-4/>
- <https://tmux-plugins.github.io/tmux-yank/>
- <https://github.com/tmux-plugins/tpm>
- <https://unix.stackexchange.com/questions/58763/copy-text-from-one-tmux-pane-to-another-using-vim>
- <https://blogs.technet.microsoft.com/jessicadeen/linux/tmux-2-6-copypaste-and-bind-tips-and-tricks/>
- <https://hk.saowen.com/a/6a3767031e349b8613eb87d76813e99ec0131e6b791943a0664f85a5b97c0e79>
- <https://github.com/NixOS/nixpkgs/blob/master/pkgs/misc/tmux-plugins/default.nix>
- <https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/tmux.nix>
- <https://github.com/LnL7/nix-darwin/blob/master/modules/programs/tmux.nix>
- <https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/darwin/reattach-to-user-namespace/default.nix>
## Mechanical Keyboards
I've built quite a few keyboards and quite enjoy the hobby. My favorite board to date is the first one I ever built: the "Let's split".
- [Plank bepo](http://www.keyboard-layout-editor.com/#/layouts/276d74f262b8c2edd5fc96f4d1492062)
- [usb-c microcontroller](https://www.reddit.com/r/olkb/comments/9ra2rk/qmk_proton_c_presales_16_usd_starting_now/)

## Nix
I see nix or something like it as the future. Able to replace apt, docker, and ansible with one fell swoop, this is worth learning.
- <https://matrix.ai/2018/03/24/developing-with-nix/>
- <https://gist.github.com/CMCDragonkai/de84aece83f8521d087416fa21e34df4>
- <https://ebzzry.io/en/nix/>

## Shell
Posix shell has always been an awkward fit for me. It would be cool to have a more general purpose shell language that could be easily embedded into all apps for a consistent user experience.

### Embedable languages
- <https://github.com/rust-unofficial/awesome-rust#scripting>
- <https://github.com/gluon-lang/gluon>
- <https://fascinatedbox.gitlab.io/lily-docs//index.html>
- <https://github.com/hengestone/lua-languages>