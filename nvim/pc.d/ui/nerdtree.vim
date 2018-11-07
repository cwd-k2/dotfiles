let g:NERDTreeWinSize = 40
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeIgnore = ['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']

let g:NERDTreeBookmarksFile = g:nvim_dir . '/.NERDTreeBookmarks'

let g:NERDTreeHijackNetrw = 0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
