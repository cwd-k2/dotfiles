augroup ruby_indentation
    autocmd!
    autocmd FileType ruby setlocal tabstop=2 shiftwidth=2
augroup END

augroup haskell_indentation
    autocmd!
    autocmd FileType haskell setlocal tabstop=2 shiftwidth=2
augroup END

augroup cpp_indentation
    autocmd!
    autocmd FileType cpp,c setlocal tabstop=2 shiftwidth=2 cinoptions+=>s,(s,m1,:0,g0,j1,J1
augroup END

augroup javascript_indentation
    autocmd!
    autocmd FileType javascript,typescript,javascriptreact,typescriptreact,json setlocal tabstop=2 shiftwidth=2
augroup END

augroup vimrc_remember_cursor_position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
