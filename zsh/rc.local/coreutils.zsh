case "${OSTYPE}" in
    freebsd*|darwin*)
        if [[ "$(which gls > /dev/null ; echo $?)" -eq 0 ]] ; then
            eval "$(gdircolors "${XDG_DATA_HOME}/dircolors/gruvbox.dircolors")"
            alias ls='gls --color=auto'
        fi
esac
