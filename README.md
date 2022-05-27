Song annotation protocol
================
<center>
<font size="4"><a href="http://marceloarayasalas.weebly.com/">Marcelo
Araya-Salas, PhD</a></font>
</center>
<center>
26-05-2022
</center>

<!-- Short Description  -->

This is a short description of the project

*Updated on 2022-05-26 18:35:50*

<!-- README.md is generated from README.Rmd. Please edit that file -->

## Table of contents

-   [General info](#Analysis%20workflow)
    -   [Analyses](#Analyses)
        -   [To do list](#to-do-list)
            -   [Contact](#contact)

## 

 

<div class="alert alert-info">

## Purpose

-   This protocol explains the steps required to conduct an objective
    assessment of the vocal behavior of several bird species using
    recordings from the Macaulay Library

</div>

 

<div class="alert alert-warning">

Please follow the instructions as close as possible to ensure the data
would be comparable across species regardless of who did the analysis

</div>

 

# Analysis workflow

### Finding the right file

1.  Choose a species assigned to you (“assigned to” column in
    “recordings_metadata.xlsx” file):

<img src="./scripts/data_sheet.png" width="100%" />  

1.  Look up the species in <https://ebird.org/explore> to get an example
    of the species typical song. In this example the species is
    *Phaethornis longirostris*:

<img src="./scripts/ebird.png" width="100%" />  

1.  click on the “listen” button:

<img src="./scripts/lbh.png" width="100%" />  

1.  Look for the example that matches the ID number in our data base:

<img src="./scripts/spectro_marked.png" width="100%" />  

1.  Look at the vocalization description for that recording on ebird and
    write it down in “vocalization_type” column in
    “recordings_metadata.xlsx” file:

<img src="./scripts/spectro_marked2.png" width="100%" />  

<div class="alert alert-warning">

The spectrogram that is shown contains what experts have identified as a
good example of the species’ vocalization, so it will be used to define
which signals in our sound files will be annotated

</div>

 

### Annotating bird songs

1.  Open Raven

2.  In Raven you should open the sound files: Ctrl + O (or go to file →
    open sound files)

3.  Go to the folder with the recordings (“./recordings/”).

4.  Open the sound file containing the Macaulay Library ID

5.  When you open the file a “Configure New Sound Window” window
    appears, in the “Window Preset” window, choose the
    “bird_song_evolution” option and then click “OK” (if this window
    does not open when loading a file you must go to View → Window
    Preset and select “bird_song_evolution”)

6.  Examine the recording to determine the position of the signals that
    are shown in the spectrogram on the ebird web page

7.  Determine the sequence of elements of which the song is composed. *A
    song can be defined by the repetition of a sequence of elements*
    (even if the sequence is a single element) *and/or by long silences*
    (much greater than the silences between elements within a song).
    Sequence repetitions can vary in the composition and number of
    repeats of individual elements. Again, the example in the ebird web
    page should be used as a guide to determine vocalization structure.

 

<div class="alert alert-info">

## Example

Let say we have a vocalization like this:

<font size="4">abcdab abcdab abcdab abcdab abcdab abcdab abcdab abcdab
abcdab</font>

In this example every sequence of 6 elements that is separated from
others by a wide gap will be called a song. You will have to choose 5 of
those. Something like this (**bold** means analyzed):

<font size="4">**abcdab** abcdab **abcdab abcdab** abcdab **abcdab**
abcdab **abcdab abcdab** </font>

</div>

 

1.  Ensure that they belong to a single individual

2.  **Select the beginning and end of each of the elements for up to 5
    songs** (if available). Songs do not have to be consecutive. If
    there are more songs available in the recordings and they vary
    considerably you can try to measure more songs.

3.  Make selections on the spectrogram by adjusting both time and
    frequency. If the songs have a lot of harmonics the high frequency
    can extend more (high frequency accuracy is not relevant when there
    are many harmonics).

4.  Set the beginning and end (the margins of the selection box) right
    at the beginning and end of the element, trying not to include the
    reverberations at the end of the element

5.  Avoid annotating songs in which the elements overlap other sounds

6.  If the recording was made on 2 channels, make the selections only on
    the first channel (the one above).

7.  Once you commit the selection (pressing “Enter”), **each element
    must be tagged with the song to which it belongs** (Raven will ask
    for the tag each time a new selection is entered). The label must be
    a number for the song and a letter for the element (eg “1a” for
    element “a” in song “1”).

8.  Different elements should be labeled with different letters (so
    elements that look the same should be labeled with the same letter)

9.  Save the selection in the default folder suggested by Raven. When
    you try to close the audio file Raven will ask if they want to save
    the selection, just click OK and keep the suggested file name
    unchanged.

10. Once you are done with the species:

    1.  enter the information in “recordings_metadata.xlsx”.
    2.  If no song were found in the available recordings add a comment
        (“comments” column)

11. Start with a new species

At the end of the analysis session:

1.Copy the selection files to “./selections”.

1.  If there is something inconsistent or poorly explained in this
    protocol please let us know!

 

<div class="alert alert-info">

-   Good performance on detecting zebra finch songs: F1 score was 0.95
    for the training data set and 0.96 for the testing data

</div>

 

------------------------------------------------------------------------

## Analysis

-   Analysis 1

## In progress

-   Something not finished yet

## To-do list

-   Do the next analysis

## Status

Project is: *in progress*

## Contact

Created by [Autor name](website_URL)
