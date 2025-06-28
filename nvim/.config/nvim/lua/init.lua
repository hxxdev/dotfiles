-- Neovide
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
end

-- Package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
-- Package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
package.path = package.path .. ";/home/hxxdev/dev/tools/vim/nvim/lua/config/?.lua"
require("config_vim-gutentags")
require("config_notify")
require("config_noice")
require("config_treesitter")
require("config_nvim-tree")
require("config_lualine")
require("config_lspconfig")
require("config_mason")
require("config_catppuccin")
-- require("config_image")
