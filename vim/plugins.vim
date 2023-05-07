" Vundle configuration
set nocompatible        " be iMproved, required
filetype off            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()     " or vundle#begin('path-to-install')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin list

" CORE
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'L9'

" UTILITY
" FastFold
Plugin 'Konfekt/FastFold'
" Show git diffs in file
Plugin 'airblade/vim-gitgutter'
" Mkdir when saving file
Plugin 'benizi/vim-automkdir'

" SYNTAX 
Plugin 'nginx.vim'
Plugin 'lumiliet/vim-twig'

" IDE
" LSP config
Plugin 'neovim/nvim-lspconfig'
" FuzzyFind
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Ctags
Plugin 'ludovicchabant/vim-gutentags' "install ctags binary
" Autocompletion
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
Plugin 'phpactor/phpactor' "run composer install
Plugin 'phpactor/ncm2-phpactor'
" Simple wrapper. CSS completion is vim native
Plugin 'ncm2/ncm2-cssomni'
Plugin 'vim-vdebug/vdebug'

" Linting
Plugin 'w0rp/ale'
" Quickfix PHPUnit TODO
"Bundle 'joonty/vim-phpunitqf.git'
"Plugin 'afternoon/vim-phpunit'
" EditorConfig (.editorconfig)
"Plugin 'editorconfig/editorconfig-vim'

" JSX IDE
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
"" Typescript
" .ts syntax
Plugin 'leafgarland/typescript-vim'
" .tsx syntax
Plugin 'peitalin/vim-jsx-typescript'
" Omni-complete WORKS BUT SLOWS STUFF DOWN
Plugin 'Quramy/tsuquyomi'
" Omni-complete dependency
Plugin 'Shougo/vimproc.vim' "run make

" GoLang IDE
Plugin 'fatih/vim-go'
Plugin 'ncm2/ncm2-go'

" ELM
Plugin 'ElmCast/elm-vim'

" Svelte
Plugin 'evanleck/vim-svelte'

" Markdown folding
Plugin 'masukomi/vim-markdown-folding'

" Elixir
Plugin 'elixir-editors/vim-elixir'

" Openscad
Plugin 'sirtaj/vim-openscad'

" NEW lsp
"Plugin 'neovim/nvim-lspconfig'

" Theme
Plugin 'EdenEast/nightfox.nvim'

call vundle#end()		" required
filetype plugin indent on	" required

" Defaults: override in IDE
" disable gutentags
let g:gutentags_enabled=0
" disable ale
let g:ale_enabled=0
let g:ale_linters={}
let g:ale_fixers={}
" Fzf color white invisible in light theme
let g:fzf_colors={'fg':['fg', 'Comment']}

" NETRW
nmap <M-w> :<C-U>Lexplore<CR>
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
"TODO toggle

" GitGutter
" For faster updates
set updatetime=100
" Custom mappings, consistent with our C-. for moving around
" C-W j down window
" C-Q j down quickfix
" C-G j down git
nnoremap <C-G>j :<C-U>GitGutterNextHunk<CR>
nnoremap <C-G>k :<C-U>GitGutterPrevHunk<CR>
nnoremap <C-G>p :<C-U>GitGutterPreviewHunk<CR>
nnoremap <C-G>r :<C-U>GitGutterUndoHunk<CR>
