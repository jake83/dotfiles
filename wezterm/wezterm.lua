local wezterm = require("wezterm")

local config = wezterm.config_builder()

local is_windows = os.getenv("OS") and os.getenv("OS"):lower():find("windows")
local is_macos = wezterm.target_triple:lower():find("darwin") ~= nil

-- Junie's dark palette, so terminal, editor and agent panes share one background.
local app_bg = "#191A1C"
local panel_bg = "#141516"

config.color_scheme = "rose-pine-moon"
config.colors = { background = app_bg }
config.max_fps = 120
config.font = wezterm.font("Hack Nerd Font", { weight = "Regular" })
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.window_frame = {
	font = wezterm.font("Hack Nerd Font", { weight = "Bold" }),
	active_titlebar_bg = panel_bg,
	inactive_titlebar_bg = panel_bg,
}
config.inactive_pane_hsb = {
	saturation = 0.0,
	brightness = 0.5,
}

if is_windows then
	config.window_frame.font_size = 10.0
end

if is_macos then
	config.font_size = 15.0
	config.window_frame.font_size = 13.0
end

return config
