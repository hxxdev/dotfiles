vim.pack.add({
    {
        src = 'https://github.com/iamcco/markdown-preview.nvim',
        name = 'markdown-preview.nvim',
        load = false, -- lazy: loaded on FileType or command
    },
})

-- Run mkdp install script after initial install
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        if ev.data.spec.name == 'markdown-preview.nvim' and ev.data.kind == 'install' then
            vim.fn["mkdp#util#install"]()
        end
    end,
})

-- Load on markdown filetype
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown' },
    once = true,
    callback = function()
        vim.cmd.packadd('markdown-preview.nvim')
        vim.keymap.set('n', '<C-m>', ':MarkdownPreview<CR>', { noremap = true, silent = true })
        vim.g.mkdp_browser = 'zen-browser'
    end,
})

-- Also load when the commands are invoked directly
vim.api.nvim_create_user_command('MarkdownPreview', function(opts)
    vim.cmd.packadd('markdown-preview.nvim')
    vim.cmd('MarkdownPreview ' .. opts.args)
end, { nargs = '*' })

vim.api.nvim_create_user_command('MarkdownPreviewToggle', function(opts)
    vim.cmd.packadd('markdown-preview.nvim')
    vim.cmd('MarkdownPreviewToggle ' .. opts.args)
end, { nargs = '*' })

vim.api.nvim_create_user_command('MarkdownPreviewStop', function(opts)
    vim.cmd.packadd('markdown-preview.nvim')
    vim.cmd('MarkdownPreviewStop ' .. opts.args)
end, { nargs = '*' })
