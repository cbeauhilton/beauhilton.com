---
layout: post
title: "On Old Software"
toc: false
image: https://en.wikipedia.org/wiki/Vi#/media/File:Vi_source_code_join_line_logic.png
categories:
  - AI for MDs
tags:
  - coding
  - software
  - history
  - laziness
  - groff
  - latex
  - vim
  - gopher
---

 a later date.[^4]

# Typesetting

# Text editing

# Internet


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
