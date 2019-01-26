# neovim configuration

my neovim configuration files.

highly depending on dein.vim.

## dependencies

- git
- python / pip (I use python 3)
- golang

## what you have to do

- setup git, python / pip, golang (manually. maybe OS's packaging system is quite a bit useful.)
- run `pip install --user-install neovim`.
- launch neovim.
    - execute some commands.
        - run `:VimProcInstall`. -- see `:help vimproc`
        - run `:GoInstallBinaries`.

## directory hierarchy

under `rc.d`, non-plugin-related (neovim unique) rc-files are located.

in `pc.d`, plugin-related configuration files are put, based on their groups defined on `dein.toml`.
