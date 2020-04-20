#!/bin/bash
DIR="$HOME/.dotfiles"
PC=$(uname -n)

# Make appropriate directories if necessary
mkdir -p ~/.config/i3 ~/.config/phpactor ~/.config/X11 ~/.config/xbindkeys 2>/dev/null

# Copy all config files (don't overwrite)
cp -nv "$DIR/config/gitconfig" ~/.gitconfig
cp -nv "$DIR/config/emacs" ~/.emacs
cp -nv "$DIR/vim/vimrc" ~/.vimrc
cp -nv "$DIR/config/tmux.conf" ~/.tmux.conf
cp -nv "$DIR/config/ideavimrc" ~/.ideavimrc
cp -nv "$DIR/config/screenrc" ~/.screenrc
cp -nv "$DIR/config/Xresources" ~/.Xresources
cp -nv "$DIR/config/i3" ~/.config/i3/config
cp -nv "$DIR/config/i3blocks" ~/.config/i3blocks/config
cp -nvr $DIR/phpactor/* ~/.config/phpactor/ 

if [ $PC == "archpad" ]; then
	 cp -nv "$DIR/config/x200/xbindkeys" ~/.config/xbindkeys/config
	 cp -nv "$DIR/config/x200/xinitrc" ~/.config/X11/xinitrc
fi
if [ $PC == "archway" ]; then
	 cp -nv "$DIR/config/x220/xbindkeys" ~/.config/xbindkeys/config
	 cp -nv "$DIR/config/x220/xinitrc" ~/.config/X11/xinitrc
fi
if [ $PC == "philip-laptop-5559" ]; then
	 cp -nv "$DIR/config/5559/xbindkeys" ~/.config/xbindkeys/config
fi

# Manually update:

diff ~/.profile ~/.dotfiles/config/profile 1>/dev/null || nvim -d ~/.profile ~/.dotfiles/config/profile

# .bashrc
# .xinirc

# If vundle doesn't exist, clone and it
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
# Install vim plugins 
nvim +BundleInstall +BundleClean +BundleClean +quitall

# Include our files in bashrc
# grep -q returns no output so we can only get the $? value (0=true)
# grep -E is like egrep. Extended regex. I use it to be able to use |
if ! grep -Eq '(source|\.) ~/.dotfiles/bash/bashrc' ~/.bashrc; then
	echo 'source ~/.dotfiles/bash/bashrc' >> ~/.bashrc
fi
if ! grep -Eq '(source|\.) ~/.dotfiles/bash/aliases' ~/.bashrc; then
	echo 'source ~/.dotfiles/bash/aliases' >> ~/.bashrc
fi

