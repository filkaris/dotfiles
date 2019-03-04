source ~/.vimrc

" Set a mark on statusline to know we are using this config
set statusline+=[IDE]
" Configure phpunit with Quickfix
"compiler phpunit
"let current_compiler="phpunit"
"set makeprg=vendor/bin/phpunit\ $*
"TODO Only matches first match, should match last
" https://stackoverflow.com/questions/5244871/vim-errorformat-for-phpunit
"set errorformat=%E%n)\ %.%#,%Z%f:%l,%C%m,%C,%-G%.%#

" Plugin configuration
"" Git Blame
nmap <C-G>b :<C-U>!git blame %<CR>
"" Git Rename (mv)
nmap <C-G>m :<C-U>!git mv % %
"" Find and run test
nmap <M-S-t> ?function\\|class<CR>w"tyiw:<C-U>!vendor/bin/phpunit --filter t<CR>
"" Run last test
nmap <M-t> :<C-U>!vendor/bin/phpunit --filter t<CR>
"" Copy to clipboard: watch tests for file (paste in terminal)
nmap <Leader>t :let @+='watch --color vendor/bin/phpunit '.@%.' --color=always'<CR>
"" Light mode tweaks
nmap <Leader>l :hi Folded ctermbg=7<CR>
"" Dark mode tweaks
nmap <Leader>d :hi Folded ctermbg=0<CR>
"" Quick fix on save
nmap <Leader>a :let b:ale_fix_on_save=0<CR>

" PHPACTOR
" set omnicomplete function
autocmd FileType php setlocal omnifunc=phpactor#Complete
" Add Use statements
" Edit > Keyboard Shortcuts > Enable menu access keys
nnoremap <M-CR> :<C-U>call phpactor#UseAdd()<CR>
nnoremap <M-r> :<C-U>call phpactor#Transform()<CR>
nnoremap <M-c> :<C-U>call phpactor#ContextMenu()<CR>
" TEMP
nnoremap <M-m> :<C-U>!chmod a+x vendor/bin/* node_modules/.bin/* node_modules/eslint/bin/*<CR>

" NCM2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

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
let g:gutentags_ctags_exclude=['node_modules/*','public/*','var/cache/*','*.css']
" Add js syntax, removes all other tags
"let g:gutentags_ctags_extra_args=['--regex-javascript=/^[\ \t]*(export)?[\ \t]*function[\ \t]+([a-zA-Z0-9_]+)/\\2/f,functions/']
" Show [ctags] in statusline to see when it is indexing
set statusline+=%{gutentags#statusline('\ [',']')}

" ALE
let g:ale_enabled=1
let g:ale_linters={'php':['php','phpcs','phpstan'], 'javascript':['eslint'], 'typescript':['eslint','tsserver'], 'bash':['shellcheck']}
let g:ale_fixers={'php':['phpcbf'],'javascript':['prettier'],'typescript':['prettier']}
let g:ale_fix_on_save = 1
"let g:ale_php_phpcs_executable='php vendor/bin/phpcs'
let g:ale_php_phpstan_executable='vendor/bin/phpstan'
"let g:ale_phpcbf_executable='php vendor/bin/phpcbf'
"let g:ale_javascript_eslint_executable=''
"let g:ale_javascript_prettier_executable=''
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
au BufWritePost *.go !go build %
au FileType go nnoremap <M-CR> yiw:<C-U>GoImport 0<CR>

" Snippets
iabbrev php <?php <CR>
            \declare(strict_types=1);<CR>
            \<CR>
            \class NewClass<CR>
            \{<CR>
            \}
