local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

local icons = require('icons.topbar')
local apps = require('configuration.apps')

local tags = {
	{
		icon = icons.terminal,
		type = 'terminal',
		default_app = apps.default.terminal,
		screen = 1
	},
	{
		icon = icons.web_browser,
		type = 'brave',
		default_app = apps.default.web_browser,
		screen = 1
	},
	{
		icon = icons.terminal,
		type = 'code',
		default_app = apps.default.text_editor,
		screen = 1
	},
	{
		icon = icons.social,
		type = 'discord',
		default_app = apps.default.discord,
		screen = 1
	},
	{
		icon = icons.music,
		type = 'spotify',
		default_app = apps.default.spotify,
		screen = 1
	},
	{
		icon = icons.terminal,
		type = 'terminal3',
		default_app = apps.default.terminal,
		screen = 1
	},
}


tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
		awful.layout.suit.spiral.dwindle,
		awful.layout.suit.tile,
		awful.layout.suit.max
    })
end)


screen.connect_signal("request::desktop_decoration", function(s)
	for i, tag in pairs(tags) do
		awful.tag.add(
			i,
			{
				icon = tag.icon,
				icon_only = true,
				layout = awful.layout.suit.spiral.dwindle,
				gap_single_client = true,
				gap = beautiful.useless_gap,
				screen = s,
				default_app = tag.default_app,
				selected = i == 1
			}
		)
	end
end)


tag.connect_signal(
	'property::layout',
	function(t)
		local currentLayout = awful.tag.getproperty(t, 'layout')
		if (currentLayout == awful.layout.suit.max) then
			t.gap = 0
		else
			t.gap = beautiful.useless_gap
		end
	end
)
