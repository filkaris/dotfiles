#!/bin/sh

# Here we diff our config with the vanilla config
# It takes an argument. If (all), then it does all.
# Also autocompletes

CONFIG="$HOME/.dotfiles/config"
GIT="$CONFIG/$1"

case "$1" in
	gitconfig) LOCAL="$HOME/.gitconfig";;
	emacs) LOCAL="$HOME/.emacs";;
	vim) LOCAL="$HOME/.vimrc";;
	tmux) LOCAL="$HOME/.tmux.conf";;
	ideavimrc) LOCAL="$HOME/.ideavimrc";;
	screenrc) LOCAL="$HOME/.screenrc";;
	Xresources) LOCAL="$HOME/.Xresources";;
	i3) LOCAL="$HOME/.config/i3/config";;
	i3blocks) LOCAL="$HOME/.config/i3blocks/config";;
	alacritty) LOCAL="$HOME/.config/alacritty/alacritty.yml";;
	xbindkeys) LOCAL="$HOME/.config/xbindkeys/config";;
	xinitrc) LOCAL="$HOME/.config/X11/xinitrc";;
esac

diff "$LOCAL" "$GIT" 1>/dev/null || nvim -d "$LOCAL" "$GIT"
