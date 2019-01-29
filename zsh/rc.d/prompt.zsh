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
}

pr1="%F{237}%K{248} %~ %F{248}"

PROMPT='$pr1${vcs_info_msg_0_}%K{000}
$pr3 %F{223}'

function zle-keymap-select zle-line-init zle-line-finish {
    case "${KEYMAP}" in
        main|viins)
            pr3="%K{248}%F{237} %BVIINS%b %F{248}%K{000}"
            ;;
        vicmd)
            pr3="%K{109}%F{237} %BVICMD%b %F{109}%K{000}"
            ;;
    esac

    zle reset-prompt
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish
zle -N edit-command-line

setopt correct

SPROMPT='%F{247}correct: %B%F{167}%R%F{247} -> %F{109}%r%F{247}%b ? [N/Y/A/E] %F{223}'
