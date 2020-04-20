#!/bin/sh

RESOLUTION=$(xrandr | grep LVDS-1 | cut -d' ' -f 4)

case "$RESOLUTION" in
	1366*) xrandr --output LVDS-1 --scale-from 1280x720 --panning 1280x720 ;;
	1280*) xrandr --output LVDS-1 --scale-from 1366x768 --panning 1366x768 ;;
esac

