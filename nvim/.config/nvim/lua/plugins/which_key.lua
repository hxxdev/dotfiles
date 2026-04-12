vim.pack.add({
    {
        src = 'https://github.com/folke/which-key.nvim',
        name = 'which-key.nvim',
        load = false, -- lazy: loaded after VimEnter (VeryLazy equivalent)
    },
})

-- VeryLazy equivalent: load after all startup is done
vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = vim.schedule_wrap(function()
        vim.cmd.packadd('which-key.nvim')

        require('which-key').setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        })

        vim.keymap.set('n', '<leader>?', function()
            require("which-key").show({ global = false })
        end, { desc = "Buffer Local Keymaps (which-key)" })
    end),
})
