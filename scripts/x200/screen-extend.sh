#!/bin/bash
main=LVDS-1
second=VGA-1

xrandr --output "$main" --primary --auto --output "$second" --right-of "$main" --auto 
