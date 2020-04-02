FROM debian:buster-slim

# Download dependencies
RUN apt-get update && apt-get install -y neovim curl git nodejs npm

# Install JS/TS Server
RUN npm install -g javascript-typescript-langserver

# Download vim plug
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY .vimrc /root/.vimrc

# Install plugins
RUN nvim -es -u /root/.vimrc -i NONE -c "PlugInstall" -c "qa"


CMD ["nvim","-u","/root/.vimrc"]
