#!/bin/sh

MODE=$(cat ~/.tablet-mode)

if [ $MODE = "normal" ]; then
    if [[ ! $(pgrep pinta) ]]; then 
        pinta; 
    fi; 
    i3-msg workspace 10
else
    sleep 0.2 && xdotool key Page_Down
fi
