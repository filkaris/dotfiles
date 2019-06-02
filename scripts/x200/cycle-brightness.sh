#!/bin/sh

# I HAVE CHANGED THE FILE TO HAVE OWNER ME
# THIS WAS THE ONLY WAY I FOUND TO MAKE IT WORK WITHOUT SUDO AND WITHOUT INTERNET
BRIGHTNESS=$(cat /sys/class/backlight/acpi_video0/brightness)

# Range: 0-15
# Cycle through 3, 7, 11, 15

if [ $BRIGHTNESS -ge 15 ]; then
    $HOME/.dotfiles/scripts/x200/set-brightness.sh 11
    exit 0;
fi;

if [ $BRIGHTNESS -ge 11 ]; then
    $HOME/.dotfiles/scripts/x200/set-brightness.sh 7
    exit 0;
fi;

if [ $BRIGHTNESS -ge 7 ]; then
    $HOME/.dotfiles/scripts/x200/set-brightness.sh 3
    exit 0;
fi;

if [ $BRIGHTNESS -ge 3 ]; then
    $HOME/.dotfiles/scripts/x200/set-brightness.sh 15
    exit 0;
fi;

