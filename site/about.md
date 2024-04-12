
## husband and father

Talented, beautiful people surround me.
The [now page](/now)
usually has the most current updates in this arena.


## physician

Oncology fellow, Vanderbilt 2022-2025.  
Internal medicine resident, Vanderbilt 2020-2022.  
Medical school, Cleveland Clinic Lerner College of Medicine
of Case Western Reserve University 2015-2020.

I enjoy treating people with any cancer,
but have a particular affinity for
head-and-neck and upper GI cancers
(together, 2/3 of the "aerodigestive" cancers, the other 1/3 being lung).
There are many right ways to be a doctor,
but the way I understand my role is this:
to be with people in their suffering and their joy (suffering is everywhere, but there is a special joy known only in the oncology clinic),
to see and know the soul within the body (whatever the tumor or the scalpel or the radiation beam or the drug has done to that body),
to cure when I can (and deal with the fallout from that cure),
and help always (to the end and beyond).

There are glimmers of hope and serious advances in recent years,
but these remain horrible diseases, 
many of which have few treatment options 
once they've reached an advanced stage,
and the treatments we do have tend to be quite difficult to tolerate.
Most cancers can be disfiguring,
but these especially so, 
whether from the tumors themselves or from the therapies.
Aerodigestive cancers also disproportionately affect
folks who live out in the country,
or in the cities but with few resources,
and these folks are my folks.

We need to help each other, and there is much to do.


## educator


Harvard Macy Institute faculty, 2018-2020.
Health Care Education 2.0.

<https://vimbook.org>, 2020-present.  
The Vanderbilt Internal Medicine Handbook 
was started by Mike Neuss, MD/PhD
in the late 2010s when he was a resident. 
It's an incredible resource,
primarily envisioned as a physical book 
to keep in your white coat pocket
for quick, authoritative reference.
It had a website when I came to Vandy, 
but the UX... left something to be desired. 
I rebuilt it into its current state
(website and infrastructure only - each section has its own author(s)), 
and help maintain the back end.

Chase Webber is the faculty support, and has been amazing.

It's used globally, 
and one of my goals is to make it easier for smaller, 
particularly international programs to have their own versions 
(I built <https://medical-humanities.org> 
for the certificate program here, 
partially as an exercise in creating more user-friendly tooling, 
and it works well, 
but I haven't been able to integrate those learnings 
back to vimbook.org just yet). 
It uses only free and open-source software, 
and fits comfortably into pretty much any free tier server 
despite being a fairly large book with multimedia, 
but updating the content is just this side 
of too developer-y for broad uptake 
(login to GitHub, 
edit some markdown files, 
figure out how to get the formatting you want, etc.).

What it really needs is funding,
and a part-time developer with protected time.


## data scientist

