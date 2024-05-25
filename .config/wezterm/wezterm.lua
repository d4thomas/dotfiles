local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font Mono")
--config.color_scheme = 'Dracula (Official)'
config.color_scheme = "Tokyo Night Storm"
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 5
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.initial_rows = 53
config.initial_cols = 132
config.audible_bell = "Disabled"
config.window_close_confirmation = "NeverPrompt"

return config
