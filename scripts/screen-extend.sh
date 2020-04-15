#!/bin/bash

[ "$MAINSCREEN" == "" ] && exit 1
[ "$SECSCREEN" == "" ] && exit 1

xrandr --output "$MAINSCREEN" --primary --auto --output "$SECSCREEN" --right-of "$MAINSCREEN" --auto 
