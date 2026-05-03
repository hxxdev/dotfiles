vim.opt.rtp:prepend("/home/hxxdev/dev/LazyVerilogPy")
require("lazyverilogpy").setup({
    cmd = { "/home/hxxdev/dev/LazyVerilogPy/.venv/bin/python", "-m", "lazyverilogpy.server" },
    cmd_env = {
        PYTHONPATH = "/home/hxxdev/dev/LazyVerilogPy/src"
    },
})
