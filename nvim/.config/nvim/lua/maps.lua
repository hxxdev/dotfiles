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
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.keymap.set("n", "<F5>", function()
            vim.cmd("w") -- Save file
            vim.cmd("botright 10split term://clang++ -std=c++20 % -o %:r && ./%:r")
        end, { buffer = true, noremap = true, desc = "Compile and Run C/C++ in terminal" })
    end,
})
