# Command-line interfaces for self-hosted music

<time id="post-date">2023-09-28</time>

<p id="post-excerpt">
Self-hosting a music server is great.
Listening to the tunes via the command line is the way.
</p>

## Subsonic-compatible server backbone

I have Navidrome installed (via Docker on NixOS).
It's very nice.

With a reverse proxy, tailscale, and LetsEncrypt set up,
I can access it via any Subsonic-compatible music player at
<https://music.beauslab.casa> 
(this URL is available only on my tailnet, so it will 404 for everyone else).


## Desktop GUI interfaces

Sublime-music is pretty good.
I also find myself using the Navidrome web UI pretty often.

(On mobile, [Symfonium](https://symfonium.app/) (paid) or [SubStreamer](https://substreamerapp.com/) on Android 
and [play:Sub](http://michaelsapps.dk/playsubapp/) (paid) or [SubStreamer](https://substreamerapp.com/) (free) on iOS are my go-tos, 
though there are many [others](http://www.subsonic.org/pages/apps.jsp))

## CLI interfaces: contenders (STMP, jellycli, sksonic)

If I'm in programming mode, 
I prefer command-line interfaces, 
particularly if they let me use keyboard muscle-memory (i.e. vi bindings).

As such, I tried a few CLI front-ends to access and play my Navidrome-served tunes.

I'm sure there are others.

[STMP](https://github.com/wildeyedskies/stmp/tree/main) 
is clean and works well, but doesn't have vi bindings yet. 

[jellycli](https://github.com/tryffel/jellycli/tree/master) is the most polished, 
and uses vi bindings, 
but even so the in-app nav is finicky and doesn't quite fit my brain
(though that might be mostly due to conflicts with other terminal keybindings I have set up).

[sksonic](https://gitlab.com/yvelon/sksonic) is a suckless-style implementation in C, e.g. edit config.h and recompile.
It works, but isn't polished enough for daily usage 
(though I don't expect it to be - the author states it's a personal project, 
and I think they're doing a great job, so will keep an eye on it).
Partial vi-key support, could pretty easily be added given the suckless style.


## CLI interfaces: the one I picked (ncmpcpp with mopidy backend)

After these, I found myself wishing that I could use [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp) and hook it up to my Subsonic back end.

And then I realized: 
hey, this is a Linux TUI,
and ncmpcpp is just a front-end for [mpd](https://www.musicpd.org/),
of course you can switch out mpd for something that's Subsonic-aware. 

ncmpcpp is beautiful, polished, fast, with great vi-key support, and I've been using it for years for local music playback.

[mopidy](https://mopidy.com/) is a fairly drop-in mpd replacement that is pluggable,
with a number of awesome [extensions](https://mopidy.com/ext/).

I should have looked here first. C'est la vie.

I perused a few blog posts to get a sense of what to do:
- [fsylum's post](https://fsylum.net/blog/setting-up-ncmpcpp-mopidy-spotify-arch-linux/)
- [Deepjyoti Barman's post](https://blog.deepjyoti30.dev/using-spotify-with-ncmpcpp-mopidy-linux)
- [Digital Neanderthals' post](https://www.digitalneanderthal.com/post/ncmpcpp/) (what a great online moniker, well done - his physical setup is also a delight, sheer cyberdeck practicality)

It's pretty easy.

The rad thing is that you can get a unified frontend for all your sources,
e.g. Subsonic, Spotify, local files, YouTube, SoundCloud, etc.,
just install a plugin and add a config section and you're off to the races,
never having to leave the terminal.


> Source selection (could have many more items here).

![Source selection](/images/ncmpcpp-mopidy-selector.png)


> Artist selection.

![Preview](/images/ncmpcpp-mopidy-full.png)


> Track view.

![Track view](/images/ncmpcpp-mopidy-tracks.png)


## Set up

### Install the things

My main laptop still runs Arch (btw). 
If I ever switch to NixOS on this machine, 
or add this setup to the NixOS server,
I'll probably make a new post with the Nix way to do this.
I bet it's hardly different, other than the `.nix` files.

e.g. `paru -S ncmpcpp mopidy mopidy-subidy mopidy-mpd`

Also uninstall and stop mpd, if you're using it.

### Config files

(most of the what's in the files below is unnecessary for this post, 
but I've never been mad that someone posted their whole config)

(also note that the mopidy config file doesn't allow # comments, 
I just used them for ease of reading with syntax highlighting,
will have to delete prior to actually using)

`~/.config/ncmpcpp/config` 

```sh
ncmpcpp_directory = ~/.config/ncmpcpp
lyrics_directory = ~/.config/lyrics

progressbar_look = ->
display_volume_level = no

autocenter_mode = yes
message_delay_time = 1

playlist_display_mode = columns
playlist_editor_display_mode = columns
browser_display_mode = columns

media_library_primary_tag = album_artist
media_library_albums_split_by_date = no

ignore_leading_the = yes
ignore_diacritics = yes
external_editor = vim
use_console_editor = yes
```

`~/.config/mopidy/mopidy.conf`

```sh
[core]
cache_dir = $XDG_CACHE_DIR/mopidy
config_dir = $XDG_CONFIG_DIR/mopidy
data_dir = $XDG_DATA_DIR/mopidy
max_tracklist_length = 10000
restore_state = true

[file] # might switch out for mopidy-local at some point, adds search support via sqlite metadata archive
enabled = true
media_dirs = 
  ~/media/tunes
excluded_file_extensions = 
 .directory
 .html
 .jpeg
 .jpg
 .log
 .nfo
 .pdf
 .png
 .txt
 .zip
show_dotfiles = false
follow_symlinks = false
metadata_timeout = 1000

[m3u]
playlists_dir = $XDG_CONFIG_DIR/mopidy/playlists

[mpd]
enabled = true
hostname = 127.0.0.1
port = 6600 # defaults ftw - no change to ncmpcpp config needed if defaults are kept
max_connections = 20
connection_timeout = 60

[subidy]
enabled = true
url = https://music.beauslab.casa
username = admin
password = admin # behind a tailnet anyway, come at me bro
api_version = 1.16
```

## Future goals

- snapcast for whole-house audio ([Reddit post](https://www.reddit.com/r/selfhosted/comments/icjmiq/a_music_server_with_a_tli_client/) with some good tips)
