local wezterm = require("wezterm")
local act = wezterm.action

return {
	font = wezterm.font("Hack Nerd Font"),
	freetype_load_target = "Light",
	freetype_render_target = "HorizontalLcd",
	-- font = wezterm.font 'JetBrains Mono',
	-- color_scheme = 'nightfox',
	color_scheme = "nightfox",
	-- tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	colors = {
		split = "#ddd6fe",
		-- cursor_bg = "yellow",
	},
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_background_opacity = 0.9,
	macos_window_background_blur = 15,
	-- leader = { key = 'Space', mods = 'SHIFT', timeout_milliseconds = 1000 },
	keys = {
		{ key = "d", mods = "SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "D", mods = "SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "LeftArrow", mods = "SUPER", action = act.ActivatePaneDirection("Left") },
		{ key = "RightArrow", mods = "SUPER", action = act.ActivatePaneDirection("Right") },
		{ key = "UpArrow", mods = "SUPER", action = act.ActivatePaneDirection("Up") },
		{ key = "DownArrow", mods = "SUPER", action = act.ActivatePaneDirection("Down") },
		{ key = "RightArrow", mods = "SUPER|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "LeftArrow", mods = "SUPER|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	},
}
