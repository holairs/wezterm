local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Habamax"

config.colors = {
	background = "000000",
}

config.font = wezterm.font_with_fallback({
	{
		family = "BigBlue TerminalPlus",
		weight = "Light",
	},
	{ family = "Apple Color Emoji" },
})

config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "BigBlue TerminalPlus",
			weight = "Regular",
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "BigBlue TerminalPlus",
			weight = "Light",
			style = "Italic",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "BigBlue TerminalPlus",
			weight = "Regular",
			style = "Italic",
		}),
	},
}

-- General terminal options
config.enable_tab_bar = false
config.window_background_opacity = 0.80
config.window_decorations = "NONE"
config.font_size = 18
config.max_fps = 165
config.line_height = 1.2
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Blinking Block cursor configuration
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 300 -- Miliseconds

-- Keymaps configuration
config.keys = {
	-- Toggle transparency with CMD+B
	{
		key = "b",
		mods = "CMD",
		action = wezterm.action_callback(function(window)
			local overrides = window:get_config_overrides() or {}
			-- Switch between 1.0 (normal) and 0.8 (transparent) opacity
			if not overrides.window_background_opacity or overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.80 -- Transparent opacity
			else
				overrides.window_background_opacity = 1.0 -- Normal opacity
			end
			window:set_config_overrides(overrides)
		end),
	},

	-- Toggle fullscreen with CMD+ESC
	{ key = "g", mods = "CMD", action = wezterm.action.ToggleFullScreen },

	-- Split the pane horizontally with CTRL+SHIFT+O
	{
		key = "p",
		mods = "CMD",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},

	-- Split the pane vertically with CTRL+SHIFT+P
	{
		key = "o",
		mods = "CMD",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},

	-- Enter copy mode with CMD+;
	{ key = ";", mods = "CMD", action = wezterm.action.ActivateCopyMode },

	-- Move between panes with CTRL+SHIFT+HJKL
	{ key = "h", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Right" }) },

	-- Close the current pane with CMD+X
	{ key = "w", mods = "CMD", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

	-- Toggle pane zoom state with CMD+Z
	{ key = "z", mods = "CMD", action = "TogglePaneZoomState" },

	-- Resize panes with CMD+SHIFT+HJKL
	{ key = "h", mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 3 } }) },
	{ key = "j", mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 3 } }) },
	{ key = "k", mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 3 } }) },
	{ key = "l", mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 3 } }) },

	-- Rotate panels
	{ key = "r", mods = "CMD | SHIFT", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) },
}

return config
