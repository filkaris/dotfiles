#!/bin/bash
DIR=$( pwd )
PC=$(uname -n)

# Link all config files to home directory
if [ ! -f ~/.gitconfig ]; then
    cp "$DIR/config/gitconfig" ~/.gitconfig
fi
if [ ! -f ~/.emacs ]; then
    cp "$DIR/config/emacs" ~/.emacs
fi
if [ ! -f ~/.vimrc ]; then
    cp "$DIR/vim/vimrc" ~/.vimrc
fi
if [ ! -f ~/.config/phpactor/phpactor.yml ]; then
    cp "$DIR/phpactor" ~/.config/phpactor
fi
if [ ! -f ~/.tmux.conf ]; then
    cp "$DIR/config/tmux.conf" ~/.tmux.conf
fi
if [ ! -f ~/.ideavimrc ]; then
    cp "$DIR/config/ideavimrc" ~/.ideavimrc
fi
if [ ! -f ~/.screenrc ]; then
    cp "$DIR/config/screenrc" ~/.screenrc
fi
if [ ! -f ~/.Xresources ]; then
    cp "$DIR/config/Xresources" ~/.Xresources
fi
if [ ! -f ~/.config/i3/config ]; then
    cp "$DIR/config/i3" ~/.config/i3/config
fi
if [ ! -f ~/.config/i3blocks/config ]; then
    cp "$DIR/config/i3blocks" ~/.config/i3blocks/config
fi
if [ $PC == "archpad" ]; then
    cp "$DIR/config/x200/xbindkeysrc" ~/.xbindkeysrc
    cp "$DIR/config/x200/xinitrc" ~/.xinitrc
fi
if [ $PC == "archway" ]; then
    cp "$DIR/config/x220/xbindkeysrc" ~/.xbindkeysrc
    cp "$DIR/config/x220/xinitrc" ~/.xinitrc
fi
if [ $PC == "philip-laptop-5559" ]; then
    cp "$DIR/config/x200/xbindkeysrc" ~/.xbindkeysrc
fi

# If vundle doesn't exist, clone and it
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
# Install vim plugins 
vim +BundleInstall +BundleClean +BundleClean +quitall

# Include our files in bashrc
# grep -q returns no output so we can only get the $? value (0=true)
# grep -E is like egrep. Extended regex. I use it to be able to use |
if ! grep -Eq '(source|\.) ~/.dotfiles/bash/bashrc' ~/.bashrc; then
	echo 'source ~/.dotfiles/bash/bashrc' >> ~/.bashrc
fi
if ! grep -Eq '(source|\.) ~/.dotfiles/bash/aliases' ~/.bashrc; then
	echo 'source ~/.dotfiles/bash/aliases' >> ~/.bashrc
fi

