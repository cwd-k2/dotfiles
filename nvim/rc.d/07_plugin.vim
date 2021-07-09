let g:nvim_cache = g:cache_home . '/nvim'

let g:dein_dir = g:nvim_cache  . '/dein'
let g:nvim_dir = g:config_home . '/nvim'

let g:dein_path = g:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(g:dein_path)
  echo 'Installing dein.vim...'
  call system('git clone https://github.com/Shougo/dein.vim ' . g:dein_path)
endif

let &runtimepath = g:dein_path . ',' . &runtimepath

if dein#load_state(g:dein_dir)
  call dein#begin(g:dein_dir)
  call dein#load_toml(g:nvim_dir . '/dein.toml')
  call dein#load_toml(g:nvim_dir . '/lazy.toml', {'lazy': 1})

  if has('nvim-0.5')
    call dein#load_toml(g:nvim_dir . '/v0_5.toml')
  endif

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install() | call dein#install() | endif

syntax enable
filetype plugin indent on
