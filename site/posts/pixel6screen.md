# Pixel 6 DIY screen replacement, with fingerprint reader calibration using Linux

<time id="post-date">2023-09-19</time>

<p id="post-excerpt">
The internet, up to now, says you need Windows or MacOS to calibrate the Pixel's fingerprint reader after installing a new screen and digitizer.
The internet, up to now, was wrong.
</p>

## Physical install

My wife's Pixel 6's screen stopped working.
Phone seemed to be ok otherwise.

We looked at the cost of replacing the phone vs repairing the screen.

A similarly capable phone would cost quite a bit more than the replacement screen kit, 
which was ~$130 from [iFixit](https://www.ifixit.com/products/google-pixel-6-screen-genuine).

So we bought the replacement screen, 
watched a few videos on YouTube,
and were off to the races.

The tear-down and physical installation were easy.
Kudos to Google for making the Pixels easy to work on.
I won't give much detail here: just use the videos, 
whichever ones have a bunch of views.

I did waste the included screen adhesive on the first go-around,
because I didn't realize that the broken screen I removed had been separated from its frame
(so the old frame was still installed and I installed the adhesive to the its top,
rather than in the phone casing where it belongs,
and found out when the phone wouldn't click back together with the new screen). 
It was about $10, including shipping, for a second adhesive (also iFixit). Fit like a glove.

Total $140, and Verizon sent us a free new Pixel 7 anyway (long story), 
so now my wife has the 7 
and I upgraded from my old Pixel 2XL to this refurb'd 6. 
Dang, what an upgrade. 
Even though the Pixel 6 is widely considered the dud of the group,
I'm loving it.

## Fingerprint reader calibration is needed

After it was all installed and working well,
the next hurdle was recalibrating the fingerprint reader.
The fingerprint reader is part of the new screen, and needs calibrated, 
or it will not even attempt to work (seems more an "activation" than a "calibration," no?).

The website Google provides for calibration is <https://pixelrepair.withgoogle.com/udfps>.
If you look around the internet for troubleshooting related to this tool,
you'll see a number of old posts recounting various problems,
most of which seem to have been ironed out by this writing.

However, the one problem I couldn't find a fix or happy update for was how to use that website
if you're not running Windows or MacOS.

[This Redditor couldn't get it working on Linux or Windows, bad luck?](https://www.reddit.com/r/GooglePixel/comments/xq82ri/pixel_6_fingerprint_calibration/).

[Anon is very angry at Google for not supporting Linux for the calibration (ctrl-F "linux" to find)](https://issuetracker.google.com/issues/217589152?pli=1).

We no longer have anything but Linux/OpenBSD systems in the house 
(while I love FOSS and feel glee in this,
it is not entirely on purpose, and I don't hate Windows or MacOS - 
my wife's MBP met an early demise at the thrown milk cup of a boisterous toddler, 
or I would have tried that machine first 
to avoid the possible headache of ironing out a solution for Linux for a [hopefully] one-time computing event.).

The udfps website was finding my phone, but refusing to go further.
I was in fastboot.
Browser didn't matter (tried OG google-chrome-stable, vivaldi-stable, firefox).
USB-A vs USB-C computer-side connection didn't matter (some folks mentioned needing USB-A, so I tried).
Activating Android developer mode didn't help,
and activating USB debugging within the developer options didn't either.

I saw some posts talking about installing USB drivers to get udfps to work for Windows machines, 
so decided to poke around and see if maybe it was a driver issue on Linux as well.

It (probably) was.

## Android build tools to the rescue

On Arch Linux 
(these tools are widely available, 
distro doesn't matter, 
this is just what I used):

```shell
# enable multilib - see link below
paru # make sure things are up to date generally
paru -S android-tools android-sdk-build-tools # includes adb and other goodies
reboot
```

Re multilib - not sure if this is strictly needed - 
see <https://wiki.archlinux.org/title/android#Android_Emulator>.

After grabbing the Android build tools listed above and rebooting,
the website found my phone and ran the calibration software without a hitch.
The website didn't seem to work prior to rebooting,
and I'm a lazy cretin/wizened ol' wannabe sysadmin,
so fancy a reboot to fix all of life's woes.

The phone does need at least one reboot 
to activate the calibration and enable the fingerprint reader,
but the calibration software tells you that, no secret magic here.

I don't recall if I used vivaldi-stable or google-chrome-stable to run udfps, 
but I think it was the prior 
(I bet any Chromium-based browser would work, 
provided the right system tools are in place).

I also can't remember if I used USB-A to USB-C or dual-sided USB-C, 
but I think it was the dual USB-C. 

I do think developer mode and USB debugging active on the phone are required, 
but I'm not completely certain.

I did this all on a Thinkpad T14s.

In any case, fingerprint unlock is a go!

Almost too easy.

## Manual clean up - what, you think this is NixOS?

You probably won't need these tools again,
at least not for a long while, so:

```shell
paru -R android-tools android-sdk-build-tools # about 156MiB, not much, but it's the principle of the thing
sudo pacman -R $(comm -12 <(pacman -Qq | sort) <(pacman -Slq multilib | sort)) # undo the multilib stuff
sudo sed -i 's/\[multilib\]/\#\[multilib\]/' /etc/pacman.conf # undo more of the multilib stuff
paru # finish undoing the multilib stuff
```

## Next steps
### ? 🦒 ?

idk, maybe.
