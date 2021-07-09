# completion strengthen ----------------------------------------------
select-word-style default

export WORDCHARS=${WORDCHARS:s?/?}

zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:cd:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path $path
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

setopt print_eight_bit
setopt magic_equal_subst
setopt complete_in_word
setopt always_last_prompt
setopt brace_ccl
