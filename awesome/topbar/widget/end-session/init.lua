local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')

local clickable_container = require('topbar.widget.clickable-container')
local dpi = require('beautiful').xresources.apply_dpi

local icons = require('icons.topbar')
local apps = require('configuration.apps')

local return_button = function()

	local widget = wibox.widget {
		{
			id = 'icon',
			image = icons.logout,
			resize = true,
			widget = wibox.widget.imagebox
		},
		layout = wibox.layout.align.horizontal
	}

	local widget_button = wibox.widget {
		{
			widget,
			margins = dpi(7),
			widget = wibox.container.margin
		},
		widget = clickable_container
	}

	widget_button:buttons(
		gears.table.join(
			awful.button(
				{},
				1,
				nil,
				function()
					awful.spawn(apps.default.lock)
				end
			)
		)
	)


	return widget_button

end

return return_button
