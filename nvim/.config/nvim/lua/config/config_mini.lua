--require('mini.ai').setup()

require('mini.files').setup()

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

-- require('mini.pick').setup()

-- mini.statusline
-- local statusline = require 'mini.statusline'
-- statusline.setup { use_icons = vim.g.have_nerd_font }
-- statusline.section_location = function()
--     return '%2l:%-2v'
-- end
