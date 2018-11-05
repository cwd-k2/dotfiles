augroup ruby_indentation
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 shiftwidth=2
augroup END

augroup vimrc_remember_cursor_position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
