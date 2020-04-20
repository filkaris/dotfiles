#!/bin/sh

DIR="$HOME/Screencasts"
NAME="$(date +Screencast_%Y-%m-%d_%H-%M-%S).mp4"

if ! pgrep ffmpeg 1>/dev/null; then
    # Start recording
    ffmpeg -f x11grab -video_size 1280x800 -framerate 25 -i $DISPLAY -f alsa -i hw:1 -c:v libx264 -crf 0 -preset ultrafast -c:a aac "$DIR/$NAME"
else
    # Stop recording if exists
    pgrep ffmpeg | xargs kill
fi
