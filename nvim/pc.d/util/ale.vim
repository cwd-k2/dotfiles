let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_linters = { 'c': ['gcc'], 'cpp': ['g++'] }
let g:ale_c_gcc_options   = '-std=c99'
let g:ale_cpp_gcc_options = '-std=c++17'
