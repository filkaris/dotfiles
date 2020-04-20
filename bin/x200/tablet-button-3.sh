#!/bin/sh

MODE=$(cat ~/.tablet-mode)

if [ $MODE = "normal" ]; then
    ~/.dotfiles/bin/x200/cycle-brightness.sh 
else
    notify-send -t 500 null
fi
