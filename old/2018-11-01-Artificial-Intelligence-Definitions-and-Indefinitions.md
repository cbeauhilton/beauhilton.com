---
layout: post
title: "On the buzziest of buzzwords: what is AI, anyway?"
toc: true
image: /images/unsplash-grey-flowerbuds.jpg
categories:
  - AI for MDs
tags:
  - artificial intelligence
  - machine learning
  - deep learning
  - big data
  - definitions
---

# Introduction

![cheezy AI stock image for visual interest. Brain on one side, circuit on the other]({{ site.url }}/images/pixabay-brain.jpg)

Artificial Intelligence is kind of a big deal.[^2] Despite real advances, particularly in medicine, for most clinicians "AI" is at best a shadowy figure, a vaguely defined ethereal mass of bits and bytes that lives in Silicon Valley basements and NYT headlines.

"Bob, the AI is getting hungry."

"I don't know, Jane, just throw some AI on it."

"AI AI AI, I think I'm getting a headache."

This article is the first of a series meant to demystify AI, aimed at MDs and other clinicians but without too much medical jargon. We begin with definitions (and indefinitions), with examples, of a few of the most popular terms in the lay and technical presses.

# Artificial Intelligence

There is no generally accepted definition of AI.

This begins a theme that will run throughout this article, best illustrated with an analogy from Humanities 101.

