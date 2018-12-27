#!/bin/bash

touch testing.glkdata
python ../tools/regtest.py --rem regtest.script --game "../FoundersMercy.materials/Release/Founder's Mercy.gblorb" --terp ../tools/interpreters/bin/rem-git
rm testing.glkdata
