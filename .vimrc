" Enter the current millenium

set nocompatible

" Colors

syntax enable               " Enable syntax processing
let g:sierra_Midnight=1     " Midnight blues
colorscheme sierra          " Add an oldschool beautiful

" Spaces & Tabs

set tabstop=2       " Number of visual spaces per TAB
set shiftwidth=2
set softtabstop=2   " Number of spaces in tab when editing
set expandtab       " Tabs are spaces

" UI Config

set number      " Show line numbers
set showcmd     " Show command in bottom bar
set cursorline  " Highlight current line
set lazyredraw  " Redraw only when we need to
set showmatch   " Highlight matching [{()}]
set wildmenu    " Display all matching files when we tab complete
set splitbelow  " Split horizontally to the bottom
set splitright  " Split vertically to the right

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.o,*~,*.pyc
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=*/__pycache__/*,*/virtualenv/*,*/venv/*

" Searching

set ignorecase  " Ignore case when searching
set smartcase   " Use case if any caps used
set incsearch   " Search as characters are entered
set hlsearch    " Highlight matches

set path+=**    " Search down into subfolders

nnoremap ,<space> :nohlsearch<CR>

" File types

filetype on
filetype plugin on
filetype indent on  " File type based indentation

" File tree browser

let g:netrw_banner=0                  " Hide the banner
let g:netrw_liststyle=3               " Use the tree style listing
" let g:netrw_list_hide=&wildignore     " Inherit the wildignores

