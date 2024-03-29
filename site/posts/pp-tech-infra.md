# Patient-facing slide decks

<time id="post-date">2024-03-23</time>

<p id="post-excerpt">
While I plan on being a physician-scientist forever, I'm not going to work in academia.
Over the past few years I've put together very cool infrastructure for giving academic talks (click "talks" above),
and it was making me sad that it might not get much use after I leave the university.
But then, a ray of sunshine: Why not use my slide deck infrastructure to help in patient conversations?
</p>

## talks.beauhilton.com

Academics give lots of presentations. 
I gave at least one 15min presentation per week in medical school,
and still expect a few 15-45min presentations per half-year in fellowship.

PowerPoint was long ago eschewed in favor of online-first presentation platforms,
typically Google Slides. 
(Eventually Office365 came out and PowerPoint came on par with Google Slides,
but I had already moved away.)
No emailing around files and accidentally sending the old version,
or running into an incompatible version of the software,
and the presentation could be modified all the way up to 
(and, occasionally, during) the event itself.
All you need is an internet connection.

Eventually I wanted to move away from proprietary infrastructure altogether,
so started using [Slidev](https://sli.dev). 
Slidev is geared toward developers,
and as such uses all industry-standard web technologies,
nicely packaged up to make it easy to go from a text file to a nice-looking presentation.

The defaults are great, and, since it's all web standards, 
the sky is the limit as far as customization.

The presentation lives in a single text file (markdown).
This makes it easily versionable,
tracked by git and backed up to [GitHub, GitLab, self-hosted git solutions, etc.].
Since I keep a copy on GitHub, 
the ease of editing while on-the-go approaches the ease of editing a Google Slide
(all you need is an internet connection and to be logged in).

Once the presentation is online,
I'm only ever a click or two away from accessing it.
I make sure everything is HIPAA-compliant, and to the public internet it goes.

It's been great for making talks in my academic program,
and, when I thought I would stay in academia forever,
it made sense to me to spend the time to build out my own infrastructure
and subdomain for talks.

## emphasizing the "physician" in "physician-scientist"

Recently, I realized that I'd be happier shifting 
the physician-scientist balance more toward physician and less toward scientist, 
at least as measured by days per week dedicated to each.
While I think I'll always see myself as as physician-scientist,
my future oncology job (hopefully not "jobs," but who knows)
will be in private practice, where I'll see patients 3 or 4 days per week
and do research with the other 0.5-2 days that remain.

(The following three paragraphs are an aside on how much time is spent on what in academia,
and touches on why I decided to leave. 
I should probably move this out and expand it into its own post. 
It doesn't have much to do with the core of this one.)

Classic academia is usually patient care 0.5-1 day per week, research the remainder - 
but that's somewhat misleading, 
since academics typically have a number of dedicated inpatient weeks,
which may or may not put a damper on the ability to do research during that time,
depending on how busy they get 
and whether it's July (with brand new trainees) or June (with seasoned trainees). 
Even accounting for this, 
it doesn't even out to the number of patient-care days per year in private practice, 
not by a long shot, but for most folks it isn't so freed 
from day-to-day patient care as it is advertised on the tin.
There are a some academics who do a few weeks of inpatient care per year and that's it,
no clinic,
but that's the exception.

You also pay your own salary out of your research funding,
so there's a large time burden of not doing research,
but writing grants to convince funders that your research is cool and worth funding.
With the research I do and am interested in continuing, 
a university infrastructure adds little, 
where it isn't actively working against me,
and I'd rather pay my salary, which will be much bigger, from taking care of people in clinic 
than working through the weekend to meet grant deadlines
(while I may also still be on call for the hospital).

The university infrastructure is great for basic and clinical science,
and some flavors of data science, 
but my scientometric stuff is truly better if done vigilante-style,
not attached to academia's politics,
and predictive modeling/etc. is available and important to private practice collectives (AON, USON, OneOnc),
some of whom have more robust data infrastructure than the universities do.
My most successful clinical data science project thus far was actually done under the purview
of Business Intelligence for Cleveland Clinic,
working with the Center for Clinical Artificial Intelligence,
and the publication was the side project - 
this is much more in line with what I may find myself doing with clinical data science with one of the big three onc groups:
do the thing, do it well, and if you feel like publishing it, gravy.
The scientometric stuff is more classic research,
where publication itself is the deliverable,
but even here I'm much more interested in publishing a living website and tool
than a paper in a journal.

(And now, back to our regularly scheduled program.)

Outside of academia, there's a high chance I won't give presentations nearly as often as I am accustomed to.
At first, this made me simultaneously happy (presentations are so. much. work.) 
and sad (aww, my cute little talks website will just gather dust. Poor buddy).
Then! I went to a dinner meeting to learn about renal cancer 
and get paid to hang out with friends and eat,
and most of the physicians talked about bringing up primary data
to help in discussions with patients.
Most physicians do this when they think it will help,
and it certainly wasn't the first time I'd heard people talk about it,
but the timing was right.
I realized that I have a great use for my talks website,
and that I've already been using it this way for some time.

## talks in clinic - data for shared decision-making

At least 3 or 4 times in the past few months,
I've been having discussions with patients about their prognosis
and various options, 
and wished I had the graphs to show them without having to poke around Google 
and possibly fight with a paywall,
then realized I just gave a talk on the same thing,
the talk is on my website, 
and it has those graphs.

It was very useful to go over the primary data with the patient
(not everybody wants to see this stuff, but a significant number do),
and having a talk I gave to reference immediately lent an additional modicum of trust to the conversation
(most trust is built from showing you care, 
but another portion is built from showing you know what you're doing).

Hearing the physicians at that dinner meeting
talk about how they're using primary data in their shared decision-making,
combined with my recent decision to go into private practice,
and thoughts about what to do with my website,
led me to the following idea:
for diseases I'm most interested in,
and for diseases I treat the most,
it will be very useful to have a talk
I made and maintain,
geared toward patients,
to immediately pull up and have available in clinic,
and have the link to give the patient for review,
particularly in those conversations with their loved ones
where they're trying to remember all the stuff you said
to make a group decision.
It would also be easy and useful to have a slide describing the regimen
and its schedule, 
especially if the way we're giving it doesn't quite match up with the published regimen 
(e.g. one of the many regimens that is written as "2 on, 1 off" but we're giving it every other week instead).

I'm definitely not going to make a talk for every disease
or use one in every conversation,
that would be insane and impossible to maintain,
but if I pay attention to the data I use repeatedly,
a 30-60min session adding some of these to a slide deck
with a little explanation 
would more than carry its weight in future conversations.
