-- Function to find all 'tags' files up the directory tree
return {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    config = function()
        vim.keymap.set('n', '<M-h>', '<cmd>TmuxNavigateLeft<CR>', { desc = '[T]mux [L]eft' })
        vim.keymap.set('n', '<M-j>', '<cmd>TmuxNavigateDown<CR>', { desc = '[T]mux [D]own' })
        vim.keymap.set('n', '<M-k>', '<cmd>TmuxNavigateUp<CR>', { desc = '[T]mux [U]p' })
        vim.keymap.set('n', '<M-l>', '<cmd>TmuxNavigateRight<CR>', { desc = '[T]mux [R]ight' })
        vim.keymap.set('n', '<M-\\>', '<cmd>TmuxNavigatePrevious<CR>', { desc = '[T]mux [P]revious' })
    end
}
