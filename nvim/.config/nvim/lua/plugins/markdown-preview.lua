return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    config = function()
        vim.keymap.set('n', '<C-m>', ':MarkdownPreview<CR>', { noremap = true, silent = true })
        vim.g.mkdp_browser = 'zen-browser'
    end,
    build = function() vim.fn["mkdp#util#install"]() end,
}
