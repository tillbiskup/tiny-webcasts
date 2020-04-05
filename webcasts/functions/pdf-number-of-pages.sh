#!/bin/bash

function pdfNumberOfPages() {
	pdf_file="$1"
	# Using poppler (very fast)
	echo $(pdfinfo "${pdf_file}" | grep Pages | cut -d ":" -f2)
	# Alternative: using ImageMagick (slow and complicated)
	#echo $(identify -format %n\\n "${pdf_file}" |head -n1)
}
