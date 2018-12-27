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

## Release Instructions

Edit `Makefile` and run `make Release` to build a complete release directory or `make Sync` to upload to AWS S3.

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
