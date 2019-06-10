#!/bin/bash
# depends:
#  xsetwacom
#  xranrd

stylus="Wacom Serial Penabled 1FG Touchscreen Pen stylus"
eraser="Wacom Serial Penabled 1FG Touchscreen Pen eraser"
touch="Wacom Serial Penabled 1FG Touchscreen Finger touch"

# Get the current orientation of the tablet
rotate=$(xsetwacom get "$touch" Rotate)

# Work out the next tablet and screen orientations (rotating clockwise)
case "$rotate" in
    none) nextRotate="half"
          nextOrient="inverted" ;;
    half) nextRotate="none"
          nextOrient="normal" ;;
esac

# Rotate the screen
xrandr -o $nextOrient

# Rotate the tablet
xsetwacom set "$stylus" Rotate $nextRotate
xsetwacom set "$eraser" Rotate $nextRotate
xsetwacom set "$touch" Rotate $nextRotate
