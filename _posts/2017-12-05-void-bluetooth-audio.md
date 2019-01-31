---
layout: post
title:  "Setting up bluetooth audio in Void Linux and ALSA"
image: ''
date:   2017-12-05 00:00:00
tags:
- audio
- bluetooth
- alsa
- void
- linux
description: 'Highlights on how to configure void linux to use bluetooth audio'
categories:
- Void Linux
---

I have a great little sub $20 bluetooth headset that I've been too lazy to get working on my laptop. I run
[Void Linux](https://www.voidlinux.eu) because for me systemd creates more headaches than it solves and I prefer minimalism for
a machine beholden to a battery. Similarly I consider PulseAudioto have an unacceptable level of overhead for what it brings to
the table. So my goal is to get my headphones working on my laptop with these constraints.

Unfortunately the [Bluetooh page of the Void Wiki][void-wiki] is less than useless. I should probably go back and add some stuff
for them one of these days. Fortunately the [Bluetooth page of the Arch Wiki][arch] is more helpful, but not 100% precise.

You will need to install Bluez with `# xpbs-install -Sy bluez` and add yourself to the `bluetooth` group with the command
`# useradd -G bluetooth <username>`. You might want to log out and back in at this point. This way you can make sure your
permissions took.

Set up the daemon to start when you start your machine with `# ln -s /etc/sv/bluetoothd /var/service/`. Now you can fire up the
`$ bluetoothctl` command to manage your devices. This drops you at an octothorp prompt, regardless of whether you are root at
this point. From here you can fire up your bluetooth infrastructure as follows:
```
# power on
# agent on
# default-agent
# scan on
```

At this point, if you set your headphones to pair, you should see a message like `[NEW] Device XX:XX:XX:XX:XX:XX Jogger`.
Now pair the device with `# pair XX:XX:XX:XX:XX:XX`. The Arch docs indicate that you can connect with
`# connect XX:XX:XX:XX:XX:XX` at this point. That didn't work for me, I had to `# trust XX:XX:XX:XX:XX:XX` first. Anyhow, once
you have connected to your device then you can bail from `blootoothctl`.
```
# scan off
# exit
```

It also turns out that bluetooth is powered off by default. If you want it powered up by default you'll want to make sure you
have the following setting in `/etc/bluetooth/main.conf`:
```
[Policy]
AutoEnable=true
```

Now things get tricky. Bluez has dropped support for ALSA in favor of PulseAudio qq. Fortunately there is at least one
alternative in the form of the [Bluetooth Audio ALSA Backend][bluealsa]. Void doesn't have a package for this, but it's easy
enough to compile, and the list of dependencies is actually accurate (remember you need the -dev packages). Once you have built
and installed bluealsa, then you will need to make a daemon for it. Simply put the following in `/etc/sv/bluealsa/run`
```
#!/bin/sh
exec /bin/env LIBASOUND_THREAD_SAFE=0 /bin/bluealsa
```
and then make it executeable with `# chmod a+x /etc/bluealsa/run` and start it up with `# ln -s /etc/sv/bluealsa /var/service/`.

Now you will want to modify your `~/.asoundrc`. Here is mine:
```
defaults.bluealsa.interface "hci0"
defaults.bluealsa.device "XX:XX:XX:XX:XX:XX"
defaults.bluealsa.profile "a2dp"
defaults.bluealsa.delay 10000

#pcm.!default {
#    type plug
#    slave.pcm {
#        interface "hci0"
#        type bluealsa
#        device "XX:XX:XX:XX:XX:XX"
#        profile "a2dp"
#        delay 10000
#    }
#}
#pcm.!default {
#  type bluealsa
#  interface "hci0"
#  device "XX:XX:XX:XX:XX:XX"
#  profile "a2dp"
#  delay 10000
#}
#pcm.!default {
#type plug
#slave.pcm {
#        @func getenv
#        vars [ ALSAPCM ]
#        default "hw:0"
#    }
#}
```
You can find more info at [asoundrc docs][asoundrc]. For mine, the first section lets you test with
`$ aplay -D bluealsa file.wav` while the second and third sections are ways of setting your bluetooth to default. The fourth
section allows you to do `$ env ALSAPCM=bluealsa aplay file.wav`. You can bring up a mixer with `$ alsamixer -D bluealsa` but
it's meh me since volume control is built in to my headphones.

My main issue is that audio [doesn't work in Firefox][bluealsa-firefox], and it seems that Netflix has stopped working in
Chromium. If you wish to try out audio in Chrome you can use the command line parameter `--alsa-output-device=bluealsa`.

[asoundrc]: http://www.alsa-project.org/main/index.php/Asoundrc
[arch]: https://wiki.archlinux.org/index.php/Bluetooth_headset#Configuration_via_CLI
[bluealsa]: https://github.com/Arkq/bluez-alsa
[void-wiki]: https://wiki.voidlinux.eu/Bluetooth
[bluealsa-firefox]: https://github.com/Arkq/bluez-alsa/issues/12