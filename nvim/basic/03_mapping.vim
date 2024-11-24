let mapleader = "\<space>"

inoremap <C-k> <ESC>
vnoremap <C-k> <ESC>
cnoremap <C-k> <ESC>

inoremap <C-g> <ESC>
vnoremap <C-g> <ESC>
cnoremap <C-g> <ESC>

nnoremap <silent>,j :call append(line('.'), '')<CR>
nnoremap <silent>,k :call append(line('.')-1, '')<CR>

nnoremap j gj
nnoremap k gk

nnoremap gh 0
nnoremap gl $
nnoremap gk gg
nnoremap gj G

inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>l <C-w>l

nnoremap <silent> <leader>J <C-w>J
nnoremap <silent> <leader>K <C-w>K
nnoremap <silent> <leader>H <C-w>H
nnoremap <silent> <leader>L <C-w>L

nnoremap <silent> <leader>y :<C-u>%y+<CR>

nmap n nzzzn
nmap N Nzzzn

imap <Nul> <Nop>

nnoremap <silent>T :call SplitTerm()<CR>

tnoremap <silent><ESC> <C-\><C-n><C-w><C-p>
tnoremap <silent><C-l> <C-\><C-n>:resize 20<CR>:startinsert<CR>
