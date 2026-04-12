vim.pack.add({
    { src = 'https://github.com/nvim-neotest/nvim-nio',   name = 'nvim-nio',    load = true },
    { src = 'https://github.com/mfussenegger/nvim-dap',   name = 'nvim-dap',    load = true },
    { src = 'https://github.com/rcarriga/nvim-dap-ui',    name = 'nvim-dap-ui', load = true },
})

local dap, dapui = require("dap"), require("dapui")
require("dapui").setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<Leader>dc', dap.continue, {})

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pid = function()
            local name = vim.fn.input('Executable name (filter): ')
            return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = '${workspaceFolder}'
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'gdb',
        request = 'attach',
        target = 'localhost:1234',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}'
    },
}

dap.configurations.cpp = dap.configurations.c

dap.configurations.rust = dap.configurations.c

dap.adapters["local-lua"] = {
    type = "executable",
    command = "node",
    args = {
        "/home/hxxdev/dev/local-lua-debugger-vscode/extension/debugAdapter.js"
    },
    enrich_config = function(config, on_config)
        if not config["extensionPath"] then
            local c = vim.deepcopy(config)
            -- 💀 If this is missing or wrong you'll see
            -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
            c.extensionPath = "/home/hxxdev/dev/local-lua-debugger-vscode/"
            on_config(c)
        else
            on_config(config)
        end
    end,
}

dap.configurations.lua = {
    {
        name = 'Current file (local-lua-dbg, lua)',
        type = 'local-lua',
        request = 'launch',
        cwd = '${workspaceFolder}',
        program = {
            lua = 'lua5.1',
            file = '${file}',
        },
        args = {},
    },
}
