augroup SwiftFormat
  autocmd!
  autocmd BufWritePost *.swift if executable("swift-format") | call system("swift-format -i " . bufname()) | edit
augroup END
