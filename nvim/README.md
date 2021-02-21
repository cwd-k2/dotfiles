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

## directory hierarchy

under `rc.d`, non-plugin-related (neovim unique) rc-files are located.

in `pc.d`, there are plugin-related configuration files.
