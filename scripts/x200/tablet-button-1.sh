#!/bin/sh

if [ ! -f ~/.tablet-mode ]; then
    touch ~/.tablet-mode
fi

MODE=$(cat ~/.tablet-mode)

if [ $MODE = "normal" ]; then
    echo "navigation" > ~/.tablet-mode
else
    echo "normal" > ~/.tablet-mode
fi

MODE=$(cat ~/.tablet-mode)

notify-send -t 700 $MODE
