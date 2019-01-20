augroup ruby_indent_preference
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 shiftwidth=2
augroup END

augroup vim_lightweight_highlight
  autocmd!
  autocmd Syntax * if 500 < line('$') | syntax sync minlines=100 | endif
augroup END
