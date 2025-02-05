local wezterm = require("wezterm")

local config = wezterm.config_builder()
local sessionizer = require("sessionizer")

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

config.color_scheme = 'DoomOne'
-- config.font = wezterm.font("0xProto Nerd Font Mono")
config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font("Source Code Pro")
config.font_size = 18.0
config.enable_tab_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

config.window_decorations = "NONE"

config.audible_bell = "Disabled"

config.visual_bell = {
    fade_in_function = 'EaseIn',
    fade_in_duration_ms = 15,
    fade_out_function = 'EaseOut',
    fade_out_duration_ms = 15,
}
config.colors = {
    visual_bell = '#777777',
}

config.leader = { key = '\\', mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
    {
        key = "r",
        mods = "LEADER",
        action = wezterm.action.ReloadConfiguration
    },

    -- Theme Cycler
    { key = "t",      mods = "LEADER", action = wezterm.action_callback(toggle_light_dark) },

    -- Look up Scheme you switched to
    { key = "Escape", mods = "LEADER", action = wezterm.action.ShowDebugOverlay },

    -- Sessionizer
    { key = "f",      mods = "LEADER", action = wezterm.action_callback(sessionizer.toggle) },
    { key = "l",      mods = "LEADER", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },

    -- Tabs
    { key = "c",      mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "1",      mods = "LEADER", action = wezterm.action.ActivateTab(0) },
    { key = "2",      mods = "LEADER", action = wezterm.action.ActivateTab(1) },
    { key = "3",      mods = "LEADER", action = wezterm.action.ActivateTab(2) },
    { key = "4",      mods = "LEADER", action = wezterm.action.ActivateTab(3) },
    { key = "5",      mods = "LEADER", action = wezterm.action.ActivateTab(4) },
    { key = "6",      mods = "LEADER", action = wezterm.action.ActivateTab(5) },
    { key = "7",      mods = "LEADER", action = wezterm.action.ActivateTab(6) },
}

return config
