if [[ "$(which colorls > /dev/null ; echo $?)" -eq 0 ]] ; then
    alias k='colorls'
    alias ka='colorls -A'
    alias kk='colorls -l'
    alias kka='colorls -Al'
    alias t='colorls --tree'
    alias ta='colorls --tree -A'
fi

