#!/bin/bash

function createChapterMetadata() {
    userChapterMetadataFilename=$1 #chaptermeta.txt
    outfile=$2 #test.txt
    
    notEditedIdentifier="title=TBD"
    audioFileExtension=m4a
    
    local _durationsFilename="$(mktemp)"
    local _tmpChaptermetaFilename="$(mktemp)"
    
    # Check if user has edited the chapter metadata
    if [[ $(fgrep -c "${notEditedIdentifier}" ${userChapterMetadataFilename}) > 0 ]]
    then 
    	echo "# Chapter metadata not edited, hence not writing chapter marks."
    	echo "# Edit '${userChapterMetadataFilename}' to write chapter marks."
		return 1
    fi

	createListOfDurations ${_durationsFilename} ${audioFileExtension}
	
	# Remove all comment lines from users chapter metafile
	cat ${userChapterMetadataFilename} | grep -v '^#' > ${_tmpChaptermetaFilename}
	
	combineUserChapterMetadataAndTimes \
		${_tmpChaptermetaFilename} \
		${_durationsFilename} \
		> "${outfile}"
	
	unlink "${_durationsFilename}"
	unlink "${_tmpChaptermetaFilename}"
}
