# keybind settings ---------------------------------------------------
if [[ -n "${RICH_PROMPT}" ]] ; then
    bindkey -v

    bindkey -M viins '^N' down-line-or-history
    bindkey -M viins '^P' up-line-or-history
    bindkey -M viins '^K' vi-cmd-mode
    bindkey -M viins '^F' forward-char
    bindkey -M viins '^B' backward-char
else
    bindkey -e
fi
