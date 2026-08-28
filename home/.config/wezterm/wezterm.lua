local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Junie's dark palette, so terminal, editor and agent panes share one background.
local app_bg = "#191A1C"
local panel_bg = "#141516"

config.color_scheme = "rose-pine-moon"
config.colors = { background = app_bg }
config.window_frame = {
	active_titlebar_bg = panel_bg,
	inactive_titlebar_bg = panel_bg,
}
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15.0
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- Start a login shell so ~/.zprofile is sourced (loads ATLASSIAN_* creds etc).
-- WezTerm doesn't do this by default; macOS Terminal does.
config.default_prog = { os.getenv("SHELL") or "/bin/zsh", "-l" }

return config
