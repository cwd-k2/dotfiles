au TermClose * close
au BufEnter  * if &buftype == 'terminal' | startinsert | endif
