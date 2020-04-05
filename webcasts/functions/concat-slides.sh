#!/bin/bash

function concatSlides() {
	FRAMERATE=2;
	indexFile=vlist.txt

	for slideFileName in slides*; do
		fname=${slideFileName%.*}.m4a
		trackDuration=`getDuration audio${fname#slides}`
		echo "file '${slideFileName}'"
    		echo "duration ${trackDuration}"
	done >> ${indexFile}

	tail -n2 ${indexFile} \
	    | head -n1 \
	    >> ${indexFile}

	echo "# concatenating slides to video"
	ffmpeg -hide_banner -loglevel warning -f concat -i ${indexFile} \
		-c:v libx264 -vf "fps=${FRAMERATE},format=yuv420p" video.mp4

	#rm ${indexFile}
}
