metadataFile='meta.txt'
chapterMetadataFile='chapter-meta.txt'

echo """;FFMETADATA1
title=xxx
artist=xxx
album=xxx
date=xxx
track=1/n
genre=xxx""" \
	> ${metadataFile}

start=0

idx=1
for k in audio-*m4a; do 
	dur=`twc-get-duration.sh ${k}`
	dur=`echo "$dur * 1000" | bc -l | cut -d. -f1`
	echo "${idx}[CHAPTER]"
	echo "TIMEBASE=1/1000"
	echo "START=$start"
	end=`echo "$start + $dur" | bc`
	echo "END=$end"
	start=`echo "${start} + ${dur}" | bc`
       	echo "title=TBD"
	idx=`echo $idx+1 | bc`
done \
	> ${chapterMetadataFile}

cat ${chapterMetadataFile} >> ${metadataFile}

rm ${chapterMetadataFile}

