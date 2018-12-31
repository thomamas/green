#!/bin/bash

git_exe=../tools/interpreters/bin/cheap-git
gblorb=../FoundersMercy.inform/Build/testing.ulx

touch testing.glkdata

for script in scripts-comp/*.in ; do
  echo '*' ${script}

  target=`echo ${script} | sed s/\.in$/\.target/`
  out=`echo ${script} | sed s/\.in$/\.out/`

  ${git_exe} "${gblorb}" < ${script} > ${out}
  diff ${target} ${out} | grep -v "Inform 7 build 6M62"
done

rm testing.glkdata
