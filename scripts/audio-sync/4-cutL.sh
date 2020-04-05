#!/bin/sh

OFFSET=$(echo 5 + $2 | bc)
ffmpeg -y -sseof "-$OFFSET" -i "$1" -t 00:00:05.000 "f-$1"
