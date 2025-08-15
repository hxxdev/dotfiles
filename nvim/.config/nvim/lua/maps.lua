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
