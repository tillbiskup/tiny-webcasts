#!/bin/bash

TMPDIR=tmp

# Check whether temporary directory exists and if so, ask user how to proceed
# It the user continues, the temporary directory will be deleted and recreated.
if [[ -e ${TMPDIR} ]]; then 
    echo "The temporary directory ${TMPDIR} exists already"
    echo "If you continue, it will be deleted and recreated."
    read -p "Would you really want to continue? (y/N): " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        echo " "
        rm -r ${TMPDIR}
    else
        echo "Process aborted"
        exit 1
    fi
fi

# Create temporary directory and copy *wav and *pdf there
mkdir -p ${TMPDIR}

# Copy all WAV files not having "raw" in their name
ls -1 *.wav | grep -v 'raw' | while read filename
	do cp ${filename} ${TMPDIR}/
done

# Copy pdf file (presumably the presentation)
if [ ! -f *pdf ]; then
    echo "You seem not to have a PDF file (for your presentation)."
    echo "This will create problems in the next step."
    echo "Please, add a PDF file with your slides to the temporary directory."
    echo " "
else
	cp *pdf ${TMPDIR}/
fi

# Tell the user how to proceed
echo "Temporary directory ${TMPDIR} created and WAV and PDF file(s) copied therein."
echo "Next, change into this directory by typing"
echo "  cd ${TMPDIR}"
echo "Afterwards you may start preparing your webcast by typing"
echo "  twc prepare"
