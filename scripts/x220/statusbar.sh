#!/bin/sh

echo "$(cat /sys/class/power_supply/BAT0/capacity) $(date +"%F %T")"
