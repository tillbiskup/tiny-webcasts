#!/bin/bash

# This idea to count files comes from stackoverflow.com:
#   https://stackoverflow.com/a/33891876
# See there for a full discussion of pros and cons
function countFiles() {
	FILEPATTERN="$1"

	# file_count=`ls 2>/dev/null -Ubad1 -- ${FILEPATTERN} | wc -l`
	file_count=`ls ${FILEPATTERN} 2>/dev/null | wc -l`

	echo ${file_count}
}
