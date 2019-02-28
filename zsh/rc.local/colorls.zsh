if [[ "$(which colorls > /dev/null ; echo $?)" -eq 0 ]] ; then
    alias k='colorls --gs -Al'
    alias t='colorls --gs --tree -A'
fi

