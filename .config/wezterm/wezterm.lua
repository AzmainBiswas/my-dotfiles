local wezterm = require("wezterm")

local config = {}

-- fonts
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13

-- color scheme
config.color_scheme = "Catppuccin Mocha"

-- background
config.window_background_opacity = 0.85

-- hide tab bar
config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true

-- config.window_background_image = "/mnt/media/wallpapers/cat_leaves.png"
-- config.window_background_image_hsb = {
-- 	-- Darken the background image by reducing it to 1/3rd
-- 	brightness = 0.1,
--
-- 	-- You can adjust the hue by scaling its value.
-- 	-- a multiplier of 1.0 leaves the value unchanged.
-- 	hue = 1.0,
--
-- 	-- You can adjust the saturation also.
-- 	saturation = 1.0,
-- }

return config
