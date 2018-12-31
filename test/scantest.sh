#!/bin/bash

git_exe=../tools/interpreters/bin/cheap-git
gblorb=../FoundersMercy.inform/Build/testing.ulx

echo "super scan" | ${git_exe} "${gblorb}" > scantest.out
diff scantest.target scantest.out
