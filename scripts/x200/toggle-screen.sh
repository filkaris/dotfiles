#!/bin/sh

isConnected=$( xrandr | grep VGA-1 | cut -d' ' -f 3 )

case "$isConnected" in 
    *x*) $HOME/.dotfiles/scripts/x200/second-screen-off.sh ;;
    *normal) $HOME/.dotfiles/scripts/x200/second-screen.sh ;;
esac
