FROM alpine

RUN apk --no-cache --update add bash \
	ffmpeg \
	sox \
	flac \
	imagemagick \
	poppler-utils
COPY webcasts/ /usr/local/webcasts/
COPY docker/docker-entrypoint.sh /usr/local/bin/

RUN cd /usr/local/webcasts/functions/; ./generate-combine-user-chaptermetadata-times-awk-function.sh > combine-user-chaptermetadata-times.sh

RUN cd /usr/local/webcasts/; targetFile=twc; (echo '#!/bin/bash'; cat `ls functions/*sh | grep -v 'awk'` | grep -v '^#!/bin/bash'; grep -v '^#!/bin/bash' twc.sh) > ${targetFile}; chmod +x ${targetFile}; mv ${targetFile} /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
