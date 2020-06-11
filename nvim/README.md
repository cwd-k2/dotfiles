# neovim configuration

my neovim configuration files.

## dependencies

- git
- python / pip (I use python 3)
- golang

## what you have to do

- setup git, python / pip, golang (manually)
- run `pip install neovim`.
- launch neovim.
    - execute some commands.
        - run `:UpdateRemotePlugins`.
        - run `:VimProcInstall`. -- see `:help vimproc`
        - run `:GoInstallBinaries`.

## directory hierarchy

under `rc.d`, non-plugin-related (neovim unique) rc-files are located.

in `pc.d`, there are plugin-related configuration files.
