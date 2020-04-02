#!/bin/bash

# Final files should be multiples of the inverse framerate long
FRAMERATE=2;

original_duration=`twc-get-duration.sh $1`
echo "Original duration: ${original_duration}"

# Two-step rounding to multiples of the inverse frame rate
tmpduration=`echo "scale=0;(${original_duration}*${FRAMERATE})/1" | bc`
final_duration=`echo "scale=2;(${tmpduration}/${FRAMERATE})/1" | bc` 

echo "Final duration: ${final_duration}"

# Adjust length of audio, simply cutting from the end
ffmpeg -hide_banner -loglevel warning -i $1 -ss 0 -t ${final_duration} -c copy tmp-$1
# ffmpeg cannot edit in place, hence afterwards convert
mv tmp-$1 $1
