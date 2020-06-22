---
layout: post
title: "Python, Write My Paper"
toc: false
image: /images/unsplash-grey-flowerbuds.jpg
categories:
  - AI for MDs
tags:
  - coding
  - python
  - fstring
  - laziness
---

![laziness is prioritization]({{ site.url }}/images/pixabay-lazy-1.png){:class="img-responsive"}

Computers are good at doing tedious things.[^1]

Many of the early advances in computing were accomplished to help people do tedious things they didn't want to do, like the million tiny equations that make up a calculus problem.[^2] It has also been said, and repeated, and I agree, that one of the three virtues of a good programmer is laziness.[^3]

One of the most tedious parts of my job is writing paragraphs containing the results of lots of math relating to some biomedical research project. To make this way easier, I use a core Python utility called the `f-string`, in addition to some other tools I may write about at a later date.[^4]

## The problem

First, here's an example of the kinds of sentences that are tedious to type out, error prone, and have to be fixed every time something changes on the back end (--> more tedium, more room for errors).

"In the study period there were 1,485,880 hospitalizations for 708,089 unique patients, 439,696 (62%) of whom had only one hospitalization recorded.
The median number of hospitalizations per patient was 1 (range 1-176, [1.0 , 2.0])."

The first paragraph of a results section of a typical medical paper is chock-full of this stuff. If we find an error in how we calculated any of this, or find that there was a mistake in the database that needs fixing (and this happens woefully often), all of the numbers need replaced. It's a pain.
How might we automate the writing of this paragraph?[^5]

## The solution

First, we're going to do the math (which we were doing anyway), and assign each math-y bit a unique name. Then we're going to plug in the results of these calculations to our sentences.
If you're not familiar with Python or Pandas, don't worry - just walk through the names and glance at the stuff after the equals sign, but don't get hung up on it.
The basic syntax is:

```python
some_descriptive_name = some_dataset["some_column_in_that_dataset"].some_mathy_bit()
```

After we generate the numbers we want, we write the sentence, insert the code, and then use some tricks to get the numbers in the format we want.

In most programming languages, "string" means "text, not code or numbers." So an `f-string` is a `formatted-string`, and allows us to insert code into blocks of normal words using an easy, intuitive syntax.

Here's an example:

```python
name_of_word_block = f"""Some words with some {code} we want Python to evaluate,
maybe with some extra formatting thrown in for fun,
such as commas to make long numbers more readable ({long_number:,}),
or a number of decimal places to round to
({number_with_stuff_after_the_decimal_but_we_only_want_two_places:.2f},
or a conversion from a decimal to a percentage and get rid of everything after the '.'
{some_number_divided_by/some_other_number*100:.0f}%)."""
```

First, declare the name of the block of words. Then write an `f`, which will tell Python we want it to insert the results of some code into the following string, which we start and end with single or triple quotes (triple quotes let you break strings into multiple lines).
Add in the code within curly brackets, `{code}`, add some optional formatting after a colon, `{code:formatting_options}`, and prosper.

As you can see from the last clause, you can do additional math or any operation you want within the `{code}` block. I typically like to do the math outside of the strings to keep them cleaner looking, but for simple stuff it can be nice to just throw the math in the f-string itself.

Here's the actual code I used to make those first two sentences from earlier. First the example again, then the math, then the f-strings.[^7]

"In the study period there were 1,485,880 hospitalizations for 708,089 unique patients, 439,696 (62%) of whom had only one hospitalization recorded.
The median number of hospitalizations per patient was 1 (range 1-176, [1.0 , 2.0])."

```python
n_encs = data["encounterid"].nunique()
n_pts = data["patientid"].nunique()

pts_one_encounter = df[df["encounternum"] == 1].nunique()
min_enc_per_pt = df["encounternum"].min()
q1_enc_per_pt = df["encounternum"].quantile(0.25)
median_enc_per_pt = df["encounternum"].median()
q3_enc_per_pt = df["encounternum"].quantile(0.75)
max_enc_per_pt = df["encounternum"].max()

sentence01 = f"In the study period there were {n_encs:,} hospitalizations for {n_pts:,} unique patients, {pts_one_encounter:,} ({pts_one_encounter/n_pts*100:.0f}%) of whom had only one hospitalization recorded. "
sentence02 = f"The median number of hospitalizations per patient was {median_enc_per_pt:.0f} (range {min_enc_per_pt:.0f}-{max_enc_per_pt:.0f}, [{q1_enc_per_pt} , {q3_enc_per_pt}]). "
```

