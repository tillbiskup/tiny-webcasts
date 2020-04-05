#!/bin/bash

function adjustAudioLength() {
	local _audio="$1"
	# Final files should be multiples of the inverse framerate long
	FRAMERATE=2;
	echo -n "# adjusting length '$_audio':"
	original_duration=$(getDuration "${_audio}")
	echo -n " from ${original_duration} s"

	# Two-step rounding to multiples of the inverse frame rate
	tmpduration=`echo "scale=0;(${original_duration}*${FRAMERATE})/1" | bc`
	final_duration=`echo "scale=2;(${tmpduration}/${FRAMERATE})/1" | bc` 

	echo -n " to ${final_duration} s"

	local _tmpDir="$(mktemp -d)"
	# Adjust length of audio, simply cutting from the end
	ffmpeg -hide_banner -loglevel warning -i "${_audio}" -ss 0 \
		-t ${final_duration} -c copy "${_tmpDir}/${_audio}"
	# ffmpeg cannot edit in place, hence afterwards convert
	mv "${_tmpDir}/${_audio}" "${_audio}"
	rmdir "${_tmpDir}"
	echo
}
