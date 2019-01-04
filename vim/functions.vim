"""""""""""""""""""" FUNCTIONS """""""""""""""""""
function! ToggleFold() 
    if &foldmethod=="syntax"
        set foldmethod=manual
    else
        set foldmethod=syntax
    endif
    echo "foldmethod:"&foldmethod
endfunction
function! ToggleUnderscore() 
    if &iskeyword=~"_"
        set iskeyword-=_
        echo "iskeyword: No Underscore"
    else
        set iskeyword+=_
        echo "iskeyword: With Underscore"
    endif
endfunction
function! PhpDocument()
    let method=&foldmethod
    set foldmethod=manual
    call PhpDocSingle()
    let &foldmethod=method
endfunction
" PHP syntax check
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
