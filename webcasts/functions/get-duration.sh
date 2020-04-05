#!/bin/bash

function getDuration() {
	ffmpeg -hide_banner -i $1 2>&1 \
		| grep Duration \
		| cut -d, -f1 \
		| cut -d: -f3- \
		| sed 's/:/*60+/' \
		| bc
}
