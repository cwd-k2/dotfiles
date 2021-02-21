let s:bcs = b:current_syntax

unlet b:current_syntax
syntax include @VIM syntax/vim.vim

let b:current_syntax = s:bcs

syntax region TomlEmbeddedVim
      \ start="^hook_\%(add\|source\)\s*=\s*'''\s*$"hs=e+1,rs=e+1
      \ end="^\s*'''\s*$"he=s-1,re=s-1
      \ contains=@VIM
      \ keepend

if has('b:current_syntax')
  unlet b:current_syntax
endif