[Google Scholar profile](https://scholar.google.com/citations?user=Ng5AgXAAAAAJ)

*If you are interested data science consulting, [contact me](/contact).
Current rate is listed at that link.*

*Major projects are listed below in reverse chronological order (roughly), 
newest projects at the top.*


### overview

My research has morphed over the years,
as everyone's does,
but the consistent thread and drive throughout
has been on coaxing large, messy, complex data
to tell us a story about ourselves,
about all of us as societies and neighborhoods 
as well as each one of us individually,
to empower us to speak our own sequels.

To translate that into buzzwords, 
for your bingo game:
I'm an oncologist
who uses explainable artificial intelligence
among other techniques
to diagnose and address healthcare disparities,
including democratizing personalized medicine
and pursuing synergies in the
global academic-industrial complex.

I was trained as an anthropologist,
where reductionism is an insult,
at the same time that I was trained as a scientist,
where reductionism is the central conceit.
Despite the way I set up that last sentence, 
there is no true conflict,
as the goal for most scientists and anthropologists is the same:
to make things at least a little better for someone,
but hopefully a lot better for everyone.
Modern anthropology is inherently activist,
far from the crusty sepia-toned image of a staid researcher 
sitting just outside the village campfire furiously scribbling in a notebook,
and so is modern medical research
(we all read Tuskegee and are appalled and want to do better,
though precious few become [Paul Farmer](https://en.wikipedia.org/wiki/Paul_Farmer)).

Data science was an unexpected boon,
a set of tools that lets me deal with 
staggering complexity
in a disciplined way,
to a degree unifying the
anthropologist's drive to let the data be itself (messy, human)
with the scientist's drive to simplify.

I became acquainted with using code to model the world
when I was doing physics research 
(equivalent circuit modeling 
and scanning laser doppler vibrometry 
on a Nigerian-style clay pot drum, 
total hoot, 
I [presented](https://doi.org/10.1121/1.3654998) it
at the Acoustical Society of America Annual Meeting 
and we published it in 
[JASA](https://doi.org/10.1121/1.4789892)),
and the research-centric medical school at Cleveland Clinic 
gave me the better part of five years 
and a supportive environment
to dive in deeper to computer science, machine learning, etc.

Now that have the freedom to choose my own direction,
data science projects that were informed by anthropology
but had centroids in other disciplines have become
squarely within the overlap of my personal Venn diagram.

Additionally, as I have moved from academia to the worlds of private practice and industry,
I am increasingly inspired toward using these interests to hit cancer where it needs it the most:
in the clinic of the community oncologist, where the vast majority of cancer patients receive care,
by bringing timely insights from every relevant axis to bear on every visit.

[Information almost wants to be free](https://en.wikipedia.org/wiki/Information_wants_to_be_free), 
and there is now so much of it,
that a lot can be done for free or at a low cost.
(I'm take special glee in byproducts,
"digital waste,"
some say,
but there is gold in them there hills -
[Shigeru Ban](https://en.wikipedia.org/wiki/Shigeru_Ban) is my hero).
There are abstracts from conferences aplenty describing the cutting edge of everything,
usually seen as jots and tiddles on the march of science forward but forgotten when the journal article gets published,
and lab values and imaging results and clinic notes generated in the usual course of patient care,
used once or a few times and then forgotten and discarded in the wake of what comes next - 
in all of this digital refuse I believe there are insights to be gained, efficiencies to be achieved, lives to be saved.

---


### disparities in cancer research across space and time

This ongoing project starts with a custom metadata archive
of all the abstracts from the two big annual cancer meetings 
(ASH and ASCO - as a starting point), 
made machine-readable and hence more easily accessible en masse. 
Here's a [rough prelim](https://ash-abstracts.vercel.app/abstracts_small/abstracts) 
of what that looks like, 
with an interactive map and sorting/search/export 
(you can hit JSON or CSV endpoints trivially to get nicely formatted data, 
as opposed to the hulking web scrapers 
and HTML wranglers I wrote to get the data the first time). 
Analyses are planned on the authors and affiliations 
(global mapping, with a time component), 
and how those overlap with disease states 
(e.g. how much sickle cell research comes out of Sub-Saharan Africa? 
We know it's bad, but nobody has quantified how bad - 
the idea is to have a platform for answering these questions easily), 
before branching out into things like 
conflicts of interest and various analyses using NLP, etc.

---


### Cleveland Clinic Center for Clinical Artificial Intelligence 
### explainable machine learning for readmissions, with a focus on sociodemographics

While at Cleveland Clinic, 
I was one of the founding members of the 
Center for Clinical Artificial Intelligence,
and its first dedicated analyst.
We had the delightful opportunity to work with
a rich dataset from one of the world's largest hospitals,
focused on predicting the risk of 
readmission (discharging from the hospital and "bouncing back" too soon) 
and extended length of stay.
We had access to not only health data,
but socioeconomic data, 
for millions of patients,
and I further enriched this with census data.

With only an address and a date,
one can learn about a person's neighborhood
in incredible detail
(though not the person themselves - 
the US Census is wise about privacy in the data they publish).
It turns out that a person's neighborhood
is a major predictor in their health outcomes,
as is their insurance provider,
in addition to a host of health parameters and hospital process clues.

I used interpretable machine learning techniques,
with a focus on revealing actionable items 
that the patients and medical teams could hope to influence,
as well as to call out structural issues 
that organizations and governments need to know.
One of the problems with machine learning 
is that it can only ever restate 
(and in some cases, as it feeds back on itself, more firmly entrench) 
the biases that led to the historical data you fed to it.
If you design it to show you these biases,
show you *all* of its biases, explicitly,
to tell you exactly how much a person's race, ethnicity, gender, and neighborhood
played a role in its predictions (alongside medical diagnoses and lab values),
you have transformed an algorithm from a 
potentially destructive tool,
a heinous thing that pushes hurting people farther down,
into a tool for positive change.
If these biases are shown in an easy-to-read visual,
that patients, clinicians, and administrators can all understand,
all the better.
See what it looks like [here](https://doi.org/10.1038/s41746-020-0249-z).

---


### Cleveland Clinic Taussig Cancer Institute
### explainable machine learning for blood cancer diagnostics

Initially, when I was going to be a malignant hematologist
(I still think it is a beautiful field, but was drawn away to other pastures),
I wanted to level the playing field for advanced diagnostics.

A world-class hematopathologist together with a world-class clinician,
preferably a whole group of these together,
are required to make certain diagnoses,
and these only after at least one invasive biopsy.
What if we could mobilize the rich genetic and phenotypic data
available in simple blood samples and from the electronic medical record
to support diagnostics, and, eventually, democratize them?
Further, what if the answer the machine gives could be not only accurate,
but interpretable? 

What if we could get the machine to explain itself and its reasoning, 
both as a check against biological implausibility
(and more insidious problems such as systemic racism),
and to reveal more areas for research?
What if a high resolution bone marrow biopsy image
could be read in moments by a smart phone in 
rural Arkansas/Kandahar/Mogadishu/Kushalnagar/etc.,
instead of having to be shipped to 
one of a handful of academic centers while the patient waits, 
still sick, for an answer?

We made [some](https://doi.org/10.1182/blood-2019-126967) 
[progress](https://doi.org/10.1182/bloodadvances.2021004755),
but these problems remain largely unsolved.

---


## internal links

If you want to know which tools I use, visit
[/uses](/uses).

If you are interested in the tech stack for this website, visit
[/colophon](/colophon).

If you would like to throw money at me, for whatever reason, visit
[/pay](/pay).


