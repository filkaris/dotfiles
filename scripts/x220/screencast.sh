#!/bin/sh

DIR="$HOME/Screencasts"
NAME="$(date +Screencast_%Y-%m-%d_%H-%M-%S).mkv"

if ! pgrep ffmpeg 1>/dev/null; then

    # Record Main Screen
    #ffmpeg -f x11grab -video_size 1366x768 -framerate 25 -i $DISPLAY -f alsa -i hw:1 -c:v libx264 -crf 0 -preset ultrafast -c:a aac "$DIR/$NAME"

    # Record Main Screen Upscaled
    #ffmpeg -f x11grab -video_size 1920x1080 -framerate 60 -i $DISPLAY -f alsa -i hw:1 -c:v libx264 -crf 0 -preset ultrafast -c:a aac "$DIR/$NAME"

    # Record Main Screen Downscaled 
    # ffmpeg -f x11grab \
	    # -video_size 1280x720 \
	    # -framerate 60 \
	    # -i $DISPLAY \
	    # -f alsa -i hw:1 \
	    # -r 30 \
	    # -c:v libx264 -crf 0 -preset ultrafast \
	    # -c:a flac \
	    # "$DIR/$NAME"

    # Record Main Screen No Audio
    ffmpeg -f x11grab \
	    -video_size 1280x720 \
	    -framerate 60 \
	    -i $DISPLAY \
	    -c:v libx264 -crf 0 -preset ultrafast \
	    "$DIR/$NAME"

    # Record Second Screen
    # ffmpeg -f x11grab \
	    # -video_size 1920x1080 \
	    # -framerate 60 \
	    # -i $DISPLAY+1366,0 \
	    # -f alsa -i hw:1 \
	    # -r 30 \
	    # -c:v libx264 -crf 0 -preset ultrafast \
	    # -c:a flac \
	    # "$DIR/$NAME"

    # Luke Smith
    # ffmpeg -y \
	    # -f x11grab \
	    # -framerate 60 \
	    # -s 1920x1080 \
	    # -i $DISPLAY \
	    # -f alsa -i default \
	    # -r 30 \
	    # -c:v libx264rgb \
	    # -crf 0 \
	    # -preset ultrafast \
	    # -c:a flac \
	    # "$DIR/$NAME"
else
    # Stop recording if exists
    pgrep ffmpeg | xargs kill
fi
