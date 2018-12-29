#!/bin/bash

git_exe=../tools/interpreters/bin/cheap-git
gblorb=../FoundersMercy.inform/Build/output.ulx

touch testing.glkdata

for script in scripts-comp/*.in ; do
  echo '*' ${script}

  target=`echo ${script} | sed s/\.in$/\.target/`
  out=`echo ${script} | sed s/\.in$/\.out/`

  ${git_exe} "${gblorb}" < ${script} > ${out}
  diff ${target} ${out}
done

rm testing.glkdata
