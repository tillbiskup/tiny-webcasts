#!/bin/bash

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

ffmpeg -hide_banner -loglevel warning -f concat -i ${indexFile} -c:v libx264 -vf "fps=2,format=yuv420p" video.mp4
#ffmpeg -hide_banner -loglevel warning -f concat -i ${indexFile} -c:v libx264 -vf "fps=16,format=yuv420p" video-fr16.mp4
#ffmpeg -hide_banner -loglevel warning -f concat -i ${indexFile} -c:v libx264 -vf "fps=30,format=yuv420p" video-fr30.mp4

#rm ${indexFile}
