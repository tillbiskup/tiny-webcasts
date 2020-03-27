#!/bin/bash

# Ensure that the WAV files are named "audio-###.wav" consecutively
# starting with audio-000.wav

k=0;
for oldfile in `ls *wav`
  do
    newfile=`echo ${oldfile} |rev |cut -d- -f2- |rev`
    newfile=${newfile}-$(printf "%03d" $k).wav
    echo "${oldfile} => ${newfile}"
    mv ${oldfile} ${newfile}
    k=$((k+1))
done
