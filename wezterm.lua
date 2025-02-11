-------------------------------------------------------------------------------
------------------------------- WezTerm Configuration -------------------------
-------------------------------------------------------------------------------
--                                                                           --
--  This configuration defines a customized terminal experience with         --
--  WezTerm, tailored for clarity, efficiency, and aesthetics. Key features  --
--  include a personal colorscheme, advanced key mappings, font fallback     --
--  support, and adaptive transparency controls for macOS.                   --
--                                                                           --
--  Features:                                                                --
--  1. **Nemesis Colorscheme** - A personal dark theme loaded from           --
--      `~/.config/wezterm/colors`, providing a unique visual experience.    --
--                                                                           --
--  2. **Font Fallback System** - Primary font is `IBM Plex Mono`, with      --
--      `Apple Color Emoji` for emoji rendering.                             --
--      Font Source:                                                         --
--      https://github.com/IBM/plex/releases/tag/%40ibm%2Fplex-mono%401.1.0  --
--                                                                           --
--  3. **Adaptive Transparency** - Dynamic toggling of window transparency   --
--      with `CMD+B`.                                                        --
--                                                                           --
--  4. **Custom Keymaps** - Advanced pane management, fullscreen toggle,     --
--      and resizing controls for seamless workflows.                        --
--                                                                           --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- Local variables
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Set custom colorscheme directory
-- config.color_scheme_dirs = { "~/.config/wezterm/colors" }
config.color_scheme = "Monochrome Dark"
-- config.color_scheme = "Monochrome Light"
-- config.color_scheme = "Blossom"
-- config.color_scheme = "Nocturne"

-- Set manual background color
config.colors = {
  background = "000000",
}

-- Font family configuration
config.font = wezterm.font_with_fallback({
  { family = "Terminus (TTF)" },    -- Main font
  { family = "Apple Color Emoji" }, -- Fall back to emoji font :)
})

-- General terminal options
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.macos_window_background_blur = 7
config.font_size = 34
config.max_fps = 165
config.line_height = 1.1
config.window_padding = {
  left = 0,
  right = 0,
  top = 33, -- Or 33 to use with the macbook display
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
    mods = "CMD",
    action = wezterm.action_callback(function(window)
      local overrides = window:get_config_overrides() or {}
      -- Switch between 1.0 (normal) and 0.8 (transparent) opacity
      if not overrides.window_background_opacity or overrides.window_background_opacity == 1.0 then
        overrides.window_background_opacity = 0.80 -- Transparent opacity
      else
        overrides.window_background_opacity = 1.0  -- Normal opacity
      end
      window:set_config_overrides(overrides)
    end),
  },

  -- Toggle fullscreen with CMD+ESC
  { key = "Escape", mods = "CMD",         action = wezterm.action.ToggleFullScreen },

  -- Split the pane horizontally with CTRL+SHIFT+O
  { key = "p",      mods = "CMD",         action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

  -- Split the pane vertically with CTRL+SHIFT+P
  { key = "o",      mods = "CMD",         action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },

  -- Enter copy mode with CMD+;
  { key = ";",      mods = "CMD",         action = wezterm.action.ActivateCopyMode },

  -- Move between panes with CTRL+SHIFT+HJKL
  { key = "h",      mods = "CMD",         action = wezterm.action({ ActivatePaneDirection = "Left" }) },
  { key = "j",      mods = "CMD",         action = wezterm.action({ ActivatePaneDirection = "Down" }) },
  { key = "k",      mods = "CMD",         action = wezterm.action({ ActivatePaneDirection = "Up" }) },
  { key = "l",      mods = "CMD",         action = wezterm.action({ ActivatePaneDirection = "Right" }) },

  -- Close the current pane with CMD+X
  { key = "x",      mods = "CMD",         action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

  -- Toggle pane zoom state with CMD+Z
  { key = "z",      mods = "CMD",         action = "TogglePaneZoomState" },

  -- Resize panes with CMD+SHIFT+HJKL
  { key = "h",      mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 3 } }) },
  { key = "j",      mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 3 } }) },
  { key = "k",      mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 3 } }) },
  { key = "l",      mods = "CMD | SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 3 } }) },
}

return config
