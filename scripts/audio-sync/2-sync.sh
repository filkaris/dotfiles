#!/bin/sh

ffmpeg -y -i "$1" -itsoffset "$3" -i "$2" -map 0:v -map 1:a -c:v libx264 -crf 0 -preset ultrafast -c:a flac synced.mkv
