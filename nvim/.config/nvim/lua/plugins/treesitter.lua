vim.pack.add({
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        name = 'nvim-treesitter',
        version = 'master',
        load = true,
    },
})

-- Run TSUpdate after install or update
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        if ev.data.spec.name == 'nvim-treesitter' and
            (ev.data.kind == 'install' or ev.data.kind == 'update') then
            vim.cmd('TSUpdate')
        end
    end,
})

require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "verilog" },
    highlight = { enable = true },
    indent = { enable = true },
}
