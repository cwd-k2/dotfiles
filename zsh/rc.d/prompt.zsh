# prompt -------------------------------------------------------------
setopt prompt_subst
setopt prompt_percent

setopt correct

zstyle ':vcs_info:*'     formats       $'\n(%s) <%b>%c%u'
zstyle ':vcs_info:*'     actionformats $'\n(%s) <%b|%a>%c%u'
zstyle ':vcs_info:git:*' stagedstr     $' |!|'
zstyle ':vcs_info:git:*' unstagedstr   $' |*|'
zstyle ':vcs_info:git:*' check-for-changes true

function precmd { vcs_info }

if [[ -n "${SSH_CLIENT}" ]] ; then
  PROMPT=$'---------- ($(date "+%m/%d %H:%M:%S"))\n%n @ [ssh:%m:%~] ${vcs_info_msg_0_}\n%# '
else
  PROMPT=$'---------- ($(date "+%m/%d %H:%M:%S"))\n%n @ [%m:%~] ${vcs_info_msg_0_}\n%# '
fi

SPROMPT='? %B%R%b -> %B%r%b [N/Y/A/E] '
