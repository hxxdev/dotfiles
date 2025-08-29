return {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
        require('github-theme').setup({
        })

        -- vim.cmd('colorscheme github_dark_default')
        -- -- Function to get the actual background value using Vim command
        -- local function get_real_background()
        --     -- Try multiple methods to get the real value
        --     local result = vim.api.nvim_exec2('set background?', { output = true })
        --     local bg = result.output:match('background=(%w+)')
        --     return bg or 'dark'
        -- end
        --
        -- -- Function to set theme based on background
        -- local function set_github_theme()
        --     local current_bg = get_real_background()
        --
        --     if current_bg == 'dark' then
        --         vim.cmd('colorscheme github_dark_default')
        --     else
        --         vim.cmd('colorscheme github_light_default')
        --     end
        -- end
        --
        -- -- Set initial theme with a delay to ensure everything is loaded
        -- vim.schedule(function()
        --     vim.defer_fn(function()
        --         set_github_theme()
        --     end, 100)
        -- end)

        -- Also check periodically (as backup)
        -- local last_bg = get_real_background()
        -- local timer = vim.uv.new_timer()
        -- timer:start(1000, 2000, vim.schedule_wrap(function()
        --     local current_bg = get_real_background()
        --     if current_bg ~= last_bg then
        --         print("DEBUG: Background changed from " .. last_bg .. " to " .. current_bg)
        --         set_github_theme()
        --         last_bg = current_bg
        --     end
        -- end))
    end,
}
