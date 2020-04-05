#!/bin/bash

function getFlacGain() {
	metaflac --list "$1" \
		| grep REPLAYGAIN_TRACK_GAIN \
		| cut -d '=' -f2 \
		| cut -d ' ' -f1 \
		| sed 's/+//'
}

function getBaseFileName() {
	echo $1 | rev | cut -d '.' -f 2-|rev
}

function processAudio() {
	local _fileName="$1"
	local _targetFile="$2"
	echo -n "# processing audio '${_fileName}':"

	local _tmpDir="$(mktemp -d)"
	preprocessedFlac="${_tmpDir}/preprocessed.flac"
	compressedFlac="${_tmpDir}/compressed.flac"

	# analyze input
	inputPeak=`sox "${_fileName}" -n stat -v 2>&1`
	inputGain=`echo "0.5 * ${inputPeak}" | bc -l`
	echo -n " InputGain: ${inputGain};"

	sox -v ${inputGain} "${_fileName}" -c1 -r16000 "${preprocessedFlac}" \
		highpass 10 highpass 80 highpass 150 \
		lowpass 10800 lowpass 8613

	# compress audio (volume, not size!)
	metaflac --add-replay-gain "${preprocessedFlac}"
	referenceGain=$(getFlacGain "${preprocessedFlac}")
	echo -n " referenceGain: ${referenceGain} dB;"
	thLevel1=`echo "(${referenceGain}*-1 - 24)" | bc`
	thLevel2=`echo "(${referenceGain}*-1 - 36)" | bc`
	thLevel3=`echo "(${referenceGain}*-1 - 42)" | bc`
	soxCompand="compand 0.1,3 ${thLevel3},-51,${thLevel2},-15,${thLevel1},-12,0,-12 -9 -90 0.3"

	sox "${preprocessedFlac}" "${compressedFlac}" ${soxCompand}
	unlink "${preprocessedFlac}"

	metaflac --add-replay-gain "${compressedFlac}"
	replayGain=$(getFlacGain "${compressedFlac}")
	echo -n " ReplayGain: ${replayGain} dB;"
	sox --replay-gain track "${compressedFlac}" "${_targetFile}"
	unlink "${compressedFlac}"
	rmdir "${_tmpDir}"
	echo
}

function audioToAac() { 
	fileName=$1
	baseFileName=$(getBaseFileName ${fileName})
	targetFile="${baseFileName}.m4a"
	local _tmpDir="$(mktemp -d)"
	processedFlac="${_tmpDir}/processed.flac"

	processAudio "${fileName}" "${processedFlac}"
	ffmpeg -hide_banner -loglevel warning -i "${processedFlac}" \
		-c:a aac -b:a 24k "${targetFile}"
	unlink "${processedFlac}"
	rmdir "${_tmpDir}"

	# Adjust length of ACC (M4A) file, as ffmpeg seems to mess with length
	# when converting from something to AAC
	adjustAudioLength ${targetFile}
}
