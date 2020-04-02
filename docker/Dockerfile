FROM debian:buster-slim


RUN apt-get update && apt-get install -y neovim curl git nodejs npm

RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY .vimrc /root/.vimrc

RUN nvim -es -u /root/.vimrc -i NONE -c "PlugInstall" -c "qa"

RUN npm install -g javascript-typescript-langserver

# Need to install a TS server which I literally cannot do...

CMD ["nvim","-u","/root/.vimrc"]
