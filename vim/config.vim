"""""""""""""""""""" EDITOR OPTIONS """""""""""""""""""
colorscheme peachpuff
syntax on
set ruler
set number
set relativenumber
set shellcmdflag=-c
set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on
" Enable hidden buffers
set hidden
" No endofline
set nofixendofline

" Open new window on the right
set splitright
set splitbelow

" Always Show filename
set laststatus=2
set statusline=%f 
" Color status line
hi StatusLine ctermfg=5
" Disable annoying bells
set visualbell
set t_vb=

" Disable automatic commenting when pressing o
autocmd FileType * setlocal formatoptions-=ro

" FOLDING
let g:javaScript_fold=1   
let g:php_folding=1
let g:xml_syntax_folding = 1
set foldmethod=syntax
hi Folded ctermbg=8
"" This solves foldtext problem
"" Edited out JS folding /usr/share/vim/vim74/syntax/javascript.vim

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"""""""""""""""""""" FILETYPE SPECIFIC """""""""""""""""""
"" PHP ""
" PHP manual in php files (=my life is complete)
" sudo pear install doc.php.net/pman
autocmd FileType php set keywordprg=pman
" PHP Setting, NO dollar sign
autocmd FileType php set iskeyword-=$
autocmd FileType php setlocal foldnestmax=2

"" JS/TS ""
autocmd FileType javascript setlocal foldnestmax=2
" 2 space ident
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

"" Golang ""
autocmd FileType go setlocal foldnestmax=1

"" YAML
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" grep settings
if isdirectory('.git') && executable('git')
  set grepprg=git\ grep\ -nI
endif

" Langmap
" Able to use vim commands even when writing greek
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

" Set Registers
" Clean variable. From $var['test'] to $test
let @c = "dwds]ds'" 
" Delete next PHP Comment block
let @d = "/\\/\\*\\*mm/\\*\\/ mnVD"
" Error log for var just copied
let @e = 'oerror_log( print_r( $0, true ) );' 
" Error log backtrace 
let @b = 'o$t = debug_backtrace();foreach( $t as $l )error_log( $l["class"].":".$l["function"]."(".$l["line"].")" );'
" Microtime one row
let @m = 'O$s = microtime(true);jo$e = microtime(true);$d = round($e-$s,3);error_log("Total time: $d");'
" Swap two vars inbetween =
let @s = '_dt=wvt;p_Pa $F x_'
" Tag close to the next open word
let @t = '/\w$^yf>$pF<a/' 
