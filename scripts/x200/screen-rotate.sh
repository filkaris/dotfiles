#!/bin/bash
tablet="13"

# Get the current orientation of the tablet
rotate=$(xsetwacom get $tablet Rotate)

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
xsetwacom set "$tablet" Rotate $nextRotate
