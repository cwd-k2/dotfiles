export GEMRC="${XDG_CONFIG_HOME}/gem/gemrc"
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}/gem/specs"

export BUNDLE_USER_CONFIG="${XDG_CONFIG_HOME}/bundle"
export BUNDLE_USER_PLUGIN="${XDG_DATA_HOME}/bundle"
export BUNDLE_USER_CACHE="${XDG_CACHE_HOME}/bundle"

function bundle() {
    if [[ "${1}" = "install" ]] ; then
        command bundle "${@}" --path vendor/bundle
    else
        command bundle "${@}"
    fi
}

function rails() {
    if [[ "${1}" = "new" ]] ; then
        command bundle exec rails "${@}" --skip-bundle
    else
        command bundle exec rails "${@}"
    fi
}
