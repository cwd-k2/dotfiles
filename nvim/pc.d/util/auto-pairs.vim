augroup haskellautopair
  autocmd!
  au FileType haskell let b:AutoPairs =
        \ AutoPairsDefine(
        \   { '{-' : '-}', '{-#' : '#-}' },
        \   ["'"]
        \ )
augroup END
