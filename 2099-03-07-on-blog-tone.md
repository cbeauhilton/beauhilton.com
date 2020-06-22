---
layout: post
title: "On blog tone"
toc: true
image: https://source.unsplash.com/OfMq2hIbWMQ
tags:
  - carnivalesque
  - writing
---

## What's a blog for, anyway?



The main problem with the approach I outlined was how to get those nicely updated paragraphs into the document you are sharing with colleagues.

Medicine, in particular, seems wed to Microsoft Word documents for manuscripts. Word does not have a great way to include text from arbitrary files, forcing the physician-scientist to manually copy and paste those beautifully automated paragraphs. As I struggled with this, I thought (here cue Raymond Hettinger), "There must be a better way."

Turns out that better way exists, and it is R Markdown.

Though I was at first resistant to learning about R Markdown, mostly because I am proficient in Python and thought the opportunity cost for learning R at this point would be too high, as soon as I saw it demoed I changed my tune. Here's why.

## Writing text
- R Markdown is mostly markdown.
	- Markdown is by far the easiest way to write plaintext documents, especially if you want to apply formatting later on without worrying about the specifics while you're writing (e.g. `#` just specifies a header - you can decide how you want the headers to look later, and that styling will automatically be applied).
	- Plaintext is beautiful. It costs nearly nothing in terms of raw storage, and is easy to keep within a version control system. Markdown plaintext is human-readable whether or not the styling has been applied. Your ideas will never be hidden in a proprietary format that requires special software to read.
	- I had been transitioning to writing in Markdown anyway, so +1 for R Markdown.
- R Markdown is also a little LaTeX.
	- LaTeX is [gorgeous](https://tex.stackexchange.com/questions/1319/showcase-of-beautiful-typography-done-in-tex-friends) and wonderful, the most flexible and expressive of all the typesetting tools (though not as fast as our old friend Groff...). It also has a steeper learning curve than Markdown, and is not so pretty on the screen in its raw form. R Markdown lets you do the bulk of your work in simple Markdown, then seamlessly invoke LaTeX when you need something a little fancier.
- R Markdown is also a little HTML.
	- HTML is also expressive, and can be gorgeous and wonderful. It is a pain to write. As with LaTeX, you can simply drop in some HTML where you need it, and R Markdown will deal with it as necessary.
- R Markdown is academic-friendly.
	- Citations and formatting guidelines for different journals are the tedious banes of any academic's existence. R Markdown has robust support for adding in citations that will be properly formatted in any desired style, just by changing a tag at the top of the document. Got a rejection from Journal 1 and want to submit to Journal 2, which has a completely different set of citation styles and manuscript formatting? NBD.

## Writing code
R Markdown, as the name implies, can also run R code.
Any analysis you can dream of in R can be included in your document, and you can choose whether you want to show the code and its output, the output alone, or the code alone.
People will think you went through all the work of making that figure, editing it in PowerPoint, screenshotting it to a .png, then dropping that .png file into your manuscript, but the truth is...
you scripted all of that, so the manuscript itself made the .png and included it where it needed to go.

R Markdown is by no means restricted to R code.
This is the killer app that won me over.
Simply by specifying that a given code block is Python,
and installing a little tool (`reticulate`) that allows R to interface with Python,
I can run arbitrary Python code within the document and capture the output however I want.
That results paragraph? Sure.
Fancy images of predictions from my machine learning model? But of course.

If you don't want to use any R code ever, that's fine. R Markdown doesn't mind.
Use SAS, MATLAB (via Octave), heck, even bash scripts - the range of language support is fantastic.

## Working with friends
R Markdown can be compiled to pretty much any format you can dream of.
My current setup simultaneously puts out an HTML document (that can be opened in any web browser), a PDF (because I love PDFs), and (AND!) a .docx Word file,
all beautifully formatted, on demand, whenever I hit my keyboard shortcut. I can preview the PDF or HTML as I write, have a .docx to send to my PI, and life is good.

Also, because you can write in any programming language, you can easily collaborate between researchers that are comfortable in different paradigms.
You can pass data back and forth between your chosen languages (for me, R and Python),
either directly or by saving intermediate data to a format that both languages can read.

## Automating tasks
Many analyses and their manuscripts, especially if they use similar techniques (e.g. survival modeling), are rather formulaic.
Many researchers have scripts they keep around and tweak for new analyses revolving around the same basic subject matter or approach.
With R Markdown, your entire manuscript becomes a runnable program, further automating the boring parts of getting research out into the open.

One of the [first introductions](https://www.youtube.com/watch?v=MIlzQpXlJNk) I had to R Markdown shared the remarkable idea of setting the file to run on a regular basis,
generating a report based on any updated data,
and then sending this report to all the interested parties automatically.
While much academic work could not be so fully automated, parts of it certainly can be.

Perhaps your team is building a database for outcomes in a given disease, and has specified the analysis in great detail beforehand.
One of my mentors gives the advice that in any project proposal you should go as far as to mock up the results section,
including all figures,
so you make sure you are collecting the right data.
If this was done in an R Markdown document rather than a simple Word document,
you could have large parts of the template manuscript
become the real manuscript as the database fleshes out over time.
Then when it's done, look over the data, make additions and subtractions as needed,
write the discussion sections, and send it in.
