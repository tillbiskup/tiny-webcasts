#!/bin/bash

function combineUserChapterMetadataAndTimes() {
	awk -f combine.awk $1 $2
}
