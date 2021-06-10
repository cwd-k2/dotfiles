case "${OSTYPE}" in
  darwin*)
    if [[ -d "/usr/local/opt/fzf" ]] ; then
      . "/usr/local/opt/fzf/shell/completion.zsh"
      . "/usr/local/opt/fzf/shell/key-bindings.zsh"
    fi
    ;;
  linux*)
    if [[ -d "/usr/share/fzf" ]] ; then
      . "/usr/share/fzf/completion.zsh"
      . "/usr/share/fzf/key-bindings.zsh"
    fi
    ;;
esac
