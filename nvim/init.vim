" ----- Plug the plugins

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source .
endif

" ----- Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'rose-pine/neovim', {'as': 'rose-pine.nvim' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Manage LSP servers from neovim
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" LSP Support
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

call plug#end()

lua << EOF
    require("my")
EOF
