#!/bin/sh


selection=$( echo -e "(e) Extend Screen\n(m) Main Screen\n(s) Secondary Screen" | dmenu -l 3 )

case "$selection" in
	\(e*) ~/.dotfiles/scripts/x200/screen-extend.sh;;
	\(m*) ~/.dotfiles/scripts/x200/screen-main.sh;;
	\(s*) ~/.dotfiles/scripts/x200/screen-secondary.sh;;
esac
