require('mini.ai').setup {
    n_lines = 500, -- max 500 lines
}

-- mini.surround
require('mini.surround').setup()

-- mini.align
require('mini.align').setup()

-- mini.statusline
local statusline = require 'mini.statusline'

statusline.setup {
    use_icons = vim.g.have_nerd_font,
}

statusline.section_location = function()
    return '%2l:%-2v'
end
