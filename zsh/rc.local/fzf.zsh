if [[ -d "${EXTRA_APPS_HOME}/fzf" ]] ; then
    bindkey -v

    . "${EXTRA_APPS_HOME}/fzf/shell/completion.zsh"
    . "${EXTRA_APPS_HOME}/fzf/shell/key-bindings.zsh"

    prepend_path "${EXTRA_APPS_HOME}/fzf/bin"
fi
