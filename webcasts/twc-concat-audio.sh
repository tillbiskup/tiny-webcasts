for k in audio*m4a
do 
	echo "file '${k}'"
done > alist.txt

ffmpeg -f concat -i alist.txt -c copy audio.m4a

rm alist.txt
