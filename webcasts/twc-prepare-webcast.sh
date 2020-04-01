#!/bin/bash
# Script to prepare all necessary things for the webcast.
# 
# After having executed this script, the file "meta.txt"
# needs to be edited by the user and afterwards the final
# webcast created using:
#
#    twc-finalise-webcast.sh <output_filename>.mp4

# Convert PDF into JPEG images
twc-presentation2jpg.sh *pdf

# Rename audio files to comply with scheme
twc-sanitise-audio-filenames.sh

# Postprocess audio
for wav in *.wav
do 
	twc-wav2aac.sh ${wav}
done

# Create audio and video trace
twc-concat-slides.sh
twc-concat-audio.sh

# Create metadata template
twc-create-metadata.sh

# Remove now unnecessary image and audio files
rm *.jpg
#rm *.wav
#rm audio-*.m4a

# Once you're done editing the metadata, create your final webcast calling
# twc-create-final-webcast.sh <output_filename>.mp4

# Tell user what to do next
echo " "
echo "Edit the file 'meta.txt' according to your needs."
echo "Afterwards, create your final webcast calling"
echo "  twc-finalise-webcast.sh <output_filename>.mp4"
