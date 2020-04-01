#!/bin/bash

# Check for input argument
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "You need to supply the name of your final webcast"
    exit 1
fi

filename=$1
# Append proper file extension if necessary
if [[ ${filename: -4} != ".mp4" ]]
  then 
    filename=${filename}.mp4
fi

# Join video and audio trace for final webcast
ffmpeg -hide_banner -loglevel warning -i audio.m4a -i video.mp4 -i meta.txt -map_metadata 2 -c copy $filename

# Rename metadata files necessary for easy recreating of webcast
mv vlist.txt ${filename%.mp4}-vlist.txt
mv meta.txt ${filename%.mp4}-meta.txt

echo "Final webcast written to: ${filename}"
