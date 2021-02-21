let mapleader = "\<space>"

inoremap <C-k> <ESC>
vnoremap <C-k> <ESC>
cnoremap <C-k> <ESC>

nnoremap <silent>,j :call append(line('.'), '')<CR>
nnoremap <silent>,k :call append(line('.')-1, '')<CR>

" nnoremap j gj
" nnoremap k gk
" nnoremap gj j
" nnoremap gk k

nnoremap gh 0
nnoremap gl $

nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>l <C-w>l

nnoremap <silent> <leader>J <C-w>J
nnoremap <silent> <leader>K <C-w>K
nnoremap <silent> <leader>H <C-w>H
nnoremap <silent> <leader>L <C-w>L

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

nmap n nzzzn
nmap N Nzzzn

nnoremap <silent>T :call SplitTerm()<CR>

tnoremap <silent><ESC> <C-\><C-n><C-w><C-p>
tnoremap <silent><C-l> <C-\><C-n>:resize 15<CR>:startinsert<CR>
