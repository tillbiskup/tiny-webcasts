#!/bin/bash

function checkSlidesAudioConsistent() {
	number_of_slides=$(pdfNumberOfPages *.pdf)
	number_of_audio=$(ls *.wav | grep -v 'raw' | wc -l)
	if ((${n_audio} -ne ${n_slides})); then
		echo "Number of slides and number of audio files don't match."
		echo "You have ${number_of_slides} pages in your PDF file,"
		echo "but ${number_of_audio} audio files... please check."
		exit 1
	fi
}
