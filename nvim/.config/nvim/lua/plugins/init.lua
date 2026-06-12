-- Load order matters:
--   nvim_navic  → before lsp (on_attach) and lualine
--   blink_cmp   → before lsp (capabilities)
--   noice       → before lualine (statusline component)
--   telescope   → before lsp (LspAttach keymaps)

require('plugins.nvim_navic')
require('plugins.blink_cmp')
require('plugins.noice')

-- Colorschemes (eager, high priority)
require('plugins.catppuccin')
require('plugins.kanso')
require('plugins.github_nvim_theme')
require('plugins.rose_pine')

require('plugins.fidget')
require('plugins.telescope')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.mini')
-- require('plugins.treesitter')
require('plugins.debugger')
require('plugins.overseer')
require('plugins.vim_tmux_navigator')

require('plugins.lazyverilog')

-- Lazy-loaded (ft-based)
require('plugins.gutentags')
require('plugins.markdown_preview')
require('plugins.obsidian')

-- Lazy-loaded (VeryLazy equivalent)
require('plugins.which_key')
