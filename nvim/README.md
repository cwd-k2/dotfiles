# neovim configuration

my neovim configuration files.

## dependencies

- node

```sh
$ go get -u golang.org/x/tools/cmd/goimports
$ go get -u golang.org/x/tools/gopls
```

## after

- `:CocInstall coc-tsserver coc-json coc-html coc-css coc-eslint coc-prettier coc-explorer coc-clangd`

## Don't forget...

- `compile_flags.txt`
- set `Allow clipboard access to terminal apps` for iTerm2 (macOS)
- for swift
  1. clone `github.com/apple/swift`
  1. move `utils/vim/{ftplugin,ftdetect,syntax}` to `$XDG_DATA_HOME/nvim/site`

## directory hierarchy

under `rc.d`, non-plugin-related (neovim unique) rc-files are located.

in `pc.d`, there are plugin-related configuration files.
