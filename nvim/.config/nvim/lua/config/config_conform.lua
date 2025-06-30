-- Setup conform.nvim
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local disable_filetypes = { c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    -- python = { "isort", "black" },
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
  },
}

-- Optional: keymap for manual formatting with async and fallback
vim.keymap.set('', '<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = '[F]ormat buffer' })

-- Optional: Autocommand to format on BufWritePre (like Lazy.nvim event)
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    require('conform').format { async = true, lsp_format = 'fallback' }
  end,
})
