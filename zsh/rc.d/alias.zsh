alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

which eza > /dev/null && alias ls='eza --color=always --icons --sort=Name --git --group-directories-first'
which bat > /dev/null && alias cat='bat'

alias la='ls -a'
alias ll='ls -l'

alias lla='ls -l -a'

alias mkdir='mkdir -p'
alias rmdir='rmdir -p'

# alias dc='docker compose'
# alias de='docker exec -it'
# alias ly='docker exec -it renv python3'
