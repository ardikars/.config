local wezterm = require 'wezterm'

local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    local _, _, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

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

-- config.default_prog = { 'tmux' }

config.disable_default_key_bindings = true

wezterm.on('toggle-fullscreen-maximized', function(window, pane)
    local is_full = window:get_dimensions().is_full_screen

    window:toggle_fullscreen()

    if is_full then
        -- just exited fullscreen → maximize
        wezterm.sleep_ms(50)
        window:maximize()
    end
end)

config.keys = {
    {
        key = "Enter",
        mods = "CTRL|SHIFT",
        action = wezterm.action.EmitEvent("toggle-fullscreen-maximized"),
    },
    {
        key = "X",
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
        key = "+",
        mods = "CTRL|SHIFT",
        action = wezterm.action.IncreaseFontSize,
    },
    {
        key = "-",
        mods = "CTRL",
        action = wezterm.action.DecreaseFontSize,
    },
}

return config
