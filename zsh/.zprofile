# as a ssh server
if [[ -n "${SSH_CLIENT}" ]] ; then
    # tmux session
    if [[ -z "${TMUX}" ]] ; then
        function __fzf() {
            "${EXTRA_APPS_HOME}"/fzf/bin/fzf --reverse --border --cycle --height=10 "${@}"
        }
        function __tmux() {
            tmux -f "${XDG_CONFIG_HOME}/tmux/tmux.conf" "${@}"
        }
        ID=$( echo "$(tmux ls)\nNEW SESSION: create a new tmux session" \
            | sed '/^$/d' \
            | __fzf \
            | cut -d: -f1
        )
        if [[ "${ID}" = "NEW SESSION" || "${ID}" = "" ]] ; then
            exec __tmux new
        else
            exec __tmux attach -t "${ID}"
        fi
    fi
fi
