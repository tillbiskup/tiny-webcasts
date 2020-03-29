#!/bin/bash

TMPDIR=tmp

# Create temporary directory and copy *wav and *pdf there
mkdir -p ${TMPDIR}

# Copy all WAV files not having "raw" in their name
ls -1 *.wav | grep -v 'raw' | while read filename
	do cp ${filename} ${TMPDIR}/
done

#Copy pdf file (presumably the presentation)
cp *pdf ${TMPDIR}/
