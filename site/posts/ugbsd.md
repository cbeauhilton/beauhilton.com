# Upgrading out-of-date OpenBSD installs


<time id="post-date">2022-11-11</time>

<p id="post-excerpt">
First of all, don't do how I do. 
Upgrade your installs regularly. 
OpenBSD makes it very easy.
</p>

But, if you do happen to get behind...

`sysupgrade` is very likely to fail.


## What happens when you try to upgrade a very old install?


Lots of 404 errors. 

The `sysupgrade` utility tries to grab the next version of the OS from one of the many mirrors
(the specific one your system will use is in `/etc/installurl`.)

The default mirrors only keep the last 2 or 3 versions around,
so when `sysupgrade` constructs the url and tries to hit it for downloads, it will fail.


## Where to get old versions?


There are a couple of mirrors that keep almost all the old versions around.

<https://mirror.yandex.ru/pub/OpenBSD/> 
has files going back to OpenBSD 2.x - they seem like 
the most serious archivists, at least of the mirrors I looked at.

<https://mirror.sjtu.edu.cn/OpenBSD/> 
has files going back to 6.5 as of this writing (2022-11-11), 
also not too shabby.

Do a little `vi /etc/installurl` and change the link to one of the above, 
depending on how delinquent you've been.

That should allow you to do serial `sysupgrade` commands until you catch up.

When you get close to the current version, 
consider switching back to a closer mirror, 
both for faster installs 
and to be kind to the folks who just saved your bacon.
