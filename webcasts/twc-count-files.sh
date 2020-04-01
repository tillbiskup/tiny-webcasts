#!/bin/bash

# This idea to count files comes from stackoverflow.com:
#   https://stackoverflow.com/a/33891876
# See there for a full discussion of pros and cons

FILEPATTERN="$1"

file_count=`ls 2>/dev/null -Ubad1 -- ${FILEPATTERN} | wc -l`

echo ${file_count}
