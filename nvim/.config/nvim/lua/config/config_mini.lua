--require('mini.ai').setup()

require('mini.files').setup()
vim.keymap.set('n', '<C-e>', function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
    MiniFiles.open(path)
    MiniFiles.reveal_cwd()
end, { desc = 'Open Mini Files' })
-- visual mode sa ": wrap with "
-- normal mode sd ': remove surrounding ''
-- normal mode sr '(: replace surrounding '' with ()
require('mini.surround').setup()

require('mini.align').setup()

require('mini.indentscope').setup()

-- normal mode gcc: comment line
-- visual mode gc: comment
require('mini.comment').setup()

-- :lua MiniTrailspace.trim(): trim all trailing whitespaces.
-- :lua MiniTrailspace.trim_last_lines(): trim all trailing empty lines.
require('mini.trailspace').setup()

require('mini.jump').setup {
    delay = {
        -- Delay(ms) between jump and highlighting all possible jumps
        highlight = 10000000,

        -- Delay(ms) between jump and automatic stop if idle (no jump is done)
        idle_stop = 10000000,
    },
}

-- normal mode gS: split join toggle
require('mini.splitjoin').setup()

require('mini.pairs').setup()

require('mini.starter').setup()

--require('mini.pick').setup()
--local builtin = MiniPick.builtin
--vim.keymap.set('n', '<leader>sh', builtin.help, { desc = '[S]earch [H]elp' })
--vim.keymap.set('n', '<leader>sf', builtin.files, { desc = '[S]earch [F]iles' })
--vim.keymap.set('n', '<leader>sg', builtin.grep_live, { desc = '[S]earch by [G]rep' })
--vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
--vim.keymap.set('n', '<leader><leader>', function()
--    builtin.files { tool = 'git' }()
--end, { desc = '[S]earch by [G]it' })

-- mini.statusline
-- local statusline = require 'mini.statusline'
-- statusline.setup { use_icons = vim.g.have_nerd_font }
-- statusline.section_location = function()
--     return '%2l:%-2v'
-- end
