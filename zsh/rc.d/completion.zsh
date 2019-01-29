# completion strengthen ----------------------------------------------
select-word-style default

zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump"

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

setopt print_eight_bit
setopt magic_equal_subst
setopt complete_in_word
setopt always_last_prompt
setopt no_auto_remove_slash
