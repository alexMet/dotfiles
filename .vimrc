" Enter the current millenium
set nocompatible

" Colors

syntax enable               " Enable syntax processing
let g:sierra_Midnight=1     " Midnight blues
colorscheme sierra          " Add an oldschool beautiful

" Spaces & Tabs

set tabstop=4       " Number of visual spaces per TAB
set softtabstop=4   " Number of spaces in tab when editing
set expandtab       " Tabs are spaces

" UI Config

set number      " Show line numbers
set showcmd     " Show command in bottom bar
set cursorline  " Highlight current line
set lazyredraw  " Redraw only when we need to
set showmatch   " Highlight matching [{()}]
set wildmenu    " Display all matching files when we tab complete

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.o,*~,*.pyc
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=*/__pycache/,*/virtualenv/*,*/venv/*

" Searching

set ignorecase  " Ignore case when searching
set smartcase   " Use case if any caps used
set incsearch   " Search as characters are entered
set hlsearch    " Highlight matches

set path+=**    " Search down into subfolders

nnoremap ,<space> :nohlsearch<CR>

" TODO test the following commands
" Plugins for netrw
" filetype plugin on

" opens file under cursor in a new vertical split
" nnoremap gf :vertical wincmd f<CR>

" File browser

" let g:netrw_banner=0                  " Hide the banner
" let g:netrw_liststyle=3               " Use the tree style listing
" let g:netrw_browse_split=4            " Open the file in the previous window to the right
" let g:netrw_altv=1          
" let g:netrw_winsize=25                " Set the width of the window to 25%
" let g:netrw_list_hide=&wildignore     " Inherit the wildignores

" augroup ProjectDrawer                 " Launch file browsing when entering vim
"  autocmd!
"  autocmd VimEnter * :Vexplore
" augroup END
