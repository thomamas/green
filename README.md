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

3. `aws s3 sync --acl=public-read Release/ s3://assets.tinsel.org/assets/IF/FM/`
   (or `FM-beta1-release4` or similar)

### Adding Picturs

If relevant, read <https://github.com/erkyrath/quixe/wiki/Quixe-Graphics-Support>.

## Extensions

See https://github.com/i7/extensions, but we have copied in any extension that doesn't ship
with Inform 7. Also, extensions by Thomas Insel are local.

## Independent Study

* https://oikofuge.com/coriolis-effect-rotating-space-habitat/
* https://www.artificial-gravity.com/sw/SpinCalc/
