local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.audible_bell = 'Disabled'

config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false })
config.font_size = 15
config.line_height = 1.0

config.color_scheme = 'JetBrains Darcula'

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.default_prog = { '/usr/bin/fish', '-l' }

config.disable_default_key_bindings = true
config.keys = {
    {
        key = "N",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ToggleFullScreen,
    },
    {
        key = "Q",
        mods = "CTRL|SHIFT",
        action = wezterm.action.CloseCurrentTab { confirm = true },
    },
    {
        key = "B",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivateCopyMode,
    },
    {
        key = "C",
        mods = "CTRL|SHIFT",
        action = wezterm.action.CopyTo "Clipboard",
    },
    {
        key = "V",
        mods = "CTRL|SHIFT",
        action = wezterm.action.PasteFrom "Clipboard",
    },
    {
        key = "Y",
        mods = "CTRL|SHIFT",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
    },
    {
        key = "X",
        mods = "CTRL|SHIFT",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
    },
    {
        key = "LeftArrow",
        mods = "CTRL|SHIFT",
        action = wezterm.action.AdjustPaneSize { "Left", 3 },
    },
    {
        key = "RightArrow",
        mods = "CTRL|SHIFT",
        action = wezterm.action.AdjustPaneSize { "Right", 3 },
    },
    {
        key = "UpArrow",
        mods = "CTRL|SHIFT",
        action = wezterm.action.AdjustPaneSize { "Up", 3 },
    },
    {
        key = "DownArrow",
        mods = "CTRL|SHIFT",
        action = wezterm.action.AdjustPaneSize { "Down", 3 },
    },
    {
        key = "H",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivatePaneDirection "Left",
    },
    {
        key = "L",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivatePaneDirection "Right",
    },
    {
        key = "K",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivatePaneDirection "Up",
    },
    {
        key = "J",
        mods = "CTRL|SHIFT",
        action = wezterm.action.ActivatePaneDirection "Down",
    },
    {
        key = "t",
        mods = "CTRL|SHIFT",
        action = wezterm.action.SpawnWindow,
    },
    {
        key = "+",
        mods = "CTRL|SHIFT",
        action = wezterm.action.IncreaseFontSize,
    },
    {
        key = "_",
        mods = "CTRL|SHIFT",
        action = wezterm.action.DecreaseFontSize,
    },
}

return config
