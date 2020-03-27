#!/bin/bash

fileName=$1
tempDir="/tmp"

# targetFile=$2
targetFile=${fileName%.wav}.m4a
tempWave=${tempDir}/${fileName}.wav
tempFLAC=${tempDir}/${fileName}.flac
tempFLAC2=${tempDir}/${fileName}.2.flac


inputPeak=`sox ${fileName} -n stat 2>&1 | grep 'Volume adjustment' | perl -pe 's/^.*(\d+\.\d+).*$/$1/sg'`
inputGain=`echo "0.707 * ${inputPeak}" | bc -l`
echo "PreGain: " ${inputGain}
sox -v ${inputGain} ${fileName} -c1 -r16000 ${tempFLAC} highpass 10 highpass 80 highpass 150 lowpass 10800 lowpass 8613
metaflac --add-replay-gain ${tempFLAC}
inputGain=`metaflac --list ${tempFLAC} | grep REPLAYGAIN_TRACK_GAIN | perl -pe 's/.*=\+?(-?\d+)\.(\d+) dB/$1.$2/sg'`;
#inputGain=`normalize-audio -nv --no-progress ${tempWave} 2>&1 | grep dB | perl -pe 's/^.* (-?\d+)[\.,](\d+)dB .*$/$1.$2/sg'`
echo "InputGain: " ${inputGain} " dB"

thLevel1=`echo "(${inputGain}*-1 - 24)" | bc`
thLevel2=`echo "(${inputGain}*-1 - 36)" | bc`
thLevel3=`echo "(${inputGain}*-1 - 42)" | bc`

soxCompand="compand 0.1,3 ${thLevel3},-51,${thLevel2},-15,${thLevel1},-12,0,-12 -9 -90 0.3"

sox ${tempFLAC} ${tempFLAC2} ${soxCompand}
rm ${tempFLAC}
metaflac --add-replay-gain ${tempFLAC2}
replayGain=`metaflac --list ${tempFLAC2} | grep REPLAYGAIN_TRACK_GAIN | perl -pe 's/.*=\+?(-?\d+)\.(\d+) dB/$1.$2/sg'`;
replayGain=`echo "${replayGain} + 0" | bc | perl -pe 's/\./,/sg'`
echo "ReplayGain: " ${replayGain} " dB"

flac -d -f -s -o ${tempWave} ${tempFLAC2}
rm ${tempFLAC2}
normalize-audio -g"${replayGain}dB" ${tempWave}
#lame --silent --preset sw ${tempWave} ${targetFile}
ffmpeg -i  ${tempWave} -c:a aac -b:a 24k ${targetFile}
rm ${tempWave}
