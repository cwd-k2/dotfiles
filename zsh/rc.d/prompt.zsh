# prompt -------------------------------------------------------------
setopt prompt_subst
setopt prompt_percent

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%K{214}%F{237} %B!%b %F{214}"
zstyle ':vcs_info:git:*' unstagedstr "%K{167}%F{237} %B+%b %F{167}"
zstyle ':vcs_info:*' formats "%K{237}%F{248}  %b %F{237}%c%u"
zstyle ':vcs_info:*' actionformats "%K{237}%F{248} %b | %a %F{237}%c%u"

function precmd {
    vcs_info
    __tmp_path_indicator
}

pr1="%F{237}%K{248} %m  "

PROMPT='$pr1$pr2${vcs_info_msg_0_}%K{000}
$pr3 %F{223}'

function __tmp_path_indicator() {
    local tmp_path="${PWD}"

    if [[ "${tmp_path}" =~ "^${HOME}" ]] ; then
        tmp_path="~${tmp_path#$HOME}"
    fi

    if [[ "${#tmp_path}" -gt 30 ]] ; then
        local base="${tmp_path##*/}"
        local fore="${tmp_path%/*}"
        while [[ "${#fore}" -gt 2 ]] ; do
            if [[ "${fore##*/}" =~ "^\." ]] ; then
                base="${${fore##*/}[1,2]}/${base}"
            else
                base="${${fore##*/}[1]}/${base}"
            fi
            fore="${fore%/*}"
        done
        tmp_path="${fore}/${base}"
    fi

    pr2="${tmp_path} %F{248}"
}

function __keymap_indicator() {
    case "${KEYMAP}" in
        main|viins)
            pr3="%K{248}%F{237}%B VIINS %b%F{248}%K{000}"
            ;;
        vicmd)
            pr3="%K{109}%F{237}%B VICMD %b%F{109}%K{000}"
            ;;
    esac
}

function zle-keymap-select zle-line-init zle-line-finish {
    __keymap_indicator
    zle reset-prompt
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish
zle -N edit-command-line

setopt correct

SPROMPT='%F{247}correct: %B%F{167}%R%F{247} -> %F{109}%r%F{247}%b ? [N/Y/A/E] %F{223}'
