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
