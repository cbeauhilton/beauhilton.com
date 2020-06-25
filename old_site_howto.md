---
layout: post
title: "On the tools used to make this website"
toc: false
categories:
  - technical
tags:
  - jekyll
  - markdown
  - atom
  - hosting
  - static web
  - blog
  - technical
---

I'm psyched about this little website. This post is about the tools and resources I used to make it.

In summary, this is a _static website_ made with _Jekyll software_ using the code editor called _Atom_ to write posts in _Markdown language_. I also added a wishlist to the end, mostly to keep track of tools and tricks I may want to add.

## Static Web

[![The linked post has a nice overview of most of the static web services](https://www.digett.com/sites/default/files/images/static_site_0.png)](https://blog.zipboard.co/how-to-start-with-static-sites-807b8ddfecc)

Most of the internet we interact with on a day-to-day basis is "dynamic," meaning we request something from a web server (e.g. click on a Facebook post or search for something on Amazon), which then talks to a database to pull all the relevant information and fill in a template (e.g. post content + comments, or product page with images, ratings, ads, etc.). The "static" web is much more old school: ask for something and the server gives you something, no database and comparatively little processing. Whatever is on the server has to be pretty much prebuilt and ready to go. This process is much simpler, faster, and more secure. The basic protocols are old and well established, unlikely to change or break.  For most online writing, such as a blog, static is the way to go, especially if it is likely to be consumed over a mobile internet connection.

## Jekyll

[![Jekyll](https://jekyllrb.com/img/logo-2x.png)](https://jekyllrb.com/)

Jekyll is an open-source suite of open-source software for making static web pages.

The basic idea is create a workflow that starts with just writing, followed by a predefined file structure and styling format to store all your stuff and make it pretty, and finally automatically translate it all into something a web browser can use. Jekyll also integrates nicely with GitHub, [which will host the site for free](https://help.github.com/articles/about-github-pages-and-jekyll/). GitHub also makes my favorite text editor, [Atom](https://atom.io/). This leads to an integrated workflow: write in Atom → build in Jekyll+GitHub →  publish on GitHub.

I found out about Jekyll from the [Rebecca Stone](https://ysbecca.github.io/programming/2018/05/22/py-wsi.html), who is writing the wonderful [py-wsi package](https://github.com/ysbecca/py-wsi). (This package makes massive digital pathology images tractable for deep learning.) As I read through her blog, I found [this post on Jekyll and why she switched from WordPress](https://ysbecca.github.io/programming/2017/04/29/jekyll-migration.html). I read a few more posts like hers and was converted.

Some user-friendly Jekyll walkthroughs:

- [Programming Historian: complete Jekyll and GitHub pages walkthrough for non-programmers](https://programminghistorian.org/en/lessons/building-static-sites-with-jekyll-github-pages)
  - Assumes you know absolutely nothing, explains terminology and has copy-paste code plus instructions for Windows *and* Mac.
- [WebJeda: YouTube videos](https://www.youtube.com/watch?v=bwThn0rxv7M)
  - Modular and step-by-step. Sometimes it's nice to watch someone go through the process in real time.
- [University of Idaho Library: workshop, with blog posts and video](https://evanwill.github.io/go-go-ghpages/0-prep.html)
  - Comparable to Programming Historian, with the benefit of dual coverage in the blog and video. The video is from a workshop where they walked through the process in real time, from nothing to something in around an hour, and the students asked a lot of the same questions I had.

### Jekyll Themes

I stole the layout of this site from [vangeltzo.com](https://vangeltzo.com/index.html), whose beautiful design was Jekyll-ified (with permission!) by [TaylanTatli on GitHub](https://taylantatli.github.io/Halve/). I'm [not the only one](https://github.com/cbeauhilton/cbeauhilton.github.io/network/members) using this theme, [by](https://drivenbyentropy.github.io/) [any](https://ejieum.github.io/) [means](https://je553.github.io/).

Jekyll themes are [abundant online](http://jekyllthemes.org/), generally [easy to fork](https://taylantatli.github.io/Halve/halve-theme/) ("fork" means "copy for your own use without affecting the original"), and often [well commented](https://taylantatli.github.io/Halve/posts) so they are straightforward to customize.

### Why this theme?

I had two basic requirements for my theme. First, it had to be [pretty](http://www.leonardkoren.com/lkwh.html). Second, I wanted a responsive split screen. "Responsive" means it can adapt itself to look nice on any device from a phone to a huge desktop monitor. The split screen confines the content to an easily readable width on the right and gives consistent navigation on the left. The 50/50 split screen is a little extreme, but I think I like it this way. If I ever want to change it to something like 66/33, it is [quite  easy](https://github.com/TaylanTatli/Halve/issues/32).

I'll say more about specific choices, such as color, logo, and tagline in another post.

## Atom

[![Atom](https://avatars2.githubusercontent.com/u/1089146?s=200&v=4)](https://atom.io/)

You can write all of your code entirely within GitHub, which has its own text editor. The above tutorials use this approach to make it easy to start. There's nothing wrong with that.

A friend of mine, a [fellow CCLCM student](https://github.com/JaretK) who is a much more legit programmer than me, recommended Atom, and I fell in love with only minimal doses of digital [amortentia](http://harrypotter.wikia.com/wiki/Amortentia). It is ridiculously (almost dangerously) extensible, with community-supplied packages for an incredible breadth of programming languages and applications.

For the nerds, for example, it has full support for LaTeX and all the typesetting, figure-making, citation-porn, and mathy goodness you can handle. One of my favorite workflows is to write something in Markdown to get the basics down with minimal fuss in an easier language, and then use Pandoc to convert it to LaTeX, followed by any futzing with the LaTeX (if you like) before outputting to PDF. You can also (!) combine the languages rather seamlessly.

Here's a [post that details a full plain-text academic workflow with Atom](http://u.arizona.edu/~selisker/post/workflow/).

For the poets, it can be a gorgeous and focused writing environment with infinitely more flexibility than Word. Here's [a post that describes how one creative writer uses Atom](https://8bitbuddhism.com/2017/12/29/a-novel-approach-to-writing-with-atom-and-markdown/). The [Zen package](https://atom.io/packages/Zen) alone should entice you Hemingway types, but also take a look at the writing assistance tools detailed in previous hyperlink or the hyperlink in the next paragraph.

For me, the coolest thing is that I can have [one central hub](https://medium.com/@sroberts/how-i-atom-12988bce8fce) to do it all, with very little need for Word. If I use Atom to push things to GitHub, it also nearly replaces Google Docs for keeping everything safely in the cloud (caveat for the latter:as long as I don't mind making my work public).

Note from 2019: I switched to [VS Code](https://code.visualstudio.com/). It's very similar to Atom, but faster.

## Markdown
[![Markdown](https://github.com/dcurtis/markdown-mark/blob/master/png/208x128.png?raw=true)](https://daringfireball.net/projects/markdown/)

Markdown is a "text-to-HTML conversion tool for web writers [that] allows you to write using an easy-to-read, easy-to-write plain text format, then convert it to structurally valid XHTML (or HTML)."  (click image or [here](https://daringfireball.net/projects/markdown/) for source).

It's inspired by the way people used to mark up their plain-text emails to make them more readable, with all the "#" and "-" and "***" you can handle. Therefore, if you look at the source of something written in Markdown, it's still pretty darn legible. Those of you who have read and written medical charts, many of these are still in common use (the "#" problem list, for example).

Here are examples from a great [GitHub Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet). First is the code and then the rendered text.

`Emphasis, aka italics, with *asterisks* or _underscores_.`
Emphasis, aka italics, with *asterisks* or _underscores_.

`Strong emphasis, aka bold, with **asterisks** or __underscores__.`
Strong emphasis, aka bold, with **asterisks** or __underscores__.

`Combined emphasis with **asterisks and _underscores_**.`
Combined emphasis with **asterisks and _underscores_**.

```
Section with a hashtag:
# H1
```

Section with a hashtag:
# H1


```
Section using underline style to accomplish the same thing:
Alt-H1
======
```

Section using underline style to accomplish the same thing:

Alt-H1
======


Pretty cool, eh?

## OK, so what do you _actually_ do?

- Install all the stuff from one of the Jekyll how-tos mentioned above, follow one of the guides to set up GitHub pages, Travis CI, and your local jekyll environment.
- Open a new `.md` file in your favorite text editor.
- Insert something like this at the top:

```
---
layout: post
title: "On the tools used to make this website"
toc: false #table of contents
categories:
  - technical
tags:
  - jekyll
  - markdown
  - atom
  - hosting
  - static web
  - blog
  - technical
---

```

- Write all your stuff using Markdown syntax.
- Commit your changes to GitHub
- Wait for Travis CI to build, fix any errors (for example, you might need to delete the `BUNDLED WITH` lines in the gemfile.lock). 
- Check out your new post!

## Wishlist/possibilities


- Clickable Zen *reading* mode (remove all hyperlinks - whether or not hyperlinks impair focus is [hotly debated](https://books.google.com/books?id=QJxeBAAAQBAJ&pg=PA79&lpg=PA79&dq=On+Measuring+the+Impact+of+Hyperlinks+on+Reading&source=bl&ots=Ih_zN17-Nh&sig=F47u2HB7nBavnD3amydmJo5wNB4&hl=en&sa=X&ved=2ahUKEwjs0Pif1Z3dAhUKXa0KHcEeCucQ6AEwCXoECAEQAQ#v=onepage&q&f=false), he said with a meta-smirk).
- Clickable dark/light theme switch, a la [dactl](https://melangue.github.io/dactl//) (that black and white water drop button on the top right) or [Hagura](https://blog.webjeda.com/dark-theme-switch/) (the text that reads "Dark/Light" at the bottom of the page is a button), for kinder day and night reading. The Hagura author wrote a tutorial [here](https://blog.webjeda.com/dark-theme-switch/).
- ~~Side notes, a la Tufte. [Michael Nielsen's blog](http://augmentingcognition.com/ltm.html) has one implementation, and this [Tufte-ite Jekyll theme](http://clayh53.github.io/tufte-jekyll/articles/15/tufte-style-jekyll-blog) has another. I would probably have to reduce the page split from 50/50 to at least 66/33 for this to work properly.~~
- ~~Or: [Barefoot footnotes](https://github.com/philgruneich/barefoot) (click and they show up, like Wikipedia)~~ Barefoot works very well, check out other posts.
- Integrate fancy plugins

  - ~~[Overview of how to integrate non GitHub-approved plugins, with nice script that automates the integration](https://drewsilcock.co.uk/custom-jekyll-plugins).~~ Went with Travis CI instead, using [these instructions](http://joshfrankel.me/blog/deploying-a-jekyll-blog-to-github-pages-with-custom-plugins-and-travisci/). I ended up breaking everything and fighting with it for a day, but it seems the whole issue was that the backend process of migrating from the github.io address to beauhilton.com was not instantaneous, and as soon as it was done I could change the internal reference to <https://beauhilton.com> and it came together. All that heroic hacking, for nothing...
  - [Academicons](https://www.janknappe.com/blog/Integrating-Academicons-with-Fontawesome-in-the-Millennial-Jekyll-template/).
  - [Jekyll Scholar](https://gist.github.com/roachhd/ed8da4786ba79dfc4d91) and [Jekyll Scholar Extras](https://github.com/jgoodall/jekyll-scholar-extras), see [example with clickable BibTex and PDF downloads](https://caesr.uwaterloo.ca//publications/index.html) in publications page that makes me salivate.
  - [Integrate Jupyter Notebooks seamlessly](https://bethallchurch.github.io/jupyter-notebooks-with-jekyll/) (the way people usually do it, which is probably fine and doesn't require moar code, is to write up a plain-language explanation for the blog and link to the ipynb file on GitHub).
  - [Add estimated reading time to pages](https://github.com/bdesham/reading_time).
  - [Add search bar](http://www.jekyll-plugins.com/plugins/simple-jekyll-search).
  - [Make the site pictures responsive](https://github.com/robwierzbowski/jekyll-picture-tag).
  - [Add static comments to posts that would benefit from community](https://mademistakes.com/articles/jekyll-static-comments/#static-comments).
  - ~~Get Table of Contents working for lengthy posts such as this one.~~ Added this feature, though not in this particular post because the "# H1" Markdown examples screw it up.
