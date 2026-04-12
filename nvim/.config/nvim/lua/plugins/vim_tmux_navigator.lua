vim.pack.add({
    {
        src = 'https://github.com/christoomey/vim-tmux-navigator',
        name = 'vim-tmux-navigator',
        load = true,
    },
})

vim.keymap.set('n', '<M-h>', '<cmd>TmuxNavigateLeft<CR>',     { desc = '[T]mux [L]eft' })
vim.keymap.set('n', '<M-j>', '<cmd>TmuxNavigateDown<CR>',     { desc = '[T]mux [D]own' })
vim.keymap.set('n', '<M-k>', '<cmd>TmuxNavigateUp<CR>',       { desc = '[T]mux [U]p' })
vim.keymap.set('n', '<M-l>', '<cmd>TmuxNavigateRight<CR>',    { desc = '[T]mux [R]ight' })
vim.keymap.set('n', '<M-\\>', '<cmd>TmuxNavigatePrevious<CR>', { desc = '[T]mux [P]revious' })
