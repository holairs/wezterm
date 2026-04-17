local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Habamax"

config.colors = {
	background = "000000",
}

config.font = wezterm.font_with_fallback({
	{
		family = "Terminess Nerd Font Mono",
		weight = "Light",
	},
	{ family = "Apple Color Emoji" },
})

config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "Terminess Nerd Font Mono",
			weight = "Regular",
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "Terminess Nerd Font Mono",
			weight = "Light",
			style = "Italic",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "Terminess Nerd Font Mono",
			weight = "Regular",
			style = "Italic",
		}),
	},
}

-- General terminal options
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 30
config.font_size = 20
config.max_fps = 165
config.line_height = 1.2
config.window_padding = {
	left = 0,
	right = 0,
	top = 0, -- Or 33 to use with the macbook display
	bottom = 0,
}

-- Blinking Block cursor configuration
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 300 -- Miliseconds

-- Configuración adicional para teclas `Option` en macOS
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- Keymaps configuration
config.keys = {
	-- Toggle transparency with CMD+B
	{
		key = "b",
		mods = "ALT",
		action = wezterm.action_callback(function(window)
			local overrides = window:get_config_overrides() or {}
			-- Switch between 1.0 (normal) and 0.8 (transparent) opacity
			if not overrides.window_background_opacity or overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.70 -- Transparent opacity
			else
				overrides.window_background_opacity = 1.0 -- Normal opacity
			end
			window:set_config_overrides(overrides)
		end),
	},

	-- Toggle fullscreen with CMD+ESC
	{ key = "g", mods = "ALT", action = wezterm.action.ToggleFullScreen },

	-- Split the pane horizontally with CTRL+SHIFT+O
	{
		key = "p",
		mods = "ALT",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},

	-- Split the pane vertically with CTRL+SHIFT+P
	{
		key = "o",
		mods = "ALT",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},

	-- Enter copy mode with CMD+;
	{ key = ";", mods = "ALT", action = wezterm.action.ActivateCopyMode },

	-- Move between panes with CTRL+SHIFT+HJKL
	{ key = "h", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },

	-- Close the current pane with CMD+X
	{ key = "x", mods = "ALT", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

	-- Toggle pane zoom state with CMD+Z
	{ key = "z", mods = "ALT", action = "TogglePaneZoomState" },

	-- Resize panes with CMD+SHIFT+HJKL
	{ key = "h", mods = "ALT | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 3 } }) },
	{ key = "j", mods = "ALT | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 3 } }) },
	{ key = "k", mods = "ALT | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 3 } }) },
	{ key = "l", mods = "ALT | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 3 } }) },

	-- Rotate panels
	{ key = "r", mods = "ALT | SHIFT", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) },
}

return config
