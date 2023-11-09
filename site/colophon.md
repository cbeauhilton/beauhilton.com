# Colophon

This site is hosted on an [OpenBSD](https://www.openbsd.org/) server 
on [vultr](https://vultr.com),
built using plain text files processed by [soupault](https://soupault.app)
and auto-[rsync'd](https://en.wikipedia.org/wiki/Rsync) to the server 
as part of a pre-commit hook.

The source files are available on [my git server](https://git.beauhilton.com/site/)
and [GitHub](https://github.com/cbeauhilton/beauhilton.com).

I also use [entr](https://eradman.com/entrproject/) (on Nix) 
or [caretaker](https://github.com/grego/caretaker) (on Arch) 
during development to auto-rebuild as I edit the source files.

Regarding the design,
the focus is on simplicity and a small footprint.
It's the kind thing to do,
for the user and the planet.
No Javascript, just static HTML. 
I used to specify fonts, 
e.g. one of my favorites, [IBM Plex](https://www.ibm.com/plex/),
but in an effort to keep things light and tidy,
I now just use system fonts.

<https://talks.beauhilton.com> and 
<https://notes.beauhilton.com> 
are not part of the website proper,
but are rather generated using GitHub Pages.
The talks are built using [slidev](https://sli.dev/),
which translates markdown files into beautiful web-first slide decks
(I now only use PowerPoint under great duress),
and the notes use [quartz](https://quartz.jzhao.xyz/),
which translates [Obsidian](https://obsidian.md/)-style markdown files 
(see a theme here?) 
into a website of interconnected notes
a la [Zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten).

## Nix Workflow

As of 2023-10-10 or so, 
I use a Nix-based workflow with flakes and [devenv.sh](https://devenv.sh/).
The basic steps are similar to what is included below in the Non-Nix section,
though more conveniently packaged and portable.

It's delightful.

I may write it up at some point, but for now, 
look at `flake.nix` in the source code.
One of the great things about Nix 
is that it's self-documenting and self-contained.

On my non-Nix laptop running Arch, I still use the workflow below,
though at some point I'll probably install Nix on Arch and unify my approach.


## Non-Nix Workflow (legacy)

The workflow is terminal-based
and pretty basic.

It amounts to:

```shell
cd src/site
./sh.sh
$EDITOR site/gulag_archipelago.md
```

`sh.sh` contains the following:

```shell
$TERMINAL -e caretaker &>/dev/null & disown
$TERMINAL -e python3 -m http.server --directory build &>/dev/null & disown
$TERMINAL -e $BROWSER http://localhost:8000 &>/dev/null & disown
```

This will open three new terminals running:
a caretaker instance for auto-rebuild 
(I recently activated caching in soupault, 
rebuilds are lightning quick), 
a web server for preview, 
and a browser pointing to the server.

At that point I will usually throw the terminals 
running the server and `caretaker` to another desktop 
to achieve a clean editing environment.

When it's ready to go live,
I use an alias called `glazy`: `git add . && git commit -m "update" && git push`.
This will trigger the pre-commit hook,
which rebuilds the site again
and activates rsync to send the built site to the web server,
before pushing the source files to
GitHub and my git server.
