#!/bin/bash

GAME=../FoundersMercy.inform/Build/output.ulx

if [ $# -eq 0 ] ; then

  for script in scripts-reg/*.script ; do
    echo "**" $script
    python ../tools/regtest.py ${script} --game "${GAME}" --rem --terp ../tools/interpreters/bin/rem-git
  done

else

  for script in "$@" ; do
    echo "**" $script
    python ../tools/regtest.py -v ${script} --game "${GAME}" --rem --terp ../tools/interpreters/bin/rem-git
  done

fi
