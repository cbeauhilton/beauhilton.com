# fix MIME Types to unbreak RSS feeds served by OpenBSD's httpd(8)


<time id="post-date">2022-11-13</time>


## RSS is life - but mine was broken


As of today (2022-11-13) my website lives on 
an OpenBSD server hosted at [vultr](https://vultr.com).

It's great, delightfully simple and low-resource,
robust, extendable, low-maintenance.

<p id="post-excerpt">
I've been getting back into RSS lately.
Turns out, my own RSS feed was broken.
</p>

I knew it was janky, but would have had no idea how broken it was
if not for the great folks
on the [datasette](https://datasette.io) Discord,
one of whom reached out to let me know my RSS link wasn't working.

This could not stand!

I've been meaning to fix my RSS feed anyway,
and now I had a good reason.


## fixing the file itself


I ended up tearing out my previous RSS solution, [`rssg`](https://romanzolotarev.com/rssg.html),
which is great but made some assumptions about my site's layout that aren't true.
I could have rewritten the script, 
but I'm lazy and a little strapped for time,
so I ended up replacing it with a hand-written RSS file.

(The RSS spec is easy enough to write by hand,
a little copy-paste and replace to add a new article - 
at some point I'll probably migrate to `hugo` or similar
and hand off the feed creation to a more flexible script,
but for now this works).

After I was certain the file format was fine and had the info I wanted,
I thought I was good.


## fixing the MIME Type


The kind soul who reached out to let me know the RSS feed was malformed 
reached out again to let me know he was now getting a MIME Type error.

My feedreader of choice, `newsboat`, 
is very forgiving of what it accepts, 
and didn't throw any errors when I tested it.
`FreshRSS`, on the other hand, is more strict, 
and the feed would fail even though the file itself was fine.

I looked into it, and found out that `httpd(8)`
only supports a handful of MIME Types by default,
so my server was sending out `application/octet-stream`
(a generic type) instead of the `rss+xml` type,
and it was confusing the feedreader.


## add all the types


Thank goodness, and as usual in OpenBSD, 
there's a very easy way to add all the relevant types one might need.

OpenBSD has an internal MIME declaration file you can link to from within `httpd.conf(5)`.

Here's the relevant bit, just chuck this on the end of the conf file:

```shell

types {
    include "/usr/share/misc/mime.types"
}

```

And reload `httpd(8)`.


## great success


Much thanks to my new friend on the Datasette Discord, 
the fantastic OpenBSD documentation,
as always,
and [lambda.cx](https://blog.lambda.cx/posts/openbsd-httpd-mime-types/)
for writing a post almost identical to mine 
(except that his had nothing to do with RSS - 
he was fixing PDF serving, 
which should now be fixed on my site as well).

