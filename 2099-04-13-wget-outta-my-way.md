---
layout: post
title: "Wget Outta My Way, diigo"
toc: true
image: https://source.unsplash.com/OfMq2hIbWMQ
tags:
  - wget
  - web
  - archiving
  - productivity
  - Python
  - Markdown
  - "academic writing"
---

## read-later

I've been thinking a lot about sustainable, preferably third-party-service-free ways to keep track of and use things I've read online.

[wget manual online](https://www.gnu.org/software/wget/manual/wget.html#Download-Options)

`wget -E -k -p https://www.nateliason.com/blog/smart-notes`

- `-E` - adds the `.html` extension to the filename
- `-p` - page requisites (downloads all resources necessary to properly render the page, e.g. images)
- `-nd` - no directories
- `-nH` - no host directories
- `-H` - spans hosts when recursively retrieving
- `-K` - "When converting a file, back up the original version with a ‘.orig’ suffix."
- `-k` - convert non-relative links
- `-P` - specify directory for download, creates if it doesn't exist. Append desired directory name directly to the command, e.g. a directory called "web" would be specified as `-Pweb`

"Actually, to download a single page and all its requisites (even if they exist on separate websites), and make sure the lot displays properly locally, this author likes to use a few options in addition to ‘-p’:"

`wget -E -H -k -K -p -Pweb https://www.nateliason.com/blog/smart-notes`
