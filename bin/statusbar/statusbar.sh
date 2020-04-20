#!/bin/sh

DATETIME=$(date +"%F %T")
BATTERY=$(~/.dotfiles/bin/statusbar/battery.sh)
MEMORY=$(~/.dotfiles/bin/statusbar/memory.sh)
CPU=$(~/.dotfiles/bin/statusbar/cpu.sh)

echo -e " $CPU $MEMORY $BATTERY $DATETIME"
