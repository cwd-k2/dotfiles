typeset -gAH ZPLGM
export ZPLGM[HOME_DIR]="${EXTRA_APPS_HOME}/zplugin"

if [[ ! -d ${ZPLGM[HOME_DIR]} ]] ; then
  git clone https://github.com/zdharma-continuum/zinit.git ${ZPLGM[HOME_DIR]}
fi

. "${ZPLGM[HOME_DIR]}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zplugin]=_zinit

zinit light "zsh-users/zsh-autosuggestions"
zinit light "zdharma/fast-syntax-highlighting"

zinit wait    lucid for \
  OMZL::git.zsh atload"unalias grv" OMZP::git
zinit wait'!' lucid for \
  OMZL::async_prompt.zsh OMZL::prompt_info_functions.zsh OMZT::candy

if [[ -n "${SSH_CLIENT}" ]] ; then
fi
