augroup vimrc_remember_cursor_position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup cpp_change_theme
  autocmd!
  autocmd FileType cpp colorscheme onedark
  " autocmd FileType cpp highlight Normal ctermbg=none
  " autocmd FileType cpp highlight Nontext ctermbg=none
  autocmd FileType cpp highlight Pmenu ctermbg=239
  autocmd FileType cpp highlight CocUnderline cterm=underline
  autocmd FileType cpp AirlineTheme minimalist
augroup END
