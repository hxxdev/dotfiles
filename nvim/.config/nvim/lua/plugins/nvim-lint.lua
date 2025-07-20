-- return {
--     'nvimtools/none-ls.nvim',
--     dependencies = {
--         "nvimtools/none-ls-extras.nvim",
--     },
--     config = function()
--         local null_ls = require("null-ls")
--         local h = require 'null-ls.helpers'
--         local methods = require 'null-ls.methods'
--         local DIAGNOSTICS = methods.internal.DIAGNOSTICS
--         -- Define Verilator diagnostics source
--         local verilator = h.make_builtin {
--             name = 'verilator',
--             meta = {
--                 url = 'https://www.veripool.org/verilator/',
--                 description = 'Verilog/SystemVerilog linter using Verilator.',
--             },
--             method = DIAGNOSTICS,
--             filetypes = { 'verilog', 'systemverilog' },
--             generator_opts = {
--                 command = 'verilator',
--                 args = {
--                     '--lint-only',
--                     '-sv',
--                     '-Wall',
--                     '$FILENAME',
--                 },
--                 from_stderr = true,
--                 format = 'line',
--                 check_exit_code = function(code)
--                     return code <= 1 -- Verilator returns 1 for warnings
--                 end,
--                 on_output = function(line, params)
--                     local abs_path = vim.fn.fnamemodify(params.bufname, ':p')
--                     local pattern = [[%%(%w+).*]] .. vim.pesc(abs_path) .. [[:(%d+):(%d+): (.*)]]
--                     local overrides = {
--                         severities = {
--                             ['Error'] = 1,   -- ERROR
--                             ['Warning'] = 2, -- WARN
--                         },
--                     }
--                     return h.diagnostics.from_pattern(pattern, { 'severity', 'row', 'col', 'message' }, overrides)(line,
--                         params)
--                 end,
--             },
--             factory = h.generator_factory,
--         }
--
--         null_ls.setup({
--             sources = {
--                 null_ls.builtins.formatting.stylua,
--                 null_ls.builtins.completion.spell,
--                 require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
--                 verilator,
--             },
--         })
--     end
-- }
return {
    'mfussenegger/nvim-lint',
    config = function()
        local vcode_path = os.getenv("PATH_LSP_VCODE")
        require('lint').linters.verilator.args = {
            '--lint-only',
            '-sv',
            '-Wall',
            '-f',
            vcode_path,
        }

        require('lint').linters_by_ft = {
            markdown = { 'vale' },
            systemverilog = { 'verilator' },
        }
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
            callback = function()
                -- Automatically run the appropriate linters for the filetype
                require("lint").try_lint()
            end,
        })
    end

}
