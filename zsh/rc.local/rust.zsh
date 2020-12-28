export CARGO_HOME="${EXTRA_APPS_HOME}/cargo"

if [[ -d "${CARGO_HOME}" ]] ; then
  prepend_path "${CARGO_HOME}/bin" > /dev/null
fi
