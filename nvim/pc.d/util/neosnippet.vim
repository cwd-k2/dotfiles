imap <S-tab> <Plug>(neosnippet_expand_or_jump)
smap <S-tab> <Plug>(neosnippet_expand_or_jump)
xmap <S-tab> <Plug>(neosnippet_expand_target)

let g:neosnippet#data_directory = g:nvim_cache . '/neosnippet'

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
