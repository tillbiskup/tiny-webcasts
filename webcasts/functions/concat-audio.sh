#!/bin/bash

function concatAudio() {
	_tmpList="$(mktemp)"
	for _audioFileName in "$(pwd)"/audio*.m4a
	do 
		echo "file '${_audioFileName}'"
	done > "${_tmpList}"

	echo "# concatenating audio files to final audio trace"
	ffmpeg -hide_banner -loglevel warning -f concat -safe 0 \
		-i "${_tmpList}" -c copy audio.m4a
	unlink "${_tmpList}"
}
