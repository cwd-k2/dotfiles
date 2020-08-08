augroup vimrc_remember_cursor_position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup cpp_change_theme
  autocmd!
  autocmd FileType cpp colorscheme minimalist
  autocmd FileType cpp highlight Normal ctermbg=none
  autocmd FileType cpp highlight Nontext ctermbg=none
  autocmd FileType cpp highlight Pmenu ctermbg=95
  autocmd FileType cpp AirlineTheme minimalist
augroup END
