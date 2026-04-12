vim.pack.add({
    {
        src = 'https://github.com/obsidian-nvim/obsidian.nvim',
        name = 'obsidian.nvim',
        load = false, -- lazy: loaded on markdown FileType
    },
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown' },
    once = true,
    callback = function()
        vim.cmd.packadd('obsidian.nvim')

        ---@module 'obsidian'
        ---@type obsidian.config
        require('obsidian').setup({
            workspaces = {
                {
                    name = "hxx",
                    path = "~/obsidian/hxx",
                },
            },
            legacy_commands = false,
        })
    end,
})
