#!/bin/bash

[ "$MAINSCREEN" == "" ] && exit 1
[ "$SECSCREEN" == "" ] && exit 1

xrandr --output "$MAINSCREEN" --auto --output "$SECSCREEN" --off 
