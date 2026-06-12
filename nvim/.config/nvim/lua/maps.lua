-- vim.keymap.set('n', '<C-m>', '<Plug>MarkdownPreview')
-- vim.keymap.set('n', '<C-e>', ':NvimTreeOpen<CR>')

-- vim.cmd('cnoreabbrev open NvimTreeOpen')

-- Clipboard yank and delete mappings
-- ----------------------------

-- NORMAL MODE
-- vim.keymap.set('n', 'y', '"+y')
-- vim.keymap.set('n', 'yy', '"+yy')
-- vim.keymap.set('n', 'd', '"+d')
-- vim.keymap.set('n', 'dd', '"+dd')
-- vim.keymap.set('n', 'c', '"+c')
-- vim.keymap.set('n', 'cc', '"+cc')
-- vim.keymap.set('n', 'C', '"+C')

-- Use system clipboard for copy/pasting.
-- vim.keymap.set('v', 'y', '"+y')
-- vim.keymap.set('v', 'd', '"+d')
-- vim.keymap.set('v', 'c', '"+c')
-- vim.keymap.set('n', 'p', '"+p')
-- vim.keymap.set('v', 'p', '"+p')

-- OPERATOR-PENDING MODE
-- This covers things like `yaw`, `dap`, etc.
-- Remap the operators themselves
-- vim.keymap.set('n', 'y', '"+y', { silent = true })
-- vim.keymap.set('n', 'd', '"+d', { silent = true })
-- vim.keymap.set('n', 'c', '"+c', { silent = true })
vim.keymap.set("n", "<F5>", function()
    vim.cmd("OverseerRun")
end, { buffer = true, desc = "Run Overseer" })

-- Manually mapping LspLog, LspInfo because they are removed.
vim.api.nvim_create_user_command('LspLog', function()
    vim.cmd('edit ' .. vim.lsp.log.get_filename())
end, {})
vim.api.nvim_create_user_command("LspInfo", function()
    vim.cmd("checkhealth vim.lsp")
end, { desc = "Show LSP status (alias for :checkhealth vim.lsp)" })
vim.keymap.set('n', '<C-Left>', ':vertical resize -3<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<C-Up>', ':resize -3<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +3<CR>')
