return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    -- {
    --     'mfussenegger/nvim-lint',
    --     config = function()
    --         local vcode_path = os.getenv("PATH_LSP_VCODE")
    --         require('lint').linters.verilator.args = {
    --             '--lint-only',
    --             '-sv',
    --             '-Wall',
    --             '--timing',
    --             '-F',
    --             vcode_path,
    --         }
    --         require('lint').linters.verilator.append_fname = false
    --
    --         require('lint').linters_by_ft = {
    --             systemverilog = { 'verilator' },
    --         }
    --         vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
    --             callback = function()
    --                 -- Automatically run the appropriate linters for the filetype
    --                 require("lint").try_lint()
    --             end,
    --         })
    --     end
    -- },

    {
        'mfussenegger/nvim-lint',
        config = function()
            local vcode_path = os.getenv("PATH_LSP_VCODE")
            require('lint').linters.slang.args = {
                '-f',
                vcode_path
            }
            -- NOTE: This line is inserted because...
            -- slang -f vcode.f is CORRECT.
            -- slang -f vcode.f ./alu.sv is INCORRECT.
            require('lint').linters.slang.append_fname = false

            require('lint').linters_by_ft = {
                systemverilog = { 'slang' },
            }
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
                callback = function()
                    -- Automatically run the appropriate linters for the filetype
                    require("lint").try_lint()
                end,
            })
        end

    },
    --{
    --    'nvimtools/none-ls.nvim',
    --    dependencies = { 'nvim-lua/plenary.nvim' },
    --    config = function()
    --        local null_ls = require("null-ls")
    --        null_ls.setup({
    --            sources = {
    --                null_ls.builtins.formatting.verible_verilog_format.with({
    --                    command = { "verible-verilog-format",
    --                        "--indentation_spaces=4" }, -- optional override if needed
    --                    filetypes = { "verilog", "systemverilog" },
    --                }),
    --            },
    --        })
    --    end,
    --},
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        ---@class PluginLspOpts
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local vcode_path = os.getenv("PATH_LSP_VCODE")


            local servers = {
                clangd = {},
                pyright = {},
                rust_analyzer = {},
                lua_ls = {
                    -- cmd = { ... },
                    -- filetypes = { ... },
                    -- capabilities = {},
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = 'Replace',
                            },
                            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                            -- diagnostics = { disable = { 'missing-fields' } },
                        },
                    },
                },
                bashls = {
                    cmd = { 'bash-language-server', 'start' },
                    settings = {
                        bashIde = {
                            -- Glob pattern for finding and parsing shell script files in the workspace.
                            -- Used by the background analysis features across files.

                            -- Prevent recursive scanning which will cause issues when opening a file
                            -- directly in the home directory (e.g. ~/foo.sh).
                            --
                            -- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
                            globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
                        },
                    },
                    filetypes = { 'bash', 'sh' },
                    root_markers = { '.git' },
                },
                -- svls = {
                --     cmd = { "svls" },
                --     root_markers = { ".svls.toml", ".git" },
                -- },
                -- verible = {
                --     cmd = { 'verible-verilog-ls', '--lsp_enable_hover', '--file_list_path', vcode_path },
                --     filetypes = { 'systemverilog', 'verilog' },
                --     root_markers = { '.git' },
                -- },
                --veridian = {
                --    cmd = { 'veridian' },
                --    filetypes = { 'systemverilog', 'verilog' },
                --    root_markers = { '.git' },
                --}
            }
            for server_name, config in pairs(servers) do
                config.capabilities = capabilities
                lspconfig[server_name].setup(config)
            end

            vim.diagnostic.config {
                severity_sort = true,
                float = { border = 'rounded', source = 'if_many' },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '󰅚 ',
                        [vim.diagnostic.severity.WARN] = '󰀪 ',
                        [vim.diagnostic.severity.INFO] = '󰋽 ',
                        [vim.diagnostic.severity.HINT] = '󰌶 ',
                    },
                },
                virtual_text = {
                    source = 'if_many',
                    spacing = 4,
                    format = function(diagnostic)
                        return diagnostic.message
                    end,
                },
            }
            -- autoformatting
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = buffer,
                callback = function()
                    vim.lsp.buf.format { async = false }
                end
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    -- Rename the variable under your cursor.
                    --  Most Language Servers support renaming across files, etc.
                    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

                    -- Find references for the word under your cursor.
                    map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

                    -- Jump to the implementation of the word under your cursor.
                    --  Useful when your language has ways of declaring types without an actual implementation.
                    map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                    -- Jump to the definition of the word under your cursor.
                    --  This is where a variable was first declared, or where a function is defined, etc.
                    --  To jump back, press <C-t>.
                    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header.
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    -- Fuzzy find all the symbols in your current document.
                    --  Symbols are things like variables, functions, types, etc.
                    map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

                    -- Fuzzy find all the symbols in your current workspace.
                    --  Similar to document symbols, except searches over your entire project.
                    map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

                    -- Jump to the type of the word under your cursor.
                    --  Useful when you're not sure what type a variable is and you want to see
                    --  the definition of its *type*, not where it was *defined*.
                    map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

                    -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
                    ---@param client vim.lsp.Client
                    ---@param method vim.lsp.protocol.Method
                    ---@param bufnr? integer some lsp support methods only in specific files
                    ---@return boolean
                    local function client_supports_method(client, method, bufnr)
                        if vim.fn.has 'nvim-0.11' == 1 then
                            return client:supports_method(method, bufnr)
                        else
                            return client.supports_method(method, { bufnr = bufnr })
                        end
                    end

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    --    See `:help CursorHold` for information about when this is executed
                    --
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
                        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight',
                            { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                            end,
                        })
                    end

                    -- The following code creates a keymap to toggle inlay hints in your
                    -- code, if the language server you are using supports them
                    --
                    -- This may be unwanted, since they displace some of your code
                    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
                        map('<leader>th', function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                        end, '[T]oggle Inlay [H]ints')
                    end
                end,
            })
        end
    }
}
