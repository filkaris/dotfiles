#!/bin/sh

DATETIME=$(date +"%F %T")
BATTERY=$(~/.dotfiles/scripts/statusbar/battery.sh)
MEMORY=$(~/.dotfiles/scripts/statusbar/memory.sh)
CPU=$(~/.dotfiles/scripts/statusbar/cpu.sh)

echo -e " $CPU $MEMORY $BATTERY $DATETIME"
