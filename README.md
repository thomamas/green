# Founder's Mercy

This is the source code for the game Founder's Mercy to be built
with Inform 7 build 6M62.

Copyright © 2018 Thomas Insel <tinsel@tinsel.org>
http://tinsel.org/IF/

This work is licensed under a Creative Commons Attribution 4.0 International License.
https://creativecommons.org/licenses/by/4.0/	

## Release Instructions

1. Assemble `Map.pdf` as documented in [`Feelies/WORKFLOW.txt`](./Feelies/WORKFLOW.txt).

2. Build for release with Inform

3. Add picture info:

      python tools/blorbtool.py FoundersMercy.materials/Release/Founder\'s\ Mercy.gblorb giload FoundersMercy.materials/Release/interpreter interpreter

4. `aws s3 sync --acl=public-read Release/ s3://assets.tinsel.org/assets/IF/FM/`
   (or `FM-beta1-release4` or similar)

## Release Process Notes

`Makefile` automates 2-3 so far.

See <https://github.com/erkyrath/quixe/wiki/Quixe-Graphics-Support>
for more on Step 3.

## Extensions

See https://github.com/i7/extensions, but we have copied in any extension that doesn't ship
with Inform 7. Also, extensions by Thomas Insel are local.

## Independent Study

* https://oikofuge.com/coriolis-effect-rotating-space-habitat/
* https://www.artificial-gravity.com/sw/SpinCalc/
* http://www.vintagecomputing.com/index.php/archives/174/old-school-copy-protection-schemes

