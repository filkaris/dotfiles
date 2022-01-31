source ~/.config/nvim/init.vim

" Set a mark on statusline to know we are using this config
set statusline+=[IDE]
" Configure phpunit with Quickfix
"compiler phpunit
"let current_compiler="phpunit"
"set makeprg=vendor/bin/phpunit\ $*
"TODO Only matches first match, should match last
" https://stackoverflow.com/questions/5244871/vim-errorformat-for-phpunit
"set errorformat=%E%n)\ %.%#,%Z%f:%l,%C%m,%C,%-G%.%#

" Simple plugin to do the same with phpstan
" https://github.com/phpstan/vim-phpstan

" Plugin configuration
"" Git Blame
nmap <C-G>b :<C-U>!git blame %<CR>
"" Git Rename (mv)
nmap <C-G>m :<C-U>!git mv % %
"" Quick fix on save
nmap <Leader>a :let b:ale_fix_on_save=0<CR>
"" st solarized defaults for autocomplete
hi Pmenu ctermfg=2 ctermbg=0

" PHP
" For Alt: Edit > Keyboard Shortcuts > Enable menu access keys
" set omnicomplete function
autocmd FileType php setlocal omnifunc=phpactor#Complete
" Add Use statements
autocmd BufEnter *.php nnoremap <M-CR> :<C-U>call phpactor#UseAdd()<CR>
nnoremap <M-c> :<C-U>call phpactor#ContextMenu()<CR>
nnoremap <M-r> :<C-U>call phpactor#Transform()<CR>
" Extract Selection
vnoremap <M-e> <ESC>:<C-U>call phpactor#ExtractMethod()<CR>
" Try catch block
vnoremap <M-t> <ESC>`<Otry {<ESC>`>o}<ESC>>i}<C-o>a catch (\Exception $e) {<CR>dd($e);<CR>}<ESC>

" Testing
au FileType php nnoremap <M-t> :<C-U>echo " (t) Run Last Test\n (r) Run Current Test\n (f) Run Current File\n (w) Watch file (copy command to clipboard)\nEnter Option: " \| call PHPTestPrompt(getchar())<CR>
function! PHPTestPrompt(name)
    if nr2char(a:name) == 't'
        execute "!vendor/bin/phpunit --filter ".@t
    elseif nr2char(a:name) == 'r'
        execute "normal! ?public.function\<CR>2w\"tyw"
        execute "!vendor/bin/phpunit --filter ".@t
    elseif nr2char(a:name) == 'f'
        execute "!vendor/bin/phpunit ".@%
    elseif nr2char(a:name) == 'w'
        let @+='watch --color vendor/bin/phpunit '.@%.' --color=always'
    endif
endfunction

"Go
" Stupid gofmt
let g:go_fmt_experimental = 1
" Testing
au FileType go nnoremap <M-t> :<C-U>echo " (t) Run Last Test\n (r) Run Current Test\n (f) Run Current File\n (w) Watch file (copy command to clipboard)\nEnter Option: " \| call GoTestPrompt(getchar())<CR>
function! GoTestPrompt(name)
    if nr2char(a:name) == 't'
        execute "!go test -run ".@t." ".@%
    elseif nr2char(a:name) == 'r'
        execute "normal! ?^func\<CR>w\"tyw"
        execute "!go test -run ".@t." ".@%
    elseif nr2char(a:name) == 'f'
        execute "!go test ".@%
    elseif nr2char(a:name) == 'w'
        let @+='watch --color go test '.@%.' --color=always'
    endif
endfunction



" NCM2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" JS file Import
autocmd BufEnter *.js,*.ts,*.tsx nnoremap <M-CR> yiw:r !cat tags \| egrep '^0' \| awk '{print $2;}'<CR>

" Tsuquyomi
" Disable auto quickfix on save
let g:tsuquyomi_disable_quickfix = 1

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" GUTENTAGS 
" CTAGS, works with plugin. To work manually, just run ctags --exclude=node_modules/* --exclude... --append FILENAME (to update just one file)
" DO NOT GENERATE CTAGS ID ALREADY EXISTS
let g:gutentags_enabled=1
let g:gutentags_generate_on_new=0
" Exclude folders
let g:gutentags_ctags_exclude=['node_modules/*','public/*','var/cache/*','*.css','*.min.js','build/*','vendor/*.json']
" Add js syntax, removes all other tags
"let g:gutentags_ctags_extra_args=['--regex-javascript=/^[\ \t]*(export)?[\ \t]*function[\ \t]+([a-zA-Z0-9_]+)/\\2/f,functions/']
" Show [ctags] in statusline to see when it is indexing
set statusline+=%{gutentags#statusline('\ [',']')}

" ALE
let g:ale_enabled=1
let g:ale_linters={'php':['php','phpcs','phpstan'], 'javascript':['eslint'], 'typescript':['eslint','tsserver'], 'bash':['shellcheck'], 'go':['golangci-lint']}
let g:ale_fixers={'php':['phpcbf', 'php_cs_fixer'],'javascript':['prettier'],'typescript':['prettier'],'typescriptreact':['prettier'], 'go':['gofmt'], 'elixir':['mix_format']}
let g:ale_fix_on_save = 1
"let g:ale_php_phpcs_executable='php vendor/bin/phpcs'
let g:ale_php_phpstan_executable='vendor/bin/phpstan'
"let g:ale_phpcbf_executable='php vendor/bin/phpcbf'
"let g:ale_javascript_eslint_executable=''
"let g:ale_javascript_prettier_executable=''
let g:ale_go_golangci_lint_executable='/home/fkarailanidis/go/bin/golangci-lint'
let g:ale_go_golangci_lint_package=1
let g:ale_go_gopls_executable='/home/fkarailanidis/go/bin/gopls'
"ALE move through errors
nnoremap <M-j> :<C-U>ALENextWrap<CR>zo
function! ToggleAleWindow()
    if !exists("b:ale_open_list")
        let b:ale_open_list=0
    endif
    if empty(b:ale_open_list)
        let b:ale_open_list=1
        ALELint
    else
        let b:ale_open_list=0
        only
    endif
endfunction
"Close window 
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END   
nnoremap <M-l> :<C-U>call ToggleAleWindow()<CR>
nnoremap <Leader>a :let b:ale_fix_on_save=0<CR>

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    return l:counts.total == 0 ? '' : '*'
endfunction

set statusline+=%{LinterStatus()}

" GOLANG
" au BufWritePost *.go !go build %
au FileType go nnoremap <M-CR> yiw:<C-U>GoImport 0<CR>

