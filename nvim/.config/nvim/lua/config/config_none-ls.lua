local null_ls = require 'null-ls'
local h = require 'null-ls.helpers'
local methods = require 'null-ls.methods'

local DIAGNOSTICS = methods.internal.DIAGNOSTICS

-- Define Verilator diagnostics source
local verilator = h.make_builtin {
    name = 'verilator',
    meta = {
        url = 'https://www.veripool.org/verilator/',
        description = 'Verilog/SystemVerilog linter using Verilator.',
    },
    method = DIAGNOSTICS,
    filetypes = { 'verilog', 'systemverilog' },
    generator_opts = {
        command = 'verilator',
        args = {
            '--lint-only',
            '-sv',
            '-Wall',
            '$FILENAME',
        },
        from_stderr = true,
        format = 'line',
        check_exit_code = function(code)
            return code <= 1 -- Verilator returns 1 for warnings
        end,
        on_output = function(line, params)
            local abs_path = vim.fn.fnamemodify(params.bufname, ':p')
            local pattern = [[%%(%w+).*]] .. vim.pesc(abs_path) .. [[:(%d+):(%d+): (.*)]]
            local overrides = {
                severities = {
                    ['Error'] = 1, -- ERROR
                    ['Warning'] = 2, -- WARN
                },
            }
            return h.diagnostics.from_pattern(pattern, { 'severity', 'row', 'col', 'message' }, overrides)(line, params)
        end,
    },
    factory = h.generator_factory,
}

vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = { '*.v', '*.sv' },
    callback = function()
        null_ls.disable { method = null_ls.methods.DIAGNOSTICS } -- optional reset
        null_ls.enable { method = null_ls.methods.DIAGNOSTICS } -- force re-run
    end,
})
--vim.api.nvim_create_autocmd('BufWritePost', {
--    pattern = { '*.v', '*.vh', '*.sv', '*.svh' },
--    callback = function(args)
--        vim.lsp.buf.clear_references()
--        vim.lsp.buf.lsp_references() -- force diagnostic refresh
--    end,
--})

-- Setup none-ls with Verilator source
null_ls.setup {
    sources = {
        verilator,
    },
}
