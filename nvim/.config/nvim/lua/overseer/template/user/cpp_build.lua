return {
    name = "clang++ build and run",
    builder = function()
        -- Full path to current file (see :help expand())
        local file = vim.fn.expand("%:p")
        local output_file = vim.fn.expand("%:p:r")
        return {
            cmd = { "bash", "-c", string.format("clang++ %s -o %s && %s", file, output_file, output_file) },
            components = { { "on_output_quickfix", open = true }, "default" },
        }
    end,
    condition = {
        filetype = { "cpp" },
    },
}
