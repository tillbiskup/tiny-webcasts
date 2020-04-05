#!/bin/bash

function createChapterMetadataTemplate() {
	metadataFile="$1"
	numberOfSlides="$2"

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

	echo """# Chapter metadata
#
# Webcasts can contain chapter marks
# allowing users to navigate more easily within your webcast.
#
# If you like to add chapters to your webcast,
# modify the file below all the lines starting with '#'.
#
# NOTE: The '#' sign marks comment lines.
#       Each line starting with '#' will be ignored
#       when processing your chapter metadata.
#
# For each chapter, create a title using "title=\<your title\>",
# followed by as many slides as belong to this chapter.
#
# NOTE: The lines containing 'slide#' represent each a slide.
#       Numbers are just for your convenience.
#       However, do NOT delete one of these lines,
#       as they need to match
#       the number of slides in your presentation.
#
# To add a new chapter, insert a line "title=\<chapter title\>"
# right before the slide you want to start the chapter with.
#
# NOTE: If you do not change the first title
#       to something different than 'TBD',
#       your whole chapter metadata will be ignored.
#
title=TBD""" \
	> ${metadataFile}
	
	for (( slide=1; slide<=${numberOfSlides}; slide++ )) 
	do 
		echo "  slide${slide}"
	done >> ${metadataFile}
	
	echo "Created metadata file '${metadataFile}'."
}
