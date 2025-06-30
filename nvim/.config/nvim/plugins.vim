call plug#begin()

" List your plugins here
"Plug '~/dev/tools/vim/nvim/plugins/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },
"   \                                             'for': ['markdown', 'vim-plug'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug '3rd/image.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nvim-lualine/lualine.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'folke/which-key.nvim'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-ui-select.nvim'

" lsp
Plug 'folke/lazydev.nvim'
Plug 'neovim/nvim-lspconfig'
" Main LSP setup
Plug 'neovim/nvim-lspconfig'
" Mason + related tools
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
" Optional LSP status UI
Plug 'j-hui/fidget.nvim'
" LSP capabilities extension (used by blink.cmp)
Plug 'saghen/blink.cmp'

Plug 'stevearc/conform.nvim'


" Autocompletion
Plug 'saghen/blink.cmp'
Plug 'L3MON4D3/LuaSnip'
" mini-plugins(ai, align, comment, completion, keymap, move...)
Plug 'echasnovski/mini.nvim'
" hxxdev
Plug 'hxxdev/LazyVerilog', { 'as': 'lazy_verilog' }

call plug#end()
