local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "GitHub Dark"

config.font = wezterm.font("0xProto Nerd Font Mono")
config.font_size = 15.0
config.enable_tab_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

config.keys = {
    { 
        key = "r",
        mods = "CMD|SHIFT",
        action = wezterm.action.ReloadConfiguration
    }
}

return config