If you want to get real ~~lazy~~ ~~fancy~~ lazy, you can combine these sentences into a paragraph, save that paragraph to a text file, and then automatically include this text file in your final document.

```python
paragraph01 = sentence01 + sentence02
results_text_file = "results_paragraphs.txt"
with open(results_text_file, "w") as text_file:
    print(paragraph01, file=text_file)
```

To automatically include the text file in your document, you'll have to figure out some tool appropriate to your writing environment. I think there's a way to source text files in Microsoft Word, though I'm less familiar with Word than other document preparation tools such as LaTeX. If you know how to do it in Word, let me know (or I'll look into it and update this post).

Here's how to do it in LaTeX. Just put `\input` and the path to your text file at the appropriate place in your document:[^6]

```latex
\input{"results_paragraphs_latex.txt"}
```

With this workflow, I can run the entire analysis, have all the mathy bits translated into paragraphs that include the right numbers, and have those paragraphs inserted into my text in the right spots.

I should note that there are other ways to do this. There are ways of weaving actual Python and R code into LaTeX documents, and RMarkdown is a cool way of using the simple syntax of Markdown with input from R. I like the modular approach outlined here, as it lets me just tag on a bit to the end of the Python code I was writing anyway, and integrate it into the LaTeX I was writing anyway. I plan to use this approach for the foreseeable future, but if you have strong arguments for why I should switch to another method, I would love to hear it, especially if it might better suit my laziness.

Addendum: As I was writing this, I found a similar treatment of the same subject. It's great, with examples in R and Python. [Check it out](https://jabranham.com/blog/2018/05/reporting-statistics-in-latex/).

[^1]: _Automate the Boring Stuff_ by Al Sweigart is a great introduction to programming in general, and is available for free as a [hypertext book](https://automatetheboringstuff.com/). It teaches exactly what its name denotes, in an interactive and easy-to-understand combination of code and explanation.

[^2]: I'm revisiting [Walter Isaacson's _The Innovators"](https://en.wikipedia.org/wiki/The_Innovators_(book)), which I first listened to before I got deeply into programming, and on this go-through I am vibing much harder with the repeated (and repeated) (and again repeated) impetus for building the first and subsequent computing machines: tedious things are tedious.

[^3]: The other two are impatience and hubris. Here is one of the [most lovely websites on the internet](http://threevirtues.com/)

[^4]: For example, TableOne, which makes the (_incredibly_ tedious) task of making that classic first table in any biomedical research paper _so much easier_. Here's a link to [TableOne's project page](https://github.com/tompollard/tableone), which also includes links out to examples and their academic paper on the software.

[^5]: Assign it to a resident, of course.

[^6]: You may have noticed that the name of this file is "results_paragraphs_latex.txt" rather than "results_paragraphs.txt," and that's because LaTeX needs a little special treatment if you're going to use the percentage symbol. LaTeX uses the percentage symbol as a comment sign, meaning that anything after the symbol is ignored and left out of the document. You have to "escape" the percentage symbol with a slash, like this: `\%`. I have this simple bit of code that converts the normal text file into a LaTeX-friendly version:

    ```python
    # make a LaTeX-friendly version (escape the % symbols with \)
    # Read in the file
    with open(results_text_file, "r") as file:
        filedata = file.read()
    # Replace the target string
    filedata = filedata.replace("%", "\%")
    # Write the file
    text_file_latex = "results_paragraphs_latex.txt"
    with open(text_file_latex, "w") as file:
        file.write(filedata)
    ```

[^7]: You may have noticed there are two datasets I'm pulling from for this, "data," which includes everything on the basis of _hospitalizations_, and "df," short for "dataframe," which is a subset of "data" that only includes each _patient_ once (rather than a new entry for every hospitalization), along with a few other alterations that allow me to do patient-wise calculations.
