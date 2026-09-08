" --- Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.local/share/nvim/site/plugged')

" --- UI / UX
Plug 'rose-pine/neovim', {'as': 'rose-pine.nvim' }
Plug 'folke/which-key.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'

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
Plug 'saghen/blink.cmp', { 'tag': 'v1.*' }

call plug#end()

lua require('my.remaps')
lua require('my.options')
