" NO compat with vi
if &compatible
    set nocompatible
end

" compat with xdg base dir spec
set undodir=$XDG_CACHE_HOME/vim/undo
set directory=$XDG_CACHE_HOME/vim/swap
set backupdir=$XDG_CACHE_HOME/vim/backup
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo

set runtimepath=$XDG_CONFIG_HOME/vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$XDG_CONFIG_HOME/vim/after

runtime! init.vim
