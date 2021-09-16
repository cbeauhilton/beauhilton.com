# Using VUMCEmployee Wifi on Arch Linux

This was a little tricky to get working, 
but very worth it,
so here's a brief outline mostly for my own later benefit.

# VUMCGuest is fine

Just a little slow and finicky,
and it's annoying to have to re-authenticate repeatedly.

# VUMCEmployee is better

I'll probably put a screenshot here at some point comparing
speedtest scores. 
VUMCEmployee gives over 
100 Mbps down, 
and around 100 up.

It's also more stable, and latency around 10ms.

# VUMCEmployeeSetup is necessary

First, log on to the VUMCEmployeeSetup wifi.
Then navigate to one of my favorite websites, <http://neverssl.com/>.
This will force the redirect to the VUMC Cloudpath enrollment page.
Agree to the terms and conditions. 
Then click the "Show all operating systems" link at the bottom,
followed by the "Other Operating Systems" tab that pops up.

Download the `PEM` files listed under Steps 1 and 2.

# Make your own `iwd` profile

Here's where it goes: `/var/lib/iwd/VUMCEmployee.8021x`

Below are the contents, 
sensitive info redacted, 
then we'll go through some of the key parts
and niceties.

```
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
