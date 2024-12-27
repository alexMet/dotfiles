" --- Plug the plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source .
endif

" --- Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.local/share/nvim/site/plugged')

" --- UI / UX
Plug 'rose-pine/neovim', {'as': 'rose-pine.nvim' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/which-key.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" --- Tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'

" --- Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" --- Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'lukas-reineke/indent-blankline.nvim'

" --- LSP Support and managing servers
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'j-hui/fidget.nvim'

" --- Autocompletion
Plug 'folke/lazydev.nvim', { 'for': 'lua' }
Plug 'rafamadriz/friendly-snippets'
Plug 'saghen/blink.cmp', { 'tag': 'v0.*' }

" --- Miscellaneous
Plug 'folke/twilight.nvim' 
Plug 'eandrju/cellular-automaton.nvim'

call plug#end()

lua require('my.remaps')
lua require('my.options')
