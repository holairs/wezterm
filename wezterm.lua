local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ==============================================================================
-- Sección de temas
-- Descomentar el tema que se quiera usar y comentar el resto para que no hayan
-- conflicots al aplicar los temas.
-- ==============================================================================

-- config.color_scheme = "Moonfly (Gogh)"
-- config.color_scheme = "nordfox"
config.color_scheme = 'Gruvbox dark, hard (base16)'
-- ==============================================================================
-- Fondo manual del terminal

-- config.colors = { background = "#f9f5d7" } -- RETRO DARK BLUE :)
-- config.colors = { background = "24364b" } -- RETRO BLUE :)
-- config.colors = { background = "101010" } -- DARK GRAY
config.colors = { background = "000000" } -- FULL BLACK

-- config.color_scheme_dirs = { "~/.config/wezterm/colors" }
-- config.color_scheme = "Zenbones (light)"
-- config.color_scheme = "Zenbones (dark)"
-- ==============================================================================

-- Configuración de la fuente con fallback específico

config.font = wezterm.font_with_fallback({
	-- { family = "Dank Mono"},
	{ family = "IBM Plex Mono" },
	-- { family = "Tamzen" },
	-- { family = "BigBlue TerminalPlus" },
	-- { family = "CozetteVector" },
	{ family = "Apple Color Emoji" },
})

-- config.font_rules = {
-- 	-- Regla para evitar que las fuentes se vuelvan negritas
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font_with_fallback({
-- 			{ family = "IBM Plex Mono", weight = "Regular" },
-- 		}),
-- 	},
-- 	-- Regla para mantener el estilo cursivo
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({
-- 			{ family = "IBM Plex Mono", italic = true },
-- 		}),
-- 	},
-- }
-- ==============================================================================

-- General terminal options

config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"
config.macos_window_background_blur = 40
config.font_size = 20

config.max_fps = 120

config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}

-- Blinking Block cursor configuration
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 353 -- Miliseconds

-- Configuración adicional para teclas `Option` en macOS
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- ==============================================================================

-- Keymaps configuration

config.keys = {
	-- Asignar CMD + b para alternar entre transparente y opaco
	{
		key = "b",
		mods = "CMD",
		action = wezterm.action_callback(function(window, pane)
			local overrides = window:get_config_overrides() or {}
			-- Alternar entre opacidad del 1.0 (normal) y 0.8 (transparente)
			if not overrides.window_background_opacity or overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.60 -- Opacidad transparente
			else
				overrides.window_background_opacity = 1.0 -- Opacidad normal
			end
			window:set_config_overrides(overrides)
		end),
	},

	-- Atajo para maximizar la pantalla
	{ key = "Escape", mods = "CMD", action = wezterm.action.ToggleFullScreen },

	-- Dividir el panel horizontalmente con CTRL+SHIFT+O
	{ key = "p", mods = "CMD", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

	-- Dividir el panel verticalmente con CTRL+SHIFT+P
	{ key = "o", mods = "CMD", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },

	-- Entrar al modo de ActivateCopyMode

	{ key = ";", mods = "CMD", action = wezterm.action.ActivateCopyMode },

	-- Moverse entre paneles con CTRL+SHIFT+HJKL
	{ key = "h", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Right" }) },

	-- Cerrar el panel con CTRL+SHIFT+X
	{ key = "x", mods = "CMD", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

	-- Alternar el estado de zoom del panel con CTRL+SHIFT+Z
	{ key = "z", mods = "CMD", action = "TogglePaneZoomState" },

	-- Redimensionar paneles
	{ key = "h", mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 8 } }) },
	{ key = "j", mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 8 } }) },
	{ key = "k", mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 8 } }) },
	{ key = "l", mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 8 } }) },
}

-- ==============================================================================

-- config.font_rules = {
-- 	-- Regla para mantener el estilo cursivo
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font_with_fallback({
-- 			{ family = "Dank Mono", italic = true },
-- 		}),
-- 	},
-- }
--

return config
