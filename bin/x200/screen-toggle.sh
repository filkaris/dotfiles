#!/bin/sh

isConnected=$( xrandr | grep VGA-1 | cut -d' ' -f 3 )

case "$isConnected" in 
    *x*) $HOME/.dotfiles/bin/x200/screen-main.sh ;;
    *normal) $HOME/.dotfiles/bin/x200/second-extend.sh ;;
esac
