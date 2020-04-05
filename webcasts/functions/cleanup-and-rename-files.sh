#!/bin/bash

function cleanupAndRenameFiles() {
	webcastFilename=$1
	
	local _presentationName=$(ls *pdf)
	basename=${_presentationName%.pdf}
	finalWebcastFilename="${basename}".mp4
	
	mv "${webcastFilename}" "${finalWebcastFilename}"
	rm video.mp4
	rm audio.m4a
	mv *-meta.txt "${basename}"-meta.txt
	mv *-chaptermeta.txt "${basename}"-chaptermeta.txt
	rm vlist.txt	
}
