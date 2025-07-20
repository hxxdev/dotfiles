vim.cmd('filetype on')
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufReadPre", "BufNewFile" }, {
    pattern = "*.md",
    callback = function()
        vim.bo.filetype = "markdown"
    end,
})
