#!/bin/bash
# Script to prepare all necessary things for the webcast.
# 
# After having executed this script, the file "meta.txt"
# needs to be edited by the user and afterwards the final
# webcast created using:
#
#    twc-finalise-webcast.sh <output_filename>.mp4

# Check if we have the correct number of PDF files
pdf_file_count=`twc-count-files.sh *.pdf`
if [[ ${pdf_file_count} > 1 ]]; then
    echo "You have ${pdf_file_count} PDF files in your directory."
    echo "Only one can be the presentation, but I cannot tell which one."
    echo "Delete all but one and try again..."
    exit 1
elif [[ ${pdf_file_count} = 0 ]]; then
    echo "You have no PDF file in your directory."
    echo "Without PDF file of a presentation, we cannot proceed..."
    exit 1
fi

# Convert PDF into JPEG images
twc-presentation2jpg.sh *pdf

# Rename audio files to comply with scheme
twc-sanitise-audio-filenames.sh

wav_file_count=`twc-count-files.sh *.wav`
slide_count=`twc-count-files.sh *.jpg`

# Check if number of slides and audio files matches.
if [[ ${wav_file_count} != ${slide_count} ]]; then
    echo "Your slides and cut audio files don't match."
    echo "You have ${wav_file_count} audio files"
    echo "  and ${slide_count} slides..."
    exit 1
fi

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
rm audio-???.wav
rm audio-???.m4a

# Once you're done editing the metadata, create your final webcast calling
# twc-create-final-webcast.sh <output_filename>.mp4

# Tell user what to do next
echo " "
echo "Edit the file 'meta.txt' according to your needs."
echo "Afterwards, create your final webcast calling"
echo "  twc finalise <output_filename>.mp4"
