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
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'hxxdev/LazyVerilog', { 'as': 'lazy_verilog' }

call plug#end()
