# history ------------------------------------------------------------
HISTFILE="${XDG_CACHE_HOME}/zsh/zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
