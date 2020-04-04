#!/bin/sh


status=$(cat /sys/class/power_supply/BAT0/status)
percentage=$(cat /sys/class/power_supply/BAT0/capacity)
reset="\x01"
green="\x03"
yellow="\x04"
orange="\x05"
red="\x06"
color="\x01"


if [ "$status" == "Discharging" ]; then
	if [ "$percentage" -gt 60 ]; then
		color=$green
	elif [ "$percentage" -gt 40 ]; then
		color=$yellow
	elif [ "$percentage" -gt 20 ]; then
		color=$orange
	else
		color=$red
	fi
fi

echo "B $color$percentage%$reset"
