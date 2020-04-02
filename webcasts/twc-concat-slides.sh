#!/bin/bash

FRAMERATE=2;
indexFile=vlist.txt

for k in slides*; do
    fname=${k%jpg}m4a
	dur=`twc-get-duration.sh audio${fname#slides}`
    echo "file '${k}'"
    echo "duration ${dur}"
done \
       	> ${indexFile}

tail -n2 ${indexFile} \
	   | head -n1 \
	     >> ${indexFile}

ffmpeg -hide_banner -loglevel warning -f concat -i ${indexFile} -c:v libx264 -vf "fps=${FRAMERATE},format=yuv420p" video.mp4

#rm ${indexFile}
