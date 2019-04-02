inoremap <C-k> <ESC>
vnoremap <C-k> <ESC>

nnoremap <silent>,j :call append(line('.'), '')<CR>
nnoremap <silent>,k :call append(line('.')-1, '')<CR>

nmap n nzzzn
nmap N Nzzzn
