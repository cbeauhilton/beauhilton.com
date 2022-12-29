# [medical-humanities.org](https://medical-humanities.org)

This post is a work in progress.

<time id="post-date">2023-01-22</time>

<p id="post-excerpt">
I made a static website as an electronic learning system and forum, 
with the option for password protected posts and a controlled editing workflow, 
for free and without a dedicated server. This post has the highlights.
</p>


## First, free as in beer


New educational endeavors are, in my experience anyway,
almost always bootstrapped.
They start with an idea, passion, even erudition,
but rarely with money.

This was no different.

There's some funding coming in,
including some I'm grateful for as it will recompense 
the time I spent building the website,
but overall this thing needs to run for free.

Because of that, I used the best suite of free tools I know of:
GitHub, GitHub Actions, Netlify's free tier, NetlifyCMS, Hugo, and digital elbow grease.


## Second, free as in freedom (of speech, and the ability to choose what to share on the open web)


While we have a strict policy against violating HIPAA,
we also want an open forum that can be honest,
vulnerable, critical if need be.

Though the students are encouraged to make their writing available for all to read,
forming a kind of living magazine from the assignments,
we also want to make it very easy to keep the assignments
just within the group if desired.

This combination of desired features led to a need for selective password protection
of certain pages, opted into or out of by each student writer.

Usually, password protection on a website is akin to a lock on a door,
beyond which is a table that has the stuff you want to read.
The routes to sensitive data are locked by the server,
you need the key to get into the room, 
but once you get in the room you are free to wander over to the table and leaf through the dusty stack of papers.
Since I'm not paying for a server I fully control,
this approach is not going to work. 
Every route is accessible by the whole internet,
every door is open.
So, instead of worrying about a door and a lock,
we trade the dusty stack of papers for a Rubix cube with a million facets,
containing a message that only comes to light when you match up all the pieces.
Anybody can come and check out the toy, 
but unless you know the secret to solving it, 
it's just a jumble.

To build the Rubix cube I used [Pagecrypt](https://github.com/Greenheart/pagecrypt),
which encrypts individual HTML pages and provides a dialogue to enter a password to decrypt it.
To mark which pages should be encrypted,
I used a simple front-matter key, which a `grep` command picks out on every site rebuild.

Another neat aspect of this is that the *entire* page is encrypted,
even the comments section, so if a student wants to make a post somewhat private
and have a personal conversation with the other members of the class,
it's comfortably hidden from the view of the public internet.
