let s:bcs = b:current_syntax

unlet b:current_syntax
syntax include @VIM syntax/vim.vim

let b:current_syntax = s:bcs

syntax region TomlEmbeddedVim
      \ start="^hook_\%(add\|source\)\s*=\s*'''\s*$"
      \ end="^\s*'''\s*$"
      \ contains=@VIM
      \ keepend

if has('b:current_syntax')
  unlet b:current_syntax
endif
