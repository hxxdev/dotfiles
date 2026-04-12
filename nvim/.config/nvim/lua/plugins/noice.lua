vim.pack.add({
    { src = 'https://github.com/MunifTanjim/nui.nvim',    name = 'nui.nvim',    load = true },
    { src = 'https://github.com/rcarriga/nvim-notify',    name = 'nvim-notify', load = true },
    { src = 'https://github.com/folke/noice.nvim',        name = 'noice.nvim',  load = true },
})

require("notify").setup({})
