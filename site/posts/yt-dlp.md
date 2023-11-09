# yt-dlp Nix config

<time id="post-date">2023-10-18</time>

<p id="post-excerpt">
yt-dlp is an incredibly useful and customizable tool 
for downloading online videos
from YouTube and elsewhere.
Here's my setup 
(declared in Nix, but easily generalizable).</p>

If you just want the config, scroll to the bottom
(ignore the ramblings under the asterisk).

## yt-dlp

youtube-dl was, for years, the de facto standard 
for retrieving videos from YouTube 
(and other websites - e.g. Vimeo) for local use, 
but eventually it got old and crufty.

[yt-dlp](https://github.com/yt-dlp/yt-dlp) is a fork of youtube-dl 
that is more actively maintained,
with many upgrades.

It has sane defaults, but I have a few things I change to make it suit my uses.

I mostly use it to download instructional videos so they're easier to use:
no getting interrupted by ads 
whenever I scrub back and forth to find or rewatch a particular section,
and I can proceed without an internet connection.

It's also a boon for archival of any video you use frequently for any reason,
e.g. in an educational setting - 
if you have a lesson plan that depends on a clip from an online video,
it is wise to have your own copy of the video,
both to reduce dependence on finicky wifi
and to make it more likely you'll have the vid
for every time you repeat this lesson in the future.
Videos go offline for strange, sundry, and unpredictable reasons.

(I maintain that YouTube and related video sites, 
taken as a whole,
are the single greatest source of procedural knowledge 
ever created by humankind\* -
the problems that threaten their utility are,
first, curation, and second, durability)


## configuring

yt-dlp accepts a config file, 
usually placed at `~/.config/yt-dlp/config`,
so you don't have to have a long string of flags and options 
in your shell command to yt-dlp
(you can override your config file with shell options, 
so it's reasonable to set your defaults to your most common use 
and not worry about messing up some divergent situation that may come up).

For example, 
to download the whole 
[JohnWatsonRooney YouTube channel](https://www.youtube.com/c/JohnWatsonRooney), 
all I had do was:

```sh
cd youtube-downloads/JohnWatsonRooney
yt-dlp "https://www.youtube.com/c/JohnWatsonRooney"
```

And it did something like this:

![yt-dlp downloading example](/images/yt-dlp-downloading-example.png)

Resulting in:

![yt-dlp filename example](/images/yt-dlp-filename-example.jpg)

In the second screenshot you can see that some files are still in process -
when all the parts are downloaded,
yt-dlp smushes them into an mkv container,
so the videos/thumbnails/subtitle files are clean and accessible to most video players.

## config

Here's my config file, with some annotation.

I'm using Nix with Home Manager,
but you can translate this into the usual yt-dlp config file syntax with ease.

One of the great things about Nix 
is that it lets me group installation and configuration 
for programs that make sense together -
here, I want to use aria2 as the downloader,
so I declare the aria2 options to pass to yt-dlp,
and also make sure aria2 is installed 
(it's ok if you installed aria2 in another part of your setup - 
if a program is declared for installation in multiple places,
Nix is smart enough to install it only once,
so it's often wise to err on the side of bundling).

If I take this config to any other machine with Nix installed,
I'll get the whole setup including dependencies.
This example is very simple, just adding another program,
but the principle scales to arbitrarily complex setups.

```nix
{
  programs.yt-dlp = {
    enable = true;
    settings = {
      embed-chapters = true; # embed all the things
      embed-metadata = true;
      embed-thumbnail = true;
      convert-thumbnail = "jpg"; 
      # so every file manager can show the thumbnail - webp support is not quite universal
      embed-subs = true;
      sub-langs = "all"; 
      # subtitle files are very small, 
      # and sometimes language names are declared badly, 
      # so worth it to grab them all
      downloader = "aria2c";
      downloader-args = "aria2c:'-c -x16 -s16 -k2M'"; 
      # -c is resume if interrupted ("continue"), 
      # -x is max connections to a server, 
      # -s is number of connections used for download of a specific file, 
      # -k is size of chunks
      download-archive = "yt-dlp-archive.txt"; 
      # writes a file to the current directory specifying which files have already been downloaded - 
      # nice for updating your collection of a channel's videos 
      # (just run the download command again and it will grab only what you're missing)
      restrict-filenames = true; # disallow spaces, weird characters, etc.
      output = "%(upload_date>%Y-%m-%d)s--%(uploader)s--%(title)s--%(id)s.%(ext)s"; 
      # I like to be able to sort by date 
      # and have enough info in the filename 
      # so I don't need to open it to find out what it is, 
      # so I include the:
      # - ISO 8601-style date
      # - uploader's name
      # - title of the video
      # - video ID (for easy copy pasta if I ever want to find it online, 
      # e.g. to see the comment section or show notes.)
    };
  };
  programs.aria2 = {
    enable = true;
  };
}
```

## side note

\* Contrary to popular belief, 
things that go online do *not* stay online forever:
[digital obsolescence](https://en.wikipedia.org/wiki/Digital_obsolescence) is real, 
and is [probably going to get worse](https://blog.archive.org/2023/03/25/the-fight-continues/) 
before it gets better ("?better"). 
This section is under an asterisk and at the end because it is a side thought, 
just an idea that tools like yt-dlp 
may have import that goes beyond helping me write web scrapers,
build saunas, etc. -
maybe they have the primitives to help build a 
videographic Whole Earth Catalog for the ages.
I don't think everything is going to explode any time soon,
but wouldn't it be interesting to have a digital archive with videos,
rather than just text, of how to do the basic things (and some not-so-basic things)
that make life possible and enjoyable? 
Some kind of all-in-one system with redundant storage 
and a power-supply (hand crank? solar?),
durable screen and speakers,
to help you bootstrap the physical needs of a society?
I'm sure the raw content is out there.
