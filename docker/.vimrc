call plug#begin('~/.vim/plugged')
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'w0rp/ale'
call plug#end()

set hidden

let g:LanguageClient_serverCommands = { 
	\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
	\ 'typescript': ['/usr/local/bin/javascript-typescript-stdio'],
	\ 'typescript.tsx': ['/usr/local/bin/javascript-typescript-stdio'] }

let g:ale_enabled=1
let g:ale_linters={'php':['php','phpcs','phpstan'], 'javascript':['eslint'], 'typescript':['eslint','tsserver'], 'go':['golangci-lint']}
let g:ale_fixers={'php':['phpcbf'],'javascript':['prettier'],'typescript':['prettier'], 'go':['gofmt']}

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <M-CR> :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

nmap <C-j> :<C-U>Buffer<CR>
nmap <C-h> :<C-U>GFiles<CR>
nmap <M-h> :<C-U>Files<CR>
