"""""""""""""""""""" KEY MAPPINGS"""""""""""""""""""

"""""" LEADER MAPPINGS """"""
"" Set Leader 
let mapleader = ","
"" Search but do not jimp
nmap <Leader>* *``
"" Copy to clipboard register
nmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
"" Easy case insensitive search
nmap <Leader>/ /\c
"" Toggle fold method
nmap <silent> <Leader>f :<C-U>call ToggleFold()<CR>
"" Grep current word
" Copy Current word
" Grep it (custom command set to git grep), populate quickfix list
" OK, open quickfix window, go to first result
nmap <Leader>g yiw:<C-U>grep 0<CR><CR>:cope<CR><CR>

vmap <Leader>s :sort<CR>

"""""" CTRL MAPPINGS """"""
"" Fzf
"nmap <C-J> :e **/*
nmap <C-j> :<C-U>Buffer<CR>
nmap <C-h> :<C-U>GFiles<CR>
nmap <M-h> :<C-U>Files<CR>
"" Switch between files homerow
nnoremap <C-K> <C-^>
"" Mimic org mode, expand folds with tab
"" TAB: if fold closed, focus it, else go on top
""nnoremap <expr> <Tab> foldclosed(".")==-1 ? 'zazz' : 'zazt'
nnoremap <Tab> zazz
nnoremap <Leader><Tab> zO
"" SHIFT TAB: filetype dependent behavior
autocmd FileType go nnoremap <silent><buffer> <S-Tab> :<C-U>set foldlevel=0<CR>
autocmd FileType go set foldlevel=0
"" C-I is also tab, so remap it to C-P
nnoremap <C-P> <C-I>
"" Clear highlight
nnoremap <C-L> :<C-U>noh<CR>

" Quickfix list shortcuts
"Using quickfix (c) not location (l) because it's global
"and I'm mostly working with one search at a time
" Next-previous
nnoremap <C-Q>j :<C-U>cn<CR>
nnoremap <C-Q>k :<C-U>cp<CR>
nnoremap <C-Q><C-J> :<C-U>cnew<CR>
nnoremap <C-Q><C-K> :<C-U>col<CR>
" :chi - history

"" Make long jk movements (more than 1 ) be jumps
nnoremap <silent> k :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>
nnoremap <silent> j :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>

"" Map H and L to start/end of line
nnoremap H ^
nnoremap L g_
nnoremap Q @q

"""""""""""""""""""" VISUAL MAPPINGS """""""""""""""""""
"" Search selected text
vnoremap // y/<C-R>"<CR>
"" Paste Copied buffer, not Deleted
vnoremap P "0p

"""""""""""""""""""" CUSTOM COMMANDS """""""""""""""""""
command Q q
command W w
" 'command' cannot use autocomplete
cnoreabbrev E e
" Define a custom command :Jq to format JSON using jq
command! Jq call FormatJsonWithJq()
function! FormatJsonWithJq()
  if executable('jq')
    %!jq .
  else
    echo "jq is not installed. Please install jq to use this command."
  endif
endfunction

"" Light mode tweaks for mate terminal
nmap <Leader>l :hi Folded ctermbg=7<CR>:hi Pmenu ctermbg=7<CR>
"" Dark mode tweaks for mate terminal
nmap <Leader>d :hi Folded ctermbg=0<CR>:hi Pmenu ctermbg=0<CR>

"" Read all into buffer
"nmap <Leader>r :ar *<CR>
"" Surround braces/parens with spaces
"nmap <Leader><space>] ysi]<space><space>
"nmap <Leader><space>) ysi)<space><space>
"" Append ;
"nmap <Leader>; A;
"" Ability to toggle underscore on demand 
"nmap <silent> <Leader>- :<C-U>call ToggleUnderscore()<CR>
"" Generate random string
"nmap <Leader>g :r! openssl rand -base64 12<CR>
