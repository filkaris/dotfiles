#!/bin/bash

[ "$MAINSCREEN" == "" ] && exit 1
[ "$SECSCREEN" == "" ] && exit 1

xrandr --output "$MAINSCREEN" --off --output "$SECSCREEN" --auto

