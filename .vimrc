" ----- Enter the current millenium

set nocompatible
let mapleader=','

" ----- Spaces & Tabs

set tabstop=2       " Number of visual spaces per TAB
set shiftwidth=2
set softtabstop=2   " Number of spaces in tab when editing
set expandtab       " Tabs are spaces
set autoindent      " Automatically indent the next line
set smarttab

" ----- UI Config

set number      " Show line numbers
set showcmd     " Show command in bottom bar
set cursorline  " Highlight the line that the cursor is on
set lazyredraw  " Redraw only when we need to
set showmatch   " Highlight matching [{()}]
set wildmenu    " Display all matching files when we tab complete
set splitbelow  " Split horizontally to the bottom
set splitright  " Split vertically to the right
set scrolloff=2 " Keep some lines around the cursor

set wildmode=list:longest,full

" ----- Don't offer to open certain files/directories

set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.o,*~,*.pyc
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=*/__pycache__/*,*/virtualenv/*,*/venv/*

" ----- Searching

set ignorecase  " Ignore case when searching
set smartcase   " Use case if any caps used
set incsearch   " Search as characters are entered
set hlsearch    " Highlight matches

set path+=**    " Search down into subfolders

" ----- File types

filetype on
filetype plugin on  " File type based plugin
filetype indent on  " File type based indentation

" ----- File tree browser

let g:netrw_banner=0    " Hide the banner
let g:netrw_liststyle=3 " Use the tree style listing

" ----- Plug the plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ----- Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'

let g:lightline = {'colorscheme': 'one'}
set laststatus=2  " Windows always have a status line
set noshowmode    " Don't put the message on to last line

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'mhartington/oceanic-next'
Plug 'Yggdroot/indentLine'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

call plug#end()

" ----- Colors

syntax on
set termguicolors " Enable true color support
colorscheme OceanicNext

set colorcolumn=80  " Highlight the 80th column
highlight ColorColumn ctermbg=236

" ----- Mappings

nnoremap <leader><space> :nohlsearch<CR>  " Remove highlight from matches

nnoremap <C-q> <ESC>:q<CR>  " Exit a little quicker 
nnoremap <C-s> <ESC>:w<CR>  " In normal mode escape and save file
inoremap <C-s> <ESC>:w<CR>  " In insert mode escape and save file

nnoremap <C-p> :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>ft :BTags<CR>
nnoremap <leader>fT :Tags<CR>

