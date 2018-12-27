#!/bin/bash

git_exe=../tools/interpreters/bin/cheap-git
#gblorb=../FoundersMercy.materials/Release/Founder\'s\ Mercy.gblorb  # or should we use the Build directory? or release for testing? or ???
gblorb=../FoundersMercy.inform/Build/output.gblorb

touch testing.glkdata

for script in scripts/*.in ; do
  echo "* " ${script}

  target=`echo ${script} | sed s/\.in$/\.target/`
  out=`echo ${script} | sed s/\.in$/\.out/`

  ${git_exe} "${gblorb}" < ${script} > ${out}
  diff ${target} ${out}
done

rm testing.glkdata
