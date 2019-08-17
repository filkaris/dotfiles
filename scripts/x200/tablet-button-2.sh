#!/bin/sh

MODE=$(cat ~/.tablet-mode)

if [ $MODE = "normal" ]; then
    ~/.dotfiles/scripts/x200/screen-rotate.sh
else
    sleep 0.2 && xdotool key Page_Up
fi
