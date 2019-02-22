export EDITER="vim"
export PAGER="less"
export LESSKEY="${XDG_CONFIG_HOME}/less/less"
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"

autoload add-zsh-hook
autoload -Uz select-word-style
autoload -Uz compinit
autoload -Uz vcs_info
autoload -Uz colors
colors