If you pick up a stack of Western humanities textbooks with chronologies of the arts from prehistory to the present, you will likely find a [fairly unified canon](https://en.wikipedia.org/wiki/Western_canon) (try to find a textbook that does _not_ include Michelangelo and Bach, even if it is brand new and socially aware) up until the 1970s or 1980s . At this point, scholarly consensus wanes. It has not had time to mature. As the present day approaches, the selection of important pieces and figures, and even the acknowledgement and naming of new artistic movements (e.g. "[post-postmodernism](https://en.wikipedia.org/wiki/Post-postmodernism)"), becomes idiosyncratic to the specific set of textbook writers.

While the phrase "AI" has been around since [1955](https://aaai.org/ojs/index.php/aimagazine/article/view/1904), the recent explosion in tools, techniques, and applications has destabilized the term. Everyone uses it in a slightly different way, and opinions vary as to what "counts" as AI. This reality requires a certain mental flexibility, and an acknowledgement that any definition of AI (or any of the other terms discussed below) will be incomplete, biased, and likely to change.

With that in mind, we offer three definitions:


## General AI
![image of a robot looking at itself in a mirror]({{ site.url }}/images/pixabay-robot1.png){:height="400px"}

This is the kind of AI that can reason about any kind of problem, without the requirement for explicit programming. In other words, general AI can think flexibly and creatively, much in the same way humans can. _General AI has not yet been achieved_. [Predictions](https://hackernoon.com/frontier-ai-how-far-are-we-from-artificial-general-intelligence-really-5b13b1ebcd4e) about when it will be achieved range from the next few decades, to the next few centuries, to never. [Perceptions](https://www.newyorker.com/magazine/2018/05/14/how-frightened-should-we-be-of-ai) of what will happen if it is achieved range from salvific to apocalyptic.


## Narrow AI
![stock image of a toaster]({{ site.url }}/images/pixabay-toaster.jpg){:class="img-responsive"}

This is the kind of AI that can perform well if the problem is well-defined, but isn't good for much else. Most AI breakthroughs in recent years are "narrow," algorithms that can meet or exceed human performance on a specific task. Instead of "thinking, general-purpose wonder-boxes," current AI successes are more akin to "[highly specialised toasters](https://aeon.co/ideas/the-ai-revolution-will-be-led-by-toasters-not-droids)." Because most AI is narrow, and quite so, when clinicians see any article or headline claiming that "AI beats doctors," they would be wise to ask questions proposed by radiologist and AI researcher, [Dr. Oakden-Rayner](https://lukeoakdenrayner.wordpress.com/2016/11/27/do-computers-already-outperform-doctors/): "What, _exactly_, did the algorithm do, and is that a thing that doctors actually do (or even want to do)?" A more comprehensive rubric for evaluating narrow AI and planning projects is available in the appendix to Brynjolfsson and Mitchell's [practical guide to AI](http://science.sciencemag.org/content/358/6370/1530.full) from _Science_ magazine.


## AI
![stock image of a spring]({{ site.url }}/images/pixabay-spring.jpg)

We will finish with Kevin Kelly's [flexible and aware definition](https://ideas.ted.com/why-we-need-to-create-ais-that-think-in-ways-that-we-cant-even-imagine/):
>In the past, we would have said only a superintelligent AI could beat a human at Jeopardy! or recognize a billion faces. But once our computers did each of those things, we considered that achievement obviously mechanical and hardly worth the label of true intelligence. We label it "machine learning." Every achievement in AI redefines that success as "not AI."

This view of AI takes into account the continual progression of the field, in sync with the progression of humans that produce and use the technology.

Kelly's quote calls to mind George R.R. Martin's [humorously sobering line](http://www.georgerrmartin.com/about-george/on-writing-essays/on-fantasy-by-george-r-r-martin/),
  >Fantasy flies on the wings of Icarus, reality on Southwest airlines.

If we flip this quote on its head a bit, we can see that real-life flight is a comprehensible thing, intellectually accessible to any person willing to put in time to learn a little physics and engineering, to the point that it becomes banal. Even for those who know nothing of the math and science, most are unmovably bored during their typical commuter flight, some fast asleep even before the roar of the tarmac gives way to the smooth and steady stream at 30,000 feet.

AI is now, in the minds of many, more akin to Icarus than the 5:15 to Atlanta.

In this series we hope to gain the middle ground: help the reader gain and maintain a sense of possibility and perspective, but also understand the mundane ins-and-outs of day-to-day AI.

# Machine Learning

A common definition of ML goes something like,
>Given enough examples, an algorithm "learns" the relationship between inputs and outputs, that is, how to get from point A to point B, without being told exactly how points A and B are related.

This is reasonable, but incomplete. Each algorithm has its own [flavor](https://xkcd.com/2048/): assumptions, strengths, weaknesses, uses, and adherents.

The simplest example generalizes well to more complex algorithms:

Imagine an AI agent that is shown point A and point B of multiple cases. If it assumes a linear relationship between input (A) and output (B), which is often a reasonable approach, it can then calculate (“learn”) a line that approximates the trend. After that, all you have to do is give the AI an input, even one it hasn't seen before, and it will tell you the most likely output. This describes the basic ML algorithm known as [Linear Regression](https://www.youtube.com/watch?v=zPG4NjIkCjc).

![illustration of linear regression](https://thumbs.gfycat.com/JointPartialIslandcanary-size_restricted.gif)

While linear regression is powerful and should not be underestimated, it depends on the [core assumption](https://xkcd.com/1725/) we outlined, that is, the data are arranged in something approaching a straight line. From linear and logistic regression through high-end algorithms such as gradient-boosting machines ([GBM](https://www.youtube.com/watch?v=OaTO8_KNcuo)s) and Deep Neural Networks (DNNs), each machine learning algorithm has certain assumptions. A major advantage of many newer algorithms is that their assumptions are far more flexible than the classic regression functions available on high school graphing calculators, but at their core they are still abstracted approximations of the real world, equations defined by humans.

Since the goal of this series is to help the reader try out some machine learning with hands-on coding, we should also note here that in most cases, running a GBM is exactly as easy as running linear regression (LR), if not easier: same number of lines of code, same basic syntax. Most of the time you have to change only one or a few words to switch, for example, from GBM to LR and vice versa. Often, an algorithm such as GBM is actually _easier_ to put into play, because it does not place as many requirements on the type and shape of data it will accept ([roughly 80% ](https://www.forbes.com/sites/gilpress/2016/03/23/data-preparation-most-time-consuming-least-enjoyable-data-science-task-survey-says/) of a data science job is collecting and whipping data into something palatable to the algorithm). Complexities may come later, when fine-tuning, and interpreting and implementing findings, but those problems are by no means intractable. We'll get to that in a later post.

Even "unsupervised" machine learning, wherein the algorithm seeks to find relationships in data rather than being told exactly what these relationships should be, is based on iterations of simple rules. Below is an example of an unsupervised learning algorithm called [DBSCAN](https://dashee87.github.io/data%20science/general/Clustering-with-Scikit-with-GIFs/). DBSCAN is meant to automatically detect groupings, for example, gene expression signatures or areas of interest in a radiographic image. It randomly selects data points, applies a simple rule to see what other points are "close enough," and repeats this over and over to find groups. You have to choose which numbers to use for `epsilon`: how close points have to be to share a group; and `minPts`: the minimum number of points needed to count as a group. The makers of this GIF chose 1 and 4, respectively.

![unsupervised learning DBSCAN gif](https://dashee87.github.io/images/DBSCAN_tutorial.gif)

As you can see here, "unsupervised" machine learning is clever and useful, but not exactly "unsupervised." You have to choose which algorithm to use in the first place, and almost all algorithms have some parameters you have to set yourself, often without knowing exactly which values will be best (would `minPts = 3` have been better here, to catch that bottom right group?). It is not so different from selecting a drug and its dosage in a complex case: sometimes you will have clinical trials to help you make that decision, sometimes you have to go with what worked well in the past, and sometimes it's pure trial-and-error, aided by your clinical acumen and luck.

Lastly, as always, regardless of the elegance of the algorithm, the machine can only take the data we provide. Junk in still equals [junk out](http://www.tylervigen.com/spurious-correlations), even if it goes through an [ultraintelligent washing machine](https://xkcd.com/1838/).


## Deep Learning

Deep Learning (DL) is a subset of machine learning, best known for its use in computer vision and language processing. Most DL techniques use the analogy of the human brain. A "neural network" connects discrete "neurons," individual algorithms that each process a simple bit of information and decide whether it is worth passing to the next neuron. Over time the accumulation of simple decisions yields the ability to process huge amounts of complex data.

![Deep learning free stock image from Pixabay]({{ site.url }}/images/pixabay-neural-network.png)

For example, the neural network may be able to tell you [whether or not something is a hotdog](https://medium.com/@timanglade/how-hbos-silicon-valley-built-not-hotdog-with-mobile-tensorflow-keras-react-native-ef03260747f3), what you probably meant [when you asked Alexa to "play Prince,"](https://developer.amazon.com/blogs/alexa/post/4e6db03f-6048-4b62-ba4b-6544da9ac440/the-scalable-neural-architecture-behind-alexa-s-ability-to-arbitrate-skills) or whether the retina shows signs of [diabetic retinopathy](https://doi.org/10.1001/jama.2016.17216). These successes in previously intractable problems led researchers and pundits to claim that DL was the breakthrough that would lead to general AI, but, in line with Kevin Kelly's fluid definition cited above, experience has now tempered these claims with [specific concerns and shortcomings](https://arxiv.org/abs/1801.00631).


# Big Data

![Most of the time, "big data" is an overkill term. Sometimes, it isn't. This is a picture of a tricycle chained to light pole.]({{ site.url }}/images/pixabay-trike.jpg)

The best definition of "big data" borders on the tautological:
>Data are "big" when they require specialized software to process.

In other words, if you can deal with it easily in Microsoft Excel, your database probably is not big enough to qualify. If you need something fancy like Hadoop or NoSQL, you are probably dealing with big data. Put simply, these applications [excel](https://www.brainscape.com/blog/wp-content/uploads/2012/10/Jj5i1Ge.jpg) at breaking massive datasets into smaller chunks that are analyzed across many machines and/or in a step-wise fashion, with the results stitched together along the way or at the end.

There is no hard-and-fast cutoff, no magic number of rows on a spreadsheet or bytes in a file, and no single "big data algorithm." In general, the size of big data is increasing rapidly, especially with such tools as always-on fitness trackers that include a growing number of sensors and can yield [troves of data](https://ouraring.com/how-oura-works/), per person, per day. The major task is to separate the wheat from the chaff, the signal from the noise, and find novel, actionable trends. The [larger the data](https://www.wired.co.uk/article/craig-venter-human-longevity-genome-diseases-ageing), the more the potential: for finding something meaningful; for drowning in so many meaningless bits and bobs.

# Summary

AI and related terms have no completely satisfying or accepted definitions.

They are relatively new and constantly evolving.

Flexibility is required[^1].

Behind all of the technological terms, there are humans with mathematics and computers, creativity and bias, just as there is a human inside the white coat next to the EKG.

[^1]: A linguistic gem from an early AI researcher is here apropos: "Time flies like an arrow. Fruit flies like a banana." There are a [delightful number of ways to interpret](https://en.wikipedia.org/wiki/Time_flies_like_an_arrow;_fruit_flies_like_a_banana#Analysis_of_the_basic_ambiguities) this sentence, especially if you happen to be a computer. How much flexibility is too much? Too little?

    The paper with the original Oettinger quote was frustratingly hard to find, as is often the case with classic papers from the middle of the 1900s. So save you the hassle, [here's a PDF](http://worrydream.com/refs/Scientific%20American,%20September,%201966.pdf). The article starts on p. 166.

[^2]: Lest you think I've lost perspective on what really matters, here's a [comparison of the Google search trends over time for "Artificial Intelligence" and "potato."](https://trends.google.com/trends/explore?date=all&q=%2Fm%2F0mkz,%2Fm%2F05vtc) Happy Thanksgiving.
