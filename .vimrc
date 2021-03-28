if &compatible
  set nocompatible
end
set encoding=utf-8

" base
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set cinoptions+=>s,(0,Ws,w1,m1,:0,g0,j1,J1
set cinkeys+=;

set scrolloff=10

set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase

set belloff=all

set splitright
set splitbelow

set hidden
set updatetime=50
set shortmess+=c
"set signcolumn=yes

set noswapfile
set nobackup
set noundofile
set viminfo=

" compat with xdg base dir spec
"set undodir=$XDG_CACHE_HOME/vim/undo
"set directory=$XDG_CACHE_HOME/vim/swap
"set backupdir=$XDG_CACHE_HOME/vim/backup
"set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
"
"set runtimepath=$XDG_CONFIG_HOME/vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$XDG_CONFIG_HOME/vim/after
"
"runtime! init.vim

" visual
set list
set listchars=tab:>\ ,extends:<
set number
set ruler
set wrap
set laststatus=2
set display=lastline
set wildmenu
set showcmd
set showmode
set showmatch
set conceallevel=0

set background=dark

colorscheme elflord

set statusline=#\ [%n]%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ #

" mapping
let mapleader = "\<space>"

nnoremap <slient>,j :call append(line('.'), '')<CR>
nnoremap <slient>,k :call append(line('.')-1, '')<CR>

inoremap <C-k> <ESC>
vnoremap <C-k> <ESC>
cnoremap <C-k> <ESC>

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

syntax enable
filetype plugin indent on
