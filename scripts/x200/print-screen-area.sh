#!/bin/sh

DIR="$HOME/Pictures/Screenshots"
NAME="$(date +Screenshot_%Y-%m-%d_%H-%M-%S).png"

if [ ! -e $DIR ]; then
    mkdir -p $DIR
fi

maim -s > $DIR/$NAME
notify-send "Screenshot Saved"
    
