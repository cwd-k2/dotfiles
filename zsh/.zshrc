export EDITER="vim"
export PAGER="less"
export LESSKEY="${XDG_CONFIG_HOME}/less/less"
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"

autoload add-zsh-hook
autoload -Uz select-word-style
autoload -Uz compinit
autoload -Uz vcs_info
autoload -Uz colors
colors

function prepend_path() {
    local i

    for i in "${@}" ; do
        if [[ -z "${PATH}" ]] ; then
            PATH="${i}"
        else
            if [[ "${PATH}" != *${i}* ]] ; then
                PATH="${i}:${PATH}"
            else
                echo "${i} is already included in PATH."
            fi
        fi
    done

}

# ${ZDOTDIR}/${args}/ のディレクトリで *.zsh にマッチしたもの全部読み込み
# ここでは rc.d, rc.local, rc.private の順
function () {
    local i j
    for i in "${@}" ; do
        for j in "${ZDOTDIR}/${i}"/*.zsh ; do
            . "${j}"
        done
    done
} "rc.d" "rc.local" "rc.private"

export PATH
