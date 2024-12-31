export BUN_INSTALL="${EXTRA_APPS_HOME}/bun"

[ -s "${BUN_INSTALL}/_bun" ] && source "${BUN_INSTALL}/_bun"

prepend_path "${BUN_INSTALL}/bin"
