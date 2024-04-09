# Writing clinical notes using AI - a practical experience

<time id="post-date">2024-04-09</time>

<p id="post-excerpt">
    With Claude 3 Opus (a newish ChatGPT4 competitor) as my copilot, I wrote a pretty darn good SOAP note
    for an (invented yet realistic) new consult visit. It took a little massaging to get it right,
    but boy howdy, it did a great job. Here are the prompts and outputs. 
    This stuff has serious potential for streamlining the boring and tedious parts of the job.
</p>

## LLM, the Great and Terrible

[Claude](https://www.anthropic.com/claude) 
is one of several new kids on the block in the land of highly capable Large Language Models (LLMs),
and is comparable to (but exceeding in certain aspects) the incumbent ChatGPT4.

I decided to see how it would do writing a SOAP note for an imaginary (but common and realistic)
new patient consult in an oncology clinic.

Why "the Great and Terrible?" Everybody knows by now that LLMs are great at a lot of things,
including writing coherent and fluent English
and conforming to pretty much any common text format you can find online
(from legal documents to Python or JavaScript code).
Most folks also know that LLMs aim to please,
and will make up the details they lack in order to satisfy your request,
so their output cannot be trusted too far, particularly in technical areas.
My goal in this was to see how close I could get to a usable clinic note,
with full awareness that it was going to hallucinate and require a tune-up on the back end.
In other words, I am confident LLMs are "terrible" in certain ways,
but needed convincing that they are "great" in this particular arena.

## Round 1: The Initial Prompt

I asked Claude for the following:

> please write a maximally billable SOAP-style medical note 
for an office visit with a new patient with likely stage III esophageal squamous cell carcinoma. 
Note that we discussed the need for full staging 
with FDG-PET CT to determine the final course of action, 
and the risks and benefits of a CROSS-style chemoradiotherapy regimen if stage III disease is confirmed 
vs systemic therapy if stage IV disease is confirmed. 
The patient describes mild dysphagia to solid foods but minimal weight loss, 
has no notable physical exam findings, 
and labs are unremarkable other than mild anemia. 
I reviewed the available cross-sectional imaging and concur with the radiologist's report.

And here's the output:

---

Here is a maximally billable SOAP-style medical note for the patient encounter you described:

S (Subjective): 
62 yo M with newly diagnosed esophageal cancer presents to oncology clinic to establish care and discuss treatment options. 
Reports mild dysphagia to solid foods x 3 weeks 
but denies significant weight loss, odynophagia, chest pain, nausea/vomiting, hematemesis, melena, hematochezia, or other GI symptoms. 
ROS negative except as above. 
PMH notable for HTN, HLD, and GERD. 
FH neg for GI malignancies. 
SH former smoker, quit 10 years ago, 30 pack-year history. 
Married, retired accountant, lives at home with wife. 
Medications include lisinopril, atorvastatin, omeprazole. 
No known allergies.

O (Objective):  
Vitals: Temp 98.6 F, BP 128/78, HR 72, RR 14, 98% RA, Wt 180 lb, Ht 70 in  
General: NAD, well-appearing. HEENT: PERRL, EOMI, oral mucosa moist. Neck: no LAD. CV: RRR, no m/r/g. Pulm: CTAB. Abd: soft, NT/ND, no masses. Ext: no c/c/e, 2+ pulses.  
Recent EGD: Esophageal mass 30 cm from incisors, partially obstructing lumen, biopsies c/w squamous cell carcinoma. 
CT chest/abd/pelvis: 5 cm distal esophageal mass, obliterating 75% of lumen. 
2 cm regional lymph node. No distant metastases identified. 
Radiologist assessment: T3N1M0, clinical stage III.
Labs: CBC: WBC 6.8, Hgb 11.5, Plt 225. CMP nl except Alb 3.2. CEA 5.2.  

A (Assessment):
- Esophageal squamous cell carcinoma, clinical stage III (T3N1M0). Awaiting PET/CT for full staging and treatment planning.
- Dysphagia secondary to above. Tolerating po currently without significant loss. Monitor symptoms, intake closely.
- H/o GERD on omeprazole. Continue current therapy. 
- Anemia, likely anemia of chronic disease but will evaluate as outpatient.  

P (Plan):
1. Will obtain FDG-PET/CT scan to complete staging. 
2. If no distant metastatic disease, recommend neoadjuvant chemoradiotherapy per CROSS regimen (carboplatin/paclitaxel q week x 5 + 41.4 Gy in 23 fractions). 
Discussed expected toxicities including fatigue, esophagitis, nausea, neutropenia and importance of close monitoring. 
3. If metastatic disease identified, will pursue systemic chemotherapy, likely FOLFOX or EOX regimen, rather than local therapy. May require palliative measures for dysphagia (stent, dilation prn).
4. Check iron studies, B12, folate. Replace as indicated.
5. Nutrition consult. Encourage high calorie/protein foods.
6. RTC in 1 week to review PET/CT results and finalize treatment plan. Sooner prn for worsening dysphagia, intolerance of po.

---

The LLM has added in a host of things I didn’t ask it for specifically but do appreciate it including, 
which is what I hoped for when I asked for a “maximally billable note” - 
e.g. the review of systems, PMH, FH, SH, a reasonable assessment and plan for the anemia, RTC, etc. 
Certain aspects are completely fabricated 
(age, vital signs, the specifics of the radiology report, labs).
Some things are technically correct 
but not what I would do (e.g. very few people in the US use the EOX regimen), 
so would need adjusting. 
I was a bit surprised that it went ahead and put in the general plan for CROSS too - those details are correct.

## Round 2: The Placeholder Marks

I asked Claude to replace the invented values with placeholder marks so I could fill them in later:

> That's pretty good. Instead of inventing vital signs, imaging reports, and lab values, please write it again to instead put in \*\*\* placeholder marks in these areas so I can fill them in later.

Claude obliged, creating a SOAP note template with *** all over the place. It was a bit too much, as you can see:

---

Sure, here's the revised SOAP note with placeholder marks:

S (Subjective):
*** yo M with newly diagnosed esophageal cancer presents to oncology clinic to establish care and discuss treatment options. 
Reports mild dysphagia to solid foods x *** weeks 
but denies significant weight loss, odynophagia, chest pain, nausea/vomiting, hematemesis, melena, hematochezia, or other GI symptoms. 
ROS negative except as above. 
PMH notable for ***. 
FH *** for GI malignancies. 
SH *** smoker, quit *** years ago, *** pack-year history. 
***, ***, lives ***. 
Medications include ***. 
*** allergies.

O (Objective):
Vitals: Temp *** F, BP ***/**, HR ***, RR ***, ***% RA, Wt *** lb, Ht *** in
General: ***. HEENT: ***. Neck: ***. CV: ***. Pulm: ***. Abd: ***. Ext: ***.
Recent EGD: Esophageal mass *** cm from incisors, partially obstructing lumen, biopsies c/w squamous cell carcinoma. 
CT chest/abd/pelvis: *** cm distal esophageal mass, obliterating ***% of lumen. 
*** cm regional lymph node. No distant metastases identified. 
Radiologist assessment: T***N***M***, clinical stage ***.
Labs: CBC: WBC ***, Hgb ***, Plt ***. CMP *** except ***. CEA ***.

A (Assessment):
- Esophageal squamous cell carcinoma, clinical stage *** (T***N***M***). Awaiting PET/CT for full staging and treatment planning.
- Dysphagia secondary to above. *** tolerating po currently without significant *** loss. Monitor symptoms, intake closely.
- *** on ***. Continue current therapy.
- Anemia, likely anemia of chronic disease but will evaluate as outpatient.

P (Plan):
1. Will obtain FDG-PET/CT scan to complete staging.
2. If no distant metastatic disease, recommend neoadjuvant chemoradiotherapy per CROSS regimen (carboplatin/paclitaxel q week x 5 + 41.4 Gy in 23 fractions). 
Discussed expected toxicities including fatigue, esophagitis, nausea, neutropenia and importance of close monitoring.
3. If metastatic disease identified, will pursue systemic chemotherapy, likely FOLFOX or EOX regimen, rather than local therapy. May require palliative measures for dysphagia (stent, dilation prn).
4. Check iron studies, B12, folate. Replace as indicated.
5. Nutrition consult. Encourage high calorie/protein foods.
6. RTC in *** week(s) to review PET/CT results and finalize treatment plan. Sooner prn for worsening dysphagia, intolerance of po.

---

## Round 3: The Goldilocks Zone

Finally, I hit what seems to be a sweet spot:

> Forget what I said, please only put in \*\*\* placeholders for vital signs and imaging. It's ok to make up values for everything else.

It still needs fixing, but isn't so full of \*\*\* that it's jarring (or impossible to parse - what does "*** on ***" mean? Anything, and nothing, that's what.)

---

Understood. Here's the updated SOAP note with *** placeholders for vital signs and imaging only:

S (Subjective):
62 yo M with newly diagnosed esophageal cancer presents to oncology clinic to establish care and discuss treatment options. 
Reports mild dysphagia to solid foods x 3 weeks but denies significant weight loss, odynophagia, chest pain, nausea/vomiting, hematemesis, melena, hematochezia, or other GI symptoms. 
ROS negative except as above. 
PMH notable for HTN, HLD, and GERD. 
FH neg for GI malignancies. 
SH former smoker, quit 10 years ago, 30 pack-year history. 
Married, retired accountant, lives at home with wife. 
Medications include lisinopril, atorvastatin, omeprazole. 
No known allergies.

O (Objective):
Vitals: Temp *** F, BP ***/**, HR ***, RR ***, ***% RA, Wt 180 lb, Ht 70 in
General: NAD, well-appearing. HEENT: PERRL, EOMI, oral mucosa moist. Neck: no LAD. CV: RRR, no m/r/g. Pulm: CTAB. Abd: soft, NT/ND, no masses. Ext: no c/c/e, 2+ pulses.
Recent EGD: Esophageal mass *** cm from incisors, partially obstructing lumen, biopsies c/w squamous cell carcinoma. 
CT chest/abd/pelvis: *** cm distal esophageal mass, obliterating ***% of lumen. *** cm regional lymph node. No distant metastases identified. 
Radiologist assessment: T***N***M***, clinical stage ***.
Labs: CBC: WBC 6.8, Hgb 11.5, Plt 225. CMP nl except Alb 3.2. CEA 5.2.

A (Assessment):
- Esophageal squamous cell carcinoma, clinical stage III (T3N1M0). Awaiting PET/CT for full staging and treatment planning.
- Dysphagia secondary to above. Tolerating po currently without significant weight loss. Monitor symptoms, intake closely.
- H/o GERD on omeprazole. Continue current therapy.
- Anemia, likely anemia of chronic disease but will evaluate as outpatient.

P (Plan):
1. Will obtain FDG-PET/CT scan to complete staging.
2. If no distant metastatic disease, recommend neoadjuvant chemoradiotherapy per CROSS regimen (carboplatin/paclitaxel q week x 5 + 41.4 Gy in 23 fractions). 
Discussed expected toxicities including fatigue, esophagitis, nausea, neutropenia and importance of close monitoring.
3. If metastatic disease identified, will pursue systemic chemotherapy, likely FOLFOX or EOX regimen, rather than local therapy. May require palliative measures for dysphagia (stent, dilation prn).
4. Check iron studies, B12, folate. Replace as indicated.
5. Nutrition consult. Encourage high calorie/protein foods.
6. RTC in 1 week to review PET/CT results and finalize treatment plan. Sooner prn for worsening dysphagia, intolerance of po.

---


## The Verdict

Overall, writing the first LLM prompt, 
copying the result into the chart, 
and adjusting it for correctness would take about 5 minutes. 
Improving the prompt as I did adds some time, 
but you can keep whatever prompt engineering bits you figure out for future use.
You could also build yourself a custom template and ask it to fill it out,
which would likely prevent many of the hallucinations 
(e.g. prepopulate placeholders for the vitals, labs, imaging,
and tell the LLM to leave those alone).

Really, not bad for concise yet comprehensive documentation of a new consult. 
For subsequent visits, copying the note forward 
and adjusting for new details would be more efficient than going back to the LLM.

Here's the crazy thing about all of the above: 
the LLM did not ingest any PHI whatsoever - 
I gave it a general description of the case only.
No HIPAA is violated. 
No EMR integration is necessary - this would work as well in CPRS as it would in Epic.
Together, these two features are powerful, and means you can use this starting today. 

I know a lot of organizations are nervous about LLMs and AI in medicine in general,
but I'm not certain I understand the hesitation in this particular arena.
The responsibility is still yours for accurate documentation.
The plan is also still yours, developed together with the patient.
Many efficiencies can be gained without needing HIPAA-violating specifics,
and without somehow asking the AI to become the doctor.

Also, as a friend pointed out the other day,
many, many clinical notes are chock full of mistakes,
whether typos or things copied forward and not corrected,
or more egregious things like true mistakes in clinical reasoning.
It seems to me, based on my brief experience,
that using a smarter Clippy would serve more to cut down these kinds of errors,
rather than propagating sins worse than those we already commit.
No electronic tool, whether a copy button in Epic or a powerful LLM,
is any kind of replacement for being a good clinician or an excuse for shoddy work.
But, on the same token\*, I also don't insist on counting RBCs myself for every CBC I order - 
this is a good technological cognate, 
since I need to be able to recognize the situations in which the automated counter doesn't tell the whole truth,
know when the results in the computer are fishy,
and be able to do the visual inspection myself if necessary,
but most of the time I can just order the CBC and go on my merry way.

\* ha, "token." There's an LLM dad joke for ya.
