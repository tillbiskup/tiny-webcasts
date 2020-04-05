#!/bin/bash

function showUsage() {
    echo "Usage: twc <command>" # [<option>]"
	echo ""
	echo "  Available commands: metadata, check, make"
	echo ""
	echo "  metadata - create metadata file"
	echo "  check    - test whether everthing is ready"
	echo "  make     - create the actual webcast"
}

# Check for input argument
if [ $# -eq 0 ]
  then
    showUsage
    exit 1
fi

metadataFile='meta.txt'
chapterMetadataFile='chaptermeta.txt'
ffmpegMetadataFile='ffmpegmeta.txt'
webcastFile='final-webcast.mp4'
outputDirectory='out'

command="$1"
case ${command} in
	"metadata")
	    echo "Creating metadata"
		createMetadataTemplate "${metadataFile}"
		echo "You may want to edit the metadata file '${metadataFile}' now."
		checkNumberOfPdfFiles
		numberOfSlides=$(pdfNumberOfPages *.pdf)
		createChapterMetadataTemplate "${chapterMetadataFile}" ${numberOfSlides}
		echo "You may want to edit the chapter metadata file '${chapterMetadataFile}' now."
		;;
	"check")
		echo "Checking project"
		checkNumberOfPdfFiles
		checkSlidesAudioConsistent
		checkMetadataFileExists
		echo "Everything seems fine and ready for creating the webcast."
		;;
	"make")
		# Check first that everything is fine
		twc check
		status=$?
		if [[ ${status} -ne 0 ]]; then
			exit 1
		fi
		echo "Making project"
		createOutputDirectory "${outputDirectory}"
		cd "${outputDirectory}"/

		prepareWebcast
		createFfmpegMetadata \
			"*-${metadataFile}" \
			"*-${chapterMetadataFile}" \
			"${ffmpegMetadataFile}"

		# Create audio and video trace
		concatSlides
		concatAudio

		finaliseWebcast "${webcastFile}" "${ffmpegMetadataFile}"
		cleanupAndRenameFiles "${webcastFile}"
		echo "Final webcast written to: ${outputDirectory}/${finalWebcastFilename}"

		# Cleanup
		rm *.jpg
		rm audio-???.wav
		rm audio-???.m4a
		rm "${ffmpegMetadataFile}"
		;;
	"dev")
		echo "# DEVELOPERS MODE: be careful!"
		shift # Remove "dev" command from argument list
		function_name=$1
		shift # Remove function name from argument list
		${function_name} $@
		;;
	*)
		echo "Command '${command}' not understood"
		showUsage
		exit 1
esac
