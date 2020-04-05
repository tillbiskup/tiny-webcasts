#!/bin/bash

function checkMetadataFileExists() {
	metadata_file_count=$(countFiles "*meta.txt")
	if [[ ${metadata_file_count} > 2 ]]; then
	    echo "You have ${metadata_file_count} metadata files in your directory."
	    echo "Only two can be used for the webcast, but I cannot tell which ones."
	    echo "Delete/move all but two and try again..."
	    exit 1
	elif [[ ${metadata_file_count} = 0 ]]; then
	    echo "You have no metadata file in your directory."
	    echo "Without metadata file we cannot proceed..."
	    echo "You may create a metadata file by issuing 'twc metadata'"
	    exit 1
	fi
}
