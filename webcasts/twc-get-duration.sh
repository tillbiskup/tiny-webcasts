echo `ffmpeg -i $1 2>&1 | grep Duration | cut -d: -f3- | cut -d, -f1 | perl -pe 's/^(\d+):(.*)/$1*60 + $2/sg' | bc`
