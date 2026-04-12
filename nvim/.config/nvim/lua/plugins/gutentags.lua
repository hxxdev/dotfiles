vim.pack.add({
    {
        src = 'https://github.com/ludovicchabant/vim-gutentags',
        name = 'vim-gutentags',
        load = false, -- lazy: loaded on FileType
    },
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'verilog', 'systemverilog', 'c', 'cpp', 'python' },
    once = true,
    callback = function()
        vim.cmd.packadd('vim-gutentags')

        vim.g.gutentags_enabled = 1
        vim.g.gutentags_modules = { "ctags" }

        vim.g.gutentags_file_list_command = {
            default = [[ find . -type f \( \
                        -name "*.c" -o \
                        -name "*.cpp" -o \
                        -name "*.h" -o \
                        -name "*.py" -o \
                        -name "*.v" -o \
                        -name "*.sv" -o \
                        -name "*.svh" \
                    \)
            ]],
        }

        vim.g.gutentags_ctags_extra_args = {
            "--tag-relative=no",
            "--fields=+l",
        }
    end,
})
