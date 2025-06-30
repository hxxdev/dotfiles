-- Tmux Navigator Keybindings (Alt + hjkl)
vim.keymap.set('n', '<M-h>', '<cmd>TmuxNavigateLeft<CR>', { desc = 'Tmux Left' })
vim.keymap.set('n', '<M-j>', '<cmd>TmuxNavigateDown<CR>', { desc = 'Tmux Down' })
vim.keymap.set('n', '<M-k>', '<cmd>TmuxNavigateUp<CR>', { desc = 'Tmux Up' })
vim.keymap.set('n', '<M-l>', '<cmd>TmuxNavigateRight<CR>', { desc = 'Tmux Right' })
vim.keymap.set('n', '<M-\\>', '<cmd>TmuxNavigatePrevious<CR>', { desc = 'Tmux Previous' })

