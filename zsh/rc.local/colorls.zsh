if [[ "$(which colorls > /dev/null ; echo $?)" -eq 0 ]] ; then
    alias ks='colorls --gs -Al'
    alias tree='colorls --gs --tree -A'
fi

