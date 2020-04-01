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
set foldmethod=syntax
hi Folded ctermbg=8
"" This solves foldtext problem
"" Edited out JS folding /usr/share/vim/vim74/syntax/javascript.vim


"""""""""""""""""""" FILETYPE SPECIFIC """""""""""""""""""

"" Markdown ""
au FileType markdown nnoremap <Tab> zA

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

