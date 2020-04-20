#!/bin/sh

percentage="$(mpstat 1 1 | grep Average | awk '{print (100 - $12);}')"
reset="\x01"
green="\x03"
yellow="\x04"
orange="\x05"
red="\x06"
color="\x01"

if [ "$percentage" -ge 80 ]; then
	color=$red
elif [ "$percentage" -ge 60 ]; then
	color=$orange
elif [ "$percentage" -ge 40 ]; then
	color=$yellow
else
	color=$green
fi

echo "C $color$percentage%$reset"
