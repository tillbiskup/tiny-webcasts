#!/bin/bash

function presentation2Png() {
	# vars
	inputPDF="$1"
	slidePrefix=slides
	 
	### convert input
	# adjust density to produce desired output resolution
	# width needs to be dividable by 2
	# Height is fixed to 1080 px
	convert \
	  -density 285.75 \
      -alpha remove \
	  "${inputPDF}" \
	  -quality 90 \
	  -geometry x1080 \
	  ${slidePrefix}-%03d.png

	# Both, height and width need to be dividable by 2.
	# If width is an odd number, subtract one pixel column from images
	for img_file in *png; do
	    img_width=`identify -format "%w" ${img_file}`
	    if (( ${img_width} % 2 )); then
		img_width=$((img_width-1))
		img_height=`identify -format "%h" ${img_file}`
		convert ${img_file} -crop ${img_width}x${img_height}+0+0 +repage ${img_file}
	    fi
	done
}
