function prepend_path() {

  local i

  for i in "${@}" ; do
    if [[ -z "${PATH}" ]] ; then
      export PATH="${i}"
    else
      if [[ "${PATH}" != *${i}* ]] ; then
        export PATH="${i}:${PATH}"
      else
        # echo "${i} is already included in PATH."
      fi
    fi
  done
}
# ${ZDOTDIR}/${args}/ のディレクトリで *.zsh にマッチしたもの全部読み込み
# ここでは rc.d, rc.local, rc.private の順
function () {
  local i j

  for i in "${@}" ; do
    if [[ -d "${ZDOTDIR}/${i}" ]] ; then
      for j in "${ZDOTDIR}/${i}"/*.zsh ; do
        . "${j}"
      done
    fi
  done
} "env.d" "rc.d" "rc.private"

prepend_path "${HOME}/.local/bin" "${HOME}/.local/sbin"
compinit -u -d "${XDG_CACHE_HOME}/zsh/zcompdump"
