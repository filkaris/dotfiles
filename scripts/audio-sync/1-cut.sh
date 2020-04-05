#!/bin/sh

ffmpeg -y -i "$1" -c:v copy -ss 00:00:00.000 -t 00:00:20.000 "c-$1"

