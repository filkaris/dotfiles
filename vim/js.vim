autocmd FileType javascript nnoremap <silent><buffer> <S-Tab> :<C-U>set foldlevel=1<CR>

autocmd FileType javascript let g:javaScript_fold=1   
autocmd FileType javascript set foldlevel=1
autocmd FileType javascript setlocal foldnestmax=2
"" This solves foldtext problem
"" Edited out JS folding /usr/share/vim/vim74/syntax/javascript.vim

" 2 space ident
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

iabbrev tsxx import * as React from "react";<CR>
            \<CR>
            \interface IProps {<CR>
            \    children: any<CR>
            \}<CR>
            \export default function Component(props: IProps) {<CR>
            \   return <></>;<CR>
            \}

