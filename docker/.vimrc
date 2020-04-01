call plug#begin('~/.vim/plugged')
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set hidden

let g:LanguageClient_serverCommands = { 'javascript': ['/usr/local/bin/javascript-typescript-stdio'] }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

nmap <C-j> :<C-U>Buffer<CR>
nmap <C-h> :<C-U>GFiles<CR>
nmap <M-h> :<C-U>Files<CR>
