augroup vimrc_remember_cursor_position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup cpp_change_theme
  autocmd!
  autocmd FileType cpp colorscheme minimalist
augroup END
