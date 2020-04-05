#!/bin/bash

function createMetadataTemplate() {
	metadataFile="$1"

	if [[ -e ${metadataFile} ]]; then
	    echo "The metadata file ${metadataFile} exists already."
	    echo "If you continue, it will be deleted and recreated."
	    read -p "Would you really want to continue? (y/N): " confirm
	    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
			echo " "
			rm ${metadataFile}
	    else
			echo "Process aborted"
			exit 1
	    fi
	fi

	echo """;FFMETADATA1
title=My First Tiny Webcast
artist=John Doe
album=Tiny Webcasts
date=2020/04/04
track=1/42
genre=Lectures""" \
	> ${metadataFile}
	
	echo "Created metadata file '${metadataFile}'."
}
