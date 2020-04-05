#!/bin/bash

function finaliseWebcast() {
	outputFilename=$1
	ffmpegMetadataFilename=$2
	# Append proper file extension if necessary
	if [[ ${filename: -4} != ".mp4" ]]
	  then 
	    filename=${filename}.mp4
	fi

	# Join video and audio trace for final webcast
	echo "# combining video and audio trace to final webcast"
	ffmpeg -hide_banner -loglevel warning \
		-i audio.m4a -i video.mp4 -i "${ffmpegMetadataFilename}" \
		-map_metadata 2 -c copy ${outputFilename}
}
