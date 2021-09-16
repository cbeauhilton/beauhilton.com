# Set Up Enterprise Wifi on Arch Linux

This was a little tricky to get working
but very worth it,
so here's an outline,
mostly for my own later benefit.

This post is specific to [VUMC](https://www.vumc.org), 
with the VUMCEmployee network.

Similar steps should be applicable for other enterprise wifi users,
though this post will unquestionably be out of date before long,
and the intricacies of enterprise wifi are infinite.

## VUMCGuest is fine

As with other public networks at large institutions,
VUMCGuest is just a little slow and finicky,
and it's annoying to have to re-authenticate repeatedly
to use all the HIPAA-compliant things.

## VUMCEmployee is better

I'll probably put a screenshot here at some point 
comparing speedtest scores. 
VUMCEmployee gives 
over 100 Mbps down, 
and around 100 up.

It's also more stable, 
and latency is around 10ms.

## Backend

The personal networking stack 
of greatest beauty
on Linux
at this point is:

`systemd-networkd` +`systemd-resolved` + `iwd`

Disable and delete `NetworkManager` 
and other such nonsense,
if you are unwise like me 
and installed conflicting and useless things.

If you'd like a GUI, [iwgtk](https://github.com/J-Lentz/iwgtk) is nice,
but the CLI shipped with `iwd` (`iwctl`) 
is intuitive, friendly, and well-documented.
I keep the GUI version around for quickly checking on things 
via a keyboard shortcut,
but use the CLI for any heavy lifting,
which has thankfully become rare since landing on this setup.

## Start with VUMCEmployeeSetup

First, log on to the VUMCEmployeeSetup wifi.
Then navigate to one of my favorite websites, <http://neverssl.com/>.
This will force the redirect to the VUMCEmployee enrollment page
(I also use this site for connecting to public wifi 
at airports, libraries, coffee shops, etc.).
Agree to the terms and conditions. 
Then click the "Show all operating systems" link at the bottom,
followed by the "Other Operating Systems" tab 
that pops up at the bottom of the list.

The "Other Operating Systems" tab has
three steps listed, 
which are simply the pieces that the 
various installers put together for you. 
The first two are downloads for certificates, 
and the third is a template.

Finding this tab 
was the gold mine - initially I
repackaged one of the other Linux installers for Arch,
because I thought that (since there was an installer)
the process must be complicated,
and repackaging things from Debian-based systems
for Arch-based systems is easy enough.
The repackaged version of the installer 
was decent at first,
but it turns out that 
the manual process is easier and more reliable.
I also learned more about enterprise networks in the process,
which was an added bonus 
(I'm honestly not sure about the 
sarcasm:sincerity ratio in the previous sentence).

Download the `PEM` files listed under 
Steps 1 (root certificate) and 
2 (client certificate).

## Make your own `iwd` profile

Here's where it goes: 
`/var/lib/iwd/VUMCEmployee.8021x`

Below are the contents, 
sensitive info redacted, 
then we'll go through some of the key parts
and one nicety.

```toml
[IPv6]
Enabled=true

[Security]
EAP-Method=PEAP
EAP-Identity=username
EAP-PEAP-CACert=embed:root_cert
EAP-PEAP-ServerDomainMask=*.radius.service.vumc.org
EAP-PEAP-Phase2-Method=MSCHAPV2
EAP-PEAP-Phase2-Identity=username
EAP-PEAP-Phase2-Password=password

[Settings]
AutoConnect=true

[@pem@root_cert]
-----BEGIN CERTIFICATE-----
*lots of gobbledigook goes here*
-----END CERTIFICATE-----
```

Most of these options are outlined in 
Step 3 from the VUMCEmployeeSetup,
cross-referenced against the Arch Wiki page on `iwd`, 
subsection [Network configuration](https://wiki.archlinux.org/title/Iwd#EAP-PEAP).

An easy-to-miss step: 
The `EAP-PEAP-Phase2-Method` requirement for `MSCHAPV2` 
leads to another required install, 
check the wiki for current instructions.

Put in your own username and password.

My favorite trick in this file is 
directly embedding the root certificate
in the line 
`EAP-PEAP-CACert=`
with the syntax 
`embed:root_cert` 
(any name is fine, 
doesn't have to be `root_cert`, 
it's just a pointer).
Then you add a definition of `root_cert` in a
`[@pem@root_cert]` section.
Insert the contents of the root certificate directly
via copy-paste or `cat`, etc.

Easiest method, as root:

```
cat /home/beau/dl/root_cert.PEM >> /var/lib/iwd/VUMCEmployee.8021x
```

With the direct embed method, 
you don't need to point to the root certificate file 
or keep it around at all.

Needless to say, 
`VUMCEmployee.8021x` 
is a sensitive file and should be protected appropriately.
However, this file or a version of it 
is what the automated tools would have made anyway,
so there's no special risk here - 
AND since you did it all yourself
you know there was no funny business
coming from a black-box installer.

## The other certificate (Client)

I can't remember what I had to do with the client cert,
probably added using the Chrome/Firefox certificate
managers.

I had to do this before when getting set up for VA remote access,
the Arch Wiki comes through again with an article on 
[Common Access Cards](https://wiki.archlinux.org/title/Common_Access_Card)
that includes instructions on adding certs to browsers.

There's a chance it's not even needed? 
The specification no longer supports 
adding a client cert field
in the file. 
At any rate, this set up is working now 
and I won't futz with it further 
until something breaks.

## -> ~~Profit~~ Prosper
