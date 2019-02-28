if [[ -d "${EXTRA_APPS_HOME}/zplugin" ]] ; then
    typeset -gAH ZPLGM
    export ZPLGM[HOME_DIR]="${EXTRA_APPS_HOME}/zplugin"
    . "${ZPLGM[HOME_DIR]}/bin/zplugin.zsh"

    export ENHANCD_FILTER="fzf --reverse --border --cycle --height=10"
    export ENHANCD_DIR="${XDG_CACHE_HOME}/enhancd"
    export ENHANCD_COMMAND="ef"

    zplugin light "b4b4r07/enhancd"
    zplugin light "zsh-users/zsh-autosuggestions"

    autoload -Uz _zplugin
    (( ${+_comps} )) && _comps[zplugin]=_zplugin

    zplugin light "zdharma/fast-syntax-highlighting"
fi
