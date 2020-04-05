#!/bin/bash

function checkNumberOfPdfFiles() {
	pdf_file_count=$(countFiles "*pdf")
	if [[ ${pdf_file_count} > 1 ]]; then
	    echo "You have ${pdf_file_count} PDF files in your directory."
	    echo "Only one can be the presentation, but I cannot tell which one."
	    echo "Delete all but one and try again..."
	    exit 1
	elif [[ ${pdf_file_count} = 0 ]]; then
	    echo "You have no PDF file in your directory."
	    echo "Without PDF file of a presentation, we cannot proceed..."
	    exit 1
	fi
}
