if &compatible
  set nocompatible
endif

let g:cache_home  = empty($XDG_CACHE_HOME)  ? expand('~/.cache')  : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME

runtime! rc.d/*.vim
