# Colophon

This site is hosted on an OpenBSD server on [vultr](https://vultr.com),
built using plain text files processed by [soupault](https://soupault.app)
and [rsync'd](https://en.wikipedia.org/wiki/Rsync) to the server as part of a pre-commit hook.

The source files are available on [my git server](https://git.beauhilton.com/site/)
and [GitHub](https://github.com/cbeauhilton/beauhilton.com).

I also use [caretaker](https://github.com/grego/caretaker) 
during development to auto-rebuild as I edit the source files.

I used to specify fonts, e.g. one of my favorites, [IBM Plex](https://www.ibm.com/plex/),
but in an effort to keep things light and tidy,
I now just use system fonts.

<https://talks.beauhilton.com> and 
<https://notes.beauhilton.com> 
are not part of the website proper,
but are rather built using GitHub pages.

## Workflow

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
a caretaker instance for auto-rebuild, 
a server for preview, 
and a browser pointing to the server.

At that point I will usually throw the terminals 
running the server and `caretaker` to another desktop 
to achieve a clean editing environment.

When it's ready to go live,
I use an alias called `glazy`: `git add . && git commit -m "update" && git push`.
This will trigger the pre-commit hook, 
which rebuilds the site again and activates rsync,
before pushing the source files to GitHub and my git server.
