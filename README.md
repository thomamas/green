# green

This is the source code for the game Founder's Mercy to be built
with Inform 7 build 6M62.

Copyright © 2018 Thomas Insel <tinsel@tinsel.org>
http://tinsel.org/IF/

This work is licensed under a Creative Commons Attribution 4.0 International License.
https://creativecommons.org/licenses/by/4.0/	

## Release Instructions

1. Print `Map.graffle` as `Map.pdf` and save it into `Green.materials`

2. Build for release with Inform

3. After build, modify `index.html` with a line break and Unicode emoji:

    <br>
    <li>&#x1F579;&nbsp;<a href="play.html">Play In-Browser</a> <span class="filetype">(link)</span></li>

## Release with pictures if relevant:


https://github.com/erkyrath/quixe/wiki/Quixe-Graphics-Support


    Chapter 15 - Picture Experiment (for Glulx only)

    [todo]

    Include Glulx Image Centering by Emily Short. Include Basic Screen Effects by Emily Short.

    To show the ending picture:
      say "[paragraph break][paragraph break]";
      display figure at end centered;

    Figure at end is the file "p2.png". [todo - credits]

## Extensions

See https://github.com/i7/extensions, but we have copied in any extension that doesn't ship
with Inform 7. Also, extensions by Thomas Insel are local.
