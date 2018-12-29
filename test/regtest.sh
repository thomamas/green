#!/bin/bash

#GAME="../FoundersMercy.materials/Release/Founder's Mercy.gblorb"
GAME=../FoundersMercy.inform/Build/output.ulx

for script in scripts-reg/*.script ; do
  echo "**" $script
  python ../tools/regtest.py ${script} --game "${GAME}" --rem --terp ../tools/interpreters/bin/rem-git
done
