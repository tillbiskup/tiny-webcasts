#!/bin/bash

function createOutputDirectory() {
	OUTDIR="$1"

	# Check whether output directory exists and if so, ask user how to proceed
	# It the user continues, the output directory will be deleted and recreated.
	if [[ -e ${OUTDIR} ]]; then 
	    echo "The output directory ${OUTDIR} exists already"
	    echo "If you continue, it will be deleted and recreated."
	    read -p "Would you really want to continue? (y/N): " confirm
	    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
			echo " "
			rm -r ${OUTDIR}
	    else
			echo "Process aborted"
			exit 1
	    fi
	fi

	# Create output directory and copy *wav and *pdf there
	mkdir -p ${OUTDIR}

	# Copy all WAV files not having "raw" in their name
	ls -1 *.wav | grep -v 'raw' | while read filename
		do cp ${filename} ${OUTDIR}/
	done

	# Copy pdf file (presumably the presentation)
	pdffileCount=$(countFiles "*.pdf")
	if [[ ${pdffileCount} = 0 ]]; then
	    echo "You seem not to have a PDF file (for your presentation)."
	    echo "This will create problems in the next step."
	    echo "Please, add a PDF file with your slides to the output directory."
	    echo " "
	else
		cp *.pdf ${OUTDIR}/
	fi

	# Copy metadata file
	metadatafileCount=$(countFiles "*meta.txt")
	if [[ ${metadatafileCount} = 0 ]]; then
	    echo "You seem not to have a metadata file."
	    echo "This will create problems in the next step."
	    echo "Please, create a metadata file, e.g. issuing 'twc metadata'."
	    echo " "
	else
		cp *meta.txt ${OUTDIR}/
	fi

	# Tell the user how to proceed
	echo "# Created output directory ${OUTDIR} and copied WAV and PDF file(s) therein."
}
