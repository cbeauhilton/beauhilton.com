# good machine learning in medicine

<time id="post-date">2022-12-29</time>

<p id="post-excerpt">
Because most machine learning in medicine sucks, I thought you might like to see an example of it done well.
</p>

<https://doi.org/10.1056/CAT.22.0214>

At least on the surface, this looks good.
The article is paywalled so I haven't gotten to dig into their methods yet,
but will update when I am able to read the whole thing.
The approach is the thing I'm keyed in on - 
implementation details of course matter, 
but the biggest problem with machine learning in medicine is not technique, but angle.
Too often, ML is a new shiny, 
no meat on its bones 
(I'm not discounting some of the delightful advances in e.g. automatic read of ophthalmologic images,
that's kickass tech and truly practice-changing, 
but it does amount to image processing. 
The stuff I'm talking about here is not a smarter camera,
but automated gestalt handed to you by a mechanical Turk).


## ML is mostly for automation, but automating medicine is scary


The big idea is that 
while machine learning is great for many things, 
the most important thing in industrial machine learning is 
teaching a machine to make independent decisions 
to make things easier for humans who already have too much cognitive load,
or not enough hands,
and a pesky attachment to oxygen, food, and sleep.
E.g. if there's a knob someone needs to turn when a certain complex set of things happens,
and sometimes the human forgets because they were occupied with all the switches and buttons instead,
or they were on lunch, 
or sleeping off the Superbowl party,
it sure would be nice to make an algorithm
that can independently assess whether the complex condition has been sufficiently met,
and go ahead and turn the knob for you
(and maybe, while it's at it, get you a few ibuprofen for that hangover headache).

In medicine we usually don't want a bot making independent decisions, 
but this paper from UPMC is a great example of the kind of independent decision we could stomach, or even welcome.


## build a model that is high-yield and low-risk


This system builds a mortality model, which is fun in itself, but then goes to the next level to automate an e-consult to the palliative care team for patients at highest risk of mortality after discharge.

(Avati et al did the same basic thing at Stanford using a neural network, 
which is a fine technology, 
but their explanatory models were these shitty, 
ugly text-based tables that make you want to stab yourself in the eyes - <https://doi.org/10.1186%2Fs12911-018-0677-8>).

It's beautiful.
Nothing bad bubbles up if the algorithm falls down altogether (we're just back where we were before the model went live).
Nothing horrible happens if the algorithm makes a weird claim (every consult will still be triaged through a human).
Possible positives are numerous. 
The conversation itself may be one of the most pivotal in the patient's end-of-life journey,
the hospital system will likely have reduced readmissions for cases that should be managed at home with hospice,
and we will have more data to put towards figuring out how to identify the modifiable risk factors for early post-discharge death.

This team used the same tech I did when I built a mortality model for CCF, 
my favorite kind of algorithm, 
tree-based models called gradient-boosting machines (GBMs). 


## interpretability - gotta do it, maybe they did


What I can't see yet is if they took the next obvious step, 
which is to apply interpretability models on top. 
The main reason to use a GBM, 
in my mind, other than they're fast to train compared to neural networks 
and perform the same if there's enough data and you tune them properly, 
is that they're inherently compatible with the best meta-models that allow you to interrogate, 
both on a per-prediction and cohort level, 
why the model is saying whatever it's saying - 
they're actually less of a black box than many standard statistical models, 
believe it or not. 

The best tool for doing this is called SHAP, 
and the output is gorgeous - [check it out](https://shap.readthedocs.io/en/latest/example_notebooks/overviews/An%20introduction%20to%20explainable%20AI%20with%20Shapley%20values.html).
We used it here, 
I think to lovely effect: 
<https://www.nature.com/articles/s41746-020-0249-z>, 
and it's only gotten better since then)

The other thing I love about pairing the interpretability models 
with the predictive models 
is now you have something you can really learn from, and, hence, teach from.


## but, will this worsen burnout?


The main issue, (given that the model works and has been proven trustworthy) 
and which I don't think I've heard anyone talk about in great depth, 
is the new alert fatigue this kind of system would make, 
for already overworked palliative care teams, 
and what mitigations they are taking to keep the firehose of new possible consults manageable. 
One thing we could do, 
and I have faith our house staff could do it well, 
would be to implement the same system and have it first trigger an alert to the primary team, 
with a recommendation to have the convo and reach out to pall care if there is any hint of a loose end, 
or an automated pivot to pall care if the notes don't document GOC within a certain number of days of the alert 
(or could pop up one of those boxes we love so...  much with a radio button asking you if you've had "the talk" yet).

Anywho, 
I'm not saying I want to actually do this project, 
I've got other stuff going on,
but if you're reading this you're the kind of person who is interested in what tech can do for a hospital system, 
and this is a model (ha) combination of the very cutting edge of tech 
and the oldest technique we have, 
which is to offer a hand to the dying and with them face the abyss. 
My vision of the future is less Skynet, cold and isolated, 
but rather humans forefront, 
with machines that run in the background to nudge us into and help make room for more 
(non-digital, non-Apple mediated) facetime.
