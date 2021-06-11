# minimum required environments

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.local/etc}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.local/var/cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EXTRA_APPS_HOME="${HOME}/.local/opt"
export EXTRA_VARS_HOME="${HOME}/.local/var"
