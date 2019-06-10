#!/bin/bash
DIR=$( pwd )
PC=$(uname -n)

# Link all conf files to home directory
if [ ! -f ~/.gitconfig ]; then
    ln -s "$DIR/conf/gitconfig" ~/.gitconfig
fi
if [ ! -f ~/.emacs ]; then
    ln -s "$DIR/conf/emacs" ~/.emacs
fi
if [ ! -f ~/.vimrc ]; then
    ln -s "$DIR/conf/vimrc" ~/.vimrc
fi
if [ ! -f ~/.config/phpactor/phpactor.yml ]; then
    ln -s "$DIR/conf/phpactor.yml" ~/.config/phpactor/phpactor.yml
fi
if [ ! -f ~/.tmux.conf ]; then
    ln -s "$DIR/conf/tmux.conf" ~/.tmux.conf
fi
if [ ! -f ~/.ideavimrc ]; then
    ln -s "$DIR/conf/ideavimrc" ~/.ideavimrc
fi
if [ ! -f ~/.screenrc ]; then
    ln -s "$DIR/conf/screenrc" ~/.screenrc
fi
if [ ! -f ~/.config/i3/config ]; then
    ln -s "$DIR/conf/i3" ~/.config/i3/config
fi
if [ ! -f ~/.config/i3blocks/config ]; then
    ln -s "$DIR/conf/i3blocks" ~/.config/i3blocks/config
fi
if [ $PC == "archpad" ]; then
    ln -sf "$DIR/conf/x200/xbindkeysrc" ~/.xbindkeysrc
    ln -sf "$DIR/conf/x200/xinitrc" ~/.xinitrc
fi
if [ $PC == "filippos-5559" ]; then
    ln -sf "$DIR/conf/x200/xbindkeysrc" ~/.xbindkeysrc
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

