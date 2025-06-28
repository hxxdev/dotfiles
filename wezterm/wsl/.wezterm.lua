local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- WSL
config.default_prog = { "wsl.exe" }
config.wsl_domains = {  {
    name = "WSL:Ubuntu-24.04",
    distribution = "Ubuntu-24.04",
    default_cwd = '~'
  },
}
config.default_domain = 'WSL:Ubuntu-24.04'
-- Tabs
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = true
config.use_fancy_tab_bar = false
-- Background
-- config.window_background_opacity = 0.15
-- config.window_background_image = '\\\\wsl.localhost\\Ubuntu-24.04\\home\\hxxdev\\dev\\tools\\wallpapers\\Nord-niivu-UNSPLASH-IGN_11.jpg'
-- Themes
config.font = wezterm.font("Hack Nerd Font", { weight = "Regular", italic = false })
local appearance = wezterm.gui.get_appearance()
local is_dark = appearance:find "Dark"
config.color_scheme = is_dark and "Catppuccin Mocha" or "Catppuccin Latte"
config.set_environment_variables = {
    WSLENV = is_dark and "dark" or "light",
}
config.font_size = 16

config.window_padding = { bottom = 0, }
-- Key Bindings
config.leader = { key="b", mods="CTRL" }
config.keys = {
    { key = "a", mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
    { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "\\",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = '%', mods = "LEADER|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = '"', mods = "LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "o", mods = "LEADER",       action="TogglePaneZoomState" },
    { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
    { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
    { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
    { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
    { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
    { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
    { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
    { key = 'h', mods = 'ALT',          action=wezterm.action.ActivatePaneDirection 'Left'},
    { key = 'l', mods = 'ALT',          action=wezterm.action.ActivatePaneDirection 'Right'},
    { key = 'k', mods = 'ALT',          action=wezterm.action.ActivatePaneDirection 'Up'},
    { key = 'j', mods = 'ALT',          action=wezterm.action.ActivatePaneDirection 'Down'},
    { key = "1", mods = "ALT",          action=wezterm.action{ActivateTab=0}},
    { key = "2", mods = "ALT",          action=wezterm.action{ActivateTab=1}},
    { key = "3", mods = "ALT",          action=wezterm.action{ActivateTab=2}},
    { key = "4", mods = "ALT",          action=wezterm.action{ActivateTab=3}},
    { key = "5", mods = "ALT",          action=wezterm.action{ActivateTab=4}},
    { key = "6", mods = "ALT",          action=wezterm.action{ActivateTab=5}},
    { key = "7", mods = "ALT",          action=wezterm.action{ActivateTab=6}},
    { key = "8", mods = "ALT",          action=wezterm.action{ActivateTab=7}},
    { key = "9", mods = "ALT",          action=wezterm.action{ActivateTab=8}},
    { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
    { key = "d", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
    { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}}
}

return config
