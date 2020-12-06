alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

which exa > /dev/null && alias ls='exa --color=always --icons --sort=Name --git --group'
which bat > /dev/null && alias cat='bat'

alias la='ls -a'
alias ll='ls -l'

alias lla='ls -l -a'

alias mkdir='mkdir -p'
alias rmdir='rmdir -p'

alias dc='docker-compose'
alias de='docker exec -it'
alias ly='docker exec -it renv python3'
