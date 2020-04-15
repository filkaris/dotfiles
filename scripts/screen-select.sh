#!/bin/sh


selection=$( echo -e "(e) Extend Screen\n(m) Main Screen\n(s) Secondary Screen" | dmenu -l 3 )

case "$selection" in
	\(e*) ~/.dotfiles/scripts/screen-extend.sh;;
	\(m*) ~/.dotfiles/scripts/screen-main.sh;;
	\(s*) ~/.dotfiles/scripts/screen-secondary.sh;;
esac
