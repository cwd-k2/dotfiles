if [[ -d "${EXTRA_APPS_HOME}/zplugin" ]] ; then
    typeset -gAH ZPLGM
    export ZPLGM[HOME_DIR]="${EXTRA_APPS_HOME}/zplugin"
    . "${ZPLGM[HOME_DIR]}/bin/zinit.zsh"

    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zplugin]=_zinit

    zinit light "zsh-users/zsh-autosuggestions"
    zinit light "zdharma/fast-syntax-highlighting"
fi
