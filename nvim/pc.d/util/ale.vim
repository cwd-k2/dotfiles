let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_linters = { 'c': ['clang'], 'cpp': ['clang++'] }
let g:ale_c_gcc_options   = '-std=gnu18'
let g:ale_cpp_gcc_options = '-std=gnu++17'
