#!/bin/bash

function createListOfDurations() {
	durationsFile="$1"
	audioFileExtension="$2"
	
	for audioFile in *.${audioFileExtension}
	do
		echo $(getDuration ${audioFile})
	done > ${durationsFile}
}
