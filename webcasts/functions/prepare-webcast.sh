#!/bin/bash
# Script to prepare all necessary things for the webcast.
# 
# After having executed this script, the file "meta.txt"
# needs to be edited by the user and afterwards the final
# webcast created using:
#
#    finaliseWebcast <output_filename>.mp4

function prepareWebcast() {

	# Convert PDF into JPEG images
	presentation2Jpeg *pdf

	# Rename audio files to comply with scheme
	sanitiseAudioFilenames
	
	# Postprocess audio
	for wav in *.wav
	do 
		audioToAac ${wav}
	done
}
