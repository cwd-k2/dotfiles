inoremap <C-k> <ESC>
vnoremap <C-k> <ESC>
cnoremap <C-k> <ESC>

nnoremap <silent>,j :call append(line('.'), '')<CR>
nnoremap <silent>,k :call append(line('.')-1, '')<CR>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

nmap n nzzzn
nmap N Nzzzn
