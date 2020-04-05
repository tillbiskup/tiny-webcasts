#!/bin/bash

function createFfmpegMetadata() {
	metadataFile=$1 #'meta.txt'
	chapterMetadataFile=$2 # 'chapter-meta.txt'
	ffmpegMetadataFile=$3

	local _tmpChapterMetadataFile="$(mktemp)"
	
	createChapterMetadata ${chapterMetadataFile} ${_tmpChapterMetadataFile}

	cat ${metadataFile} ${_tmpChapterMetadataFile} > ${ffmpegMetadataFile}
	
	unlink "${_tmpChapterMetadataFile}"
}
