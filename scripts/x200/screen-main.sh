#!/bin/bash
main=LVDS-1
second=VGA-1

xrandr --output "$second" --off --output "$main" --auto
