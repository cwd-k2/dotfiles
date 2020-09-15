function! Writing()
    call goyo#execute(0, [])
    set noautoindent
    set nosmartindent
    set noshowmode
    set noshowcmd
    set nowildmenu
    set nolist
    set noshowmatch
    set scrolloff=20
    colorscheme industry
endfunction

nnoremap <silent>,w :<C-u>call Writing()<CR>
