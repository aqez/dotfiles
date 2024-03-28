local wezterm = require("wezterm")

local config = wezterm.config_builder()

local light = "Github"
local dark = "GitHub Dark"

local function toggle_light_dark(window, _)
	local currentSchemeName = window:effective_config().color_scheme
	local allSchemes = wezterm.color.get_builtin_schemes()
	local currentMode = wezterm.gui.get_appearance()

    local overrides = window:get_config_overrides() or {}

    if overrides.color_scheme == dark then
        overrides.color_scheme = light
    else
        overrides.color_scheme = dark
    end

    wezterm.log_info("Switched from " .. currentSchemeName .. " to " .. overrides.color_scheme)
    window:set_config_overrides(overrides)
end

config.color_scheme = dark
-- config.font = wezterm.font("0xProto Nerd Font Mono")
config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font("Source Code Pro")
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
    },

    -- Theme Cycler
    { key = "t", mods = "ALT", action = wezterm.action_callback(toggle_light_dark) },

    -- Look up Scheme you switched to
    { key = "Escape", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
}

return config
