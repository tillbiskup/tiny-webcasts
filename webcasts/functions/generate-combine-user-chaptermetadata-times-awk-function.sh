echo -en "function combineUserChapterMetadataAndTimes() {\n\t"
echo -n "awk '$(cat combine-user-chaptermetadata-times.awk | tr '\n\t' ' ' | tr -s ' ')' \$1 \$2"
echo -e "\n}"
