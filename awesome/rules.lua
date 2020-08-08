local awful = require('awful')
local gears = require('gears')
local ruled = require("ruled")
local beautiful = require('beautiful')

ruled.client.connect_signal(
	"request::rules",
	function()
		-- for all clients
		ruled.client.append_rule {
			id = "global",
			rule = {},
			properties = {
				focus = awful.client.focus.filter,
				raise = true,
				floating = true,
				maximized = false,
				above = false,
				below = false,
				ontop = false,
				sticky = false,
				maximized_horizontal = false,
				maximized_vertical = false,
				titlebars_enabled = true,
				round_corners = true,
				keys = clientkeys,
				buttons = clientbuttons,
				screen = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen
			}
		}
		-- Dialogs
		ruled.client.append_rule {
			id = "dialog",
			rule_any = {type = {"dialog", "modal"}},
			properties = { 
				above = true,
				draw_backdrop = true,
				skip_decoration = true,
				shape = function(cr, width, height)
							gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
						end,
				placement = awful.placement.centered
			}
		}
		-- Utilities
		ruled.client.append_rule {
			id = "utility",
			rule_any = {type = {"utility"}},
			properties = { 
				titlebars_enabled = false,
				hide_titlebars = true,
				draw_backdrop = false,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}
		-- fullscreen apps
		ruled.client.append_rule {
			id = "terminals",
			rule_any = { 
				class = { 
					"Alacritty",
					"Brave",
					"Discord",
					"Dolphin",
					"Spotify"
				}
			},
			properties = {
				-- tag = '1',
				draw_backdrop = false,
				size_hints_honor = false,
				floating = false
			}
		}
	end
)
