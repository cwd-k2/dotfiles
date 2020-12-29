# zsh config

## haskell

Decided to use `ghcup` and `haskell-stack`.

```sh
# install ghcup; then go install ghc, cabal, hls (haskell-language-server)
$ curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
# use system ghc on stack
$ stack config set system-ghc --global true
```

## swift

`sourcekit-lsp` is at `/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp`.

```sh
# sourcekit-lsp
$ ln -s /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp ~/.local/bin/sourcekit-lsp
```

## clang

`clangd` is at `/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clangd`.

```sh
# clangd
$ ln -s /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clangd ~/.local/bin/clangd
```
