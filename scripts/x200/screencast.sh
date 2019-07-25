#!/bin/sh

ffmpeg -f x11grab -video_size 1280x800 -framerate 25 -i $DISPLAY -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac screen.mp4
