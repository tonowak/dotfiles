---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme_dir = gfs.get_configuration_dir() 
local tip = theme_dir .. "/icons/titlebar/"

local theme = {}

theme.font = "sans 11"
theme.icon_theme = "Papirus-Dark"

theme.system_black_dark = '#282c34'
theme.system_black_light = '#5c6370'
theme.system_red_dark = '#e06c75'
theme.system_red_light = '#be5046'
theme.system_green_dark = '#98c379'
theme.system_green_light = '#7a9f60'
theme.system_yellow_dark = '#e5c07b'
theme.system_yellow_light = '#d19a66'
theme.system_blue_dark = '#61afef'
theme.system_blue_light = '#3b84c0'
theme.system_magenta_dark = '#c678dd'
theme.system_magenta_light = '#9a52af'
theme.system_cyan_dark = '#56b6c2'
theme.system_cyan_light = '#3c909b'
theme.system_white_dark = '#abb2bf'
theme.system_white_light = '#828997'

-- theme.background = "#000000".."66"
-- theme.background = "#000000".."a9"
theme.background = "#000000".."9a"
theme.transparent = "#00000000"
theme.accent = theme.system_green_dark

theme.bg_normal     = theme.background
theme.bg_focus      = "#5a5a5a"
theme.bg_urgent     = "#3f3f3f"
-- theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.background
theme.systray_icon_spacing = dpi(16)

-- theme.fg_normal     = "#ffffffde"
theme.fg_normal      = "#e4e4e4"
theme.fg_focus      = "#e4e4e4"
theme.fg_urgent     = "#cc9393"
-- theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(10)
theme.border_width  = dpi(0)

theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

theme.border_radius = dpi(0)
theme.client_radius = dpi(15)

theme.groups_title_bg = "#ffffff" .. "15"
theme.groups_bg = "#ffffff" .. "10"
theme.groups_radius = dpi(9)

-- titlebar
theme.titlebar_size = dpi(34)
theme.titlebar_bg_focus = theme.background
theme.titlebar_bg_normal = theme.background
theme.titlebar_fg_focus = '#e1e4e8'
theme.titlebar_fg_normal = theme.titlebar_fg_focus

-- menu
theme.menu_height = dpi(34)
theme.menu_width = dpi(200)
theme.menu_border_width = dpi(20)
theme.menu_bg_focus = theme.accent .. "CC"
theme.menu_bg_normal =  theme.background
theme.menu_fg_normal = '#ffffff'
theme.menu_fg_focus = '#ffffff'
theme.menu_border_color = theme.background
theme.menu_submenu_icon = themes_path.."default/submenu.png"

theme.taglist_bg_empty = theme.transparent
theme.taglist_bg_occupied =  '#ffffff' .. '1A'
theme.taglist_bg_urgent = "#E91E63" .. '99'
theme.taglist_bg_focus = '#ffffff' .. '30'
theme.taglist_spacing = dpi(0)

theme.tasklist_bg_normal = theme.transparent
theme.tasklist_bg_focus = '#ffffff' .. '30'
theme.tasklist_bg_urgent = "#E91E63" .. '99'
theme.tasklist_fg_focus = '#DDDDDD'
theme.tasklist_fg_urgent = "#ffffff"
theme.tasklist_fg_normal = '#AAAAAA'

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_focus = tip .. "x.svg"
theme.titlebar_floating_button_focus_inactive  = tip .. "columns.svg"
theme.titlebar_floating_button_focus_active  = tip .. "copy.svg"
theme.titlebar_maximized_button_focus_inactive  = tip .. "maximize-2.svg"
theme.titlebar_maximized_button_focus_active  = tip .. "minimize-2.svg"
-- theme.titlebar_minimize_button_focus  = tip .. "minimize-2.svg"

theme.titlebar_close_button_normal  = tip .. "transparent.png"
theme.titlebar_maximized_button_normal_inactive = tip .. "transparent.png"
theme.titlebar_maximized_button_normal_active = tip .. "transparent.png"
theme.titlebar_floating_button_normal_inactive = tip .. "transparent.png"
theme.titlebar_floating_button_normal_active = tip .. "transparent.png"
-- theme.titlebar_minimize_button_normal = tip .. "transparent.png"


theme.wallpaper = "/home/tonowak/.config/wallpaper.jpg"


-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
