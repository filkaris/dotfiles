" Go to error
autocmd FileType php nnoremap <silent> <F2> :call GoToError()<CR>
" Syntax Check
" autocmd FileType php nnoremap <F5> :!php -l %<CR> 
autocmd FileType php nnoremap <silent><buffer> <S-Tab> :<C-U>set foldlevel=1<CR>

" 4 space ident
autocmd FileType php set ts=4 sw=4 expandtab

" PHP manual in php files (=my life is complete)
" sudo pear install doc.php.net/pman
autocmd FileType php set keywordprg=pman
" PHP Setting, NO dollar sign
autocmd FileType php set iskeyword-=$
" Folding
autocmd FileType php let g:php_folding=1
autocmd FileType php set foldlevel=1
autocmd FileType php set foldmethod=syntax
autocmd FileType php set foldnestmax=2


" Delete next PHP Comment block
autocmd FileType php let @d = "/\\/\\*\\*mm/\\*\\/ mnVD"
" Clean variable. From $var['test'] to $test
autocmd FileType php let @c = "dwds]ds'" 
" Error log for var just copied
autocmd FileType php let @e = 'oerror_log( print_r( $0, true ) );' 
" Error log backtrace 
autocmd FileType php let @b = 'o$t = debug_backtrace();foreach( $t as $l )error_log( $l["class"].":".$l["function"]."(".$l["line"].")" );'
" Microtime one row
autocmd FileType php let @m = 'O$s = microtime(true);jo$e = microtime(true);$d = round($e-$s,3);error_log("Total time: $d");'
" Swap two vars inbetween =
let @s = '_dt=wvt;p_Pa $F x_'

" Snippets
iabbrev phpp <?php <CR>
            \declare(strict_types=1);<CR>
            \<CR>
            \class NewClass<CR>
            \{<CR>
            \}

function! GoToError()
    " Need to save file first, % doesn't work
    let file=@%
    let line=system("php -l ".file." 2>&1 | egrep -o [0-9]+$")
    if empty(line)
        echo "File OK"
    else
        execute ":".line
        echo "Error found line ".line
    endif
endfunction

