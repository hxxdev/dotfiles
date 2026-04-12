vim.pack.add({
    { src = 'https://github.com/stevearc/overseer.nvim', name = 'overseer.nvim', load = true },
})

require("overseer").setup({
    templates = { "builtin", "user.cpp_build", "user.run_script" },
})
