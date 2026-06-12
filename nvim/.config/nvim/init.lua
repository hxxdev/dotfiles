-- Clear the LSP log file on every Neovim launch
local lsp_log_path = vim.lsp.log.get_filename()
local f = io.open(lsp_log_path, "w")
if f then
  f:close()
end
require("plugins")

require("themes")
require("env")
require("maps")
require("files")

-- require('init')
