#!/bin/sh

DATETIME=$(date +"%F %T")
BATTERY=$(~/.dotfiles/scripts/statusbar/battery.sh)
MEMORY=$(~/.dotfiles/scripts/statusbar/memory.sh)

echo -e " $MEMORY $BATTERY $DATETIME"
