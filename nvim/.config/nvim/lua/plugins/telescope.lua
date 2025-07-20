return {
    'nvim-telescope/telescope.nvim',
    --    tag = '0.1.8', -- Use a stable version
    dependencies = {
        'nvim-lua/plenary.nvim',
        'desdic/telescope-rooter.nvim',
    },
    config = function()
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = { -- insert mode
                        ['<Down>'] = actions.move_selection_next,
                        ['<Up>'] = actions.move_selection_previous,
                        ['<CR>'] = actions.select_default,
                        ['<C-s>'] = actions.select_horizontal,
                        ['<C-v>'] = actions.select_vertical,
                    },
                },
            },
            extensions = {
                rooter = {
                    enable = true,
                    patterns = { '.git' },
                },
            },
        })

        require('telescope').load_extension 'rooter'
        -- Key mappings
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
        vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        vim.keymap.set('n', '<leader>s/', function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            }
        end, { desc = '[S]earch [/] in Open Files' })

        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
    end
}
