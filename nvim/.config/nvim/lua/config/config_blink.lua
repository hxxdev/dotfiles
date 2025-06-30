-- Optional build step for LuaSnip regex support (only if not Windows and `make` available)
if vim.fn.has 'win32' == 0 and vim.fn.executable 'make' == 1 then
    local luasnip_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/LuaSnip'
    local cmd = 'cd ' .. luasnip_path .. ' && make install_jsregexp'
    vim.fn.system(cmd)
end

-- Load friendly snippets if you want (uncomment if installed)
-- require('luasnip.loaders.from_vscode').lazy_load()

require('blink.cmp').setup {
    keymap = {
        preset = 'default',
    },

    appearance = {
        nerd_font_variant = 'mono',
    },

    completion = {
        documentation = {
            auto_show = false,
            auto_show_delay_ms = 500,
        },
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
            lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
    },

    snippets = { preset = 'luasnip' },

    fuzzy = {
        implementation = 'lua', -- Use Lua matcher by default
    },

    signature = {
        enabled = true,
    },
}
