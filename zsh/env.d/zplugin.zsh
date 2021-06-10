if [[ -d "${EXTRA_APPS_HOME}/zplugin" ]] ; then
    typeset -gAH ZPLGM
    export ZPLGM[HOME_DIR]="${EXTRA_APPS_HOME}/zplugin"
    . "${ZPLGM[HOME_DIR]}/bin/zplugin.zsh"

    autoload -Uz _zplugin
    (( ${+_comps} )) && _comps[zplugin]=_zplugin

    zplugin light "zsh-users/zsh-autosuggestions"
    zplugin light "zdharma/fast-syntax-highlighting"
fi
