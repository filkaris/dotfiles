#!/bin/sh

ffmpeg -y -i "$1" -ss "$2" -t 00:00:05.000 "f-$1"


