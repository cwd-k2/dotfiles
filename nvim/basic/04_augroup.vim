au BufEnter  * if &buftype == 'terminal' | startinsert | endif

augroup RestoreCursor
  au!
  au BufReadPost *
        \ let line = line("'\"")
        \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit' && index(['xxd', 'gitrebase'], &filetype) == -1
        \ |   execute "normal! g`\""
        \ | endif
augroup END
