# Founder's Mercy

This is the source code for the game Founder's Mercy to be built
with Inform 7 build 6M62.

Copyright © 2018 Thomas Insel <tinsel@tinsel.org>
http://tinsel.org/IF/

This work is licensed under a Creative Commons Attribution 4.0 International License.
https://creativecommons.org/licenses/by/4.0/	

## Tools

You should be able to build Founder's Mercy on any supported Inform 7 platform, but the
release and testing automation is designed for macOS (tested with 10.13) and the following 
tools:

* Inform 7 build 6M62 -- http://inform7.com/download/
* OmniGraffle -- https://www.omnigroup.com/omnigraffle/
* AWS Command Line Interface -- https://aws.amazon.com/cli/
* Command line developer tools -- `xcode-select --install`

### Ubuntu Linux

* `apt-get install git make gcc python`
* Get `I7_6M62_Linux_all.tar.gz`, expand, and follow isntall instructions
* OmniGraffle build won't work, of course, but `make test` should be fine.

## Release Instructions

Edit `Makefile` as necessary and...

* `make release` -- build release
* `make test` -- run tests
* `make clean` -- remove build artifacts
* `make cleaner` -- remove build artifacts and test interpreters
* `make sync` -- upload to AWS S3

All of this is really only necessary for automating a reasonable test suite.
Otherwise shift-command-R works fine.

## Extensions

The following extensions, which are not bundled with Inform 7 build 6M62,
are included from https://github.com/i7/extensions/

    FoundersMercy.materials/Extensions/Erik Temple/Real-Time Delays.i7x
    FoundersMercy.materials/Extensions/Juhana Leinonen/Object Response Tests.i7x
    FoundersMercy.materials/Extensions/Sean Turner/Plugs and Sockets.i7x

And these are local:

    FoundersMercy.materials/Extensions/Thomas Insel/Machines.i7x
    FoundersMercy.materials/Extensions/Thomas Insel/Simple Exit Lister.i7x
    FoundersMercy.materials/Extensions/Thomas Insel/Testing Commands.i7x

## Independent Study

* https://oikofuge.com/coriolis-effect-rotating-space-habitat/
* https://www.artificial-gravity.com/sw/SpinCalc/
* http://www.vintagecomputing.com/index.php/archives/174/old-school-copy-protection-schemes

* See https://github.com/i7/extensions, but we have copied in any extension that doesn't ship with Inform 7. Also, extensions by Thomas Insel are local.
* See <https://github.com/erkyrath/quixe/wiki/Quixe-Graphics-Support> for more on adding images to Quixe.

* http://forums.omnigroup.com/showthread.php?t=146
* http://omnigraffletips.blogspot.com/2013/05/using-applescript-to-reposition-objects.html
* https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/conceptual/ASLR_fundamentals.html
* https://discussions.apple.com/thread/3088443 -- preview to combine PDFs
