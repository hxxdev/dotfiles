-- Function to find all 'tags' files up the directory tree
return {
    'ludovicchabant/vim-gutentags',
    lazy = true,
    ft = { 'verilog', 'systemverilog', 'c', 'cpp', 'python' },
    config = function()
        -- Gutentags configuration in Lua
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
    end
}
