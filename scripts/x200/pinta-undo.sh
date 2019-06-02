#!/bin/sh
# depends:
#  xdotool

# Identify window by name (untitled 1* - Pinta)
WINDOW=$(xdotool search --name "\- Pinta")

# Execute undo
xdotool key --window=$WINDOW ctrl+z
