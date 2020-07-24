local awful = require("awful")
local naughty = require("naughty")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('topbar.widget.clickable-container')

local bordered_widget

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

	local build_widget = function(my_widget)
		local bordered_widget = wibox.widget {
			{
				{
					my_widget,
					margins = dpi(6),
					widget = wibox.container.margin
				},
				widget = clickable_container
			},
			border_width = dpi(1),
			border_color = "#ffffff30",
			bg = beautiful.transparent,
			shape = function(cr, w, h)
				gears.shape.rounded_rect(cr, w, h, dpi(10))
			end,
			widget = wibox.container.background
		}
		c:connect_signal("focus", function()
			bordered_widget.border_color = "#ffffff30"
		end)
		c:connect_signal("unfocus", function()
			bordered_widget.border_color = "#00000000"
		end)
		return wibox.widget {
			bordered_widget,
			top = dpi(2),
			bottom = dpi(2),
			widget = wibox.container.margin
		}
	end

    awful.titlebar(c) : setup {
        { -- Left
			{
				-- awful.titlebar.widget.iconwidget(c),
				buttons = buttons,
				layout = wibox.layout.fixed.horizontal
			},
			forced_width = dpi(90),
			layout  = wibox.container.margin
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
			{
				build_widget(awful.titlebar.widget.floatingbutton (c)),
				build_widget(awful.titlebar.widget.maximizedbutton(c)),
				build_widget(awful.titlebar.widget.closebutton    (c)),
				spacing = dpi(5),
				layout = wibox.layout.fixed.horizontal
			},
			right = dpi(5),
			layout = wibox.container.margin
        },
        layout = wibox.layout.align.horizontal
    }
	-- naughty.notify({text="xd1" .. bordered_widget.border_color})
	-- naughty.notify({text="xd2" .. bordered_widget.border_color})
end)

-- signals

client.connect_signal(
	"manage", 
	function(c)
		if not c.max and not c.hide_titlebars then
			awful.titlebar.show(c)
		else
			awful.titlebar.hide(c)
		end
	end
)

-- Catch the signal when a client's layout is changed
screen.connect_signal(
	"arrange", 
	function(s)
		for _, c in pairs(s.clients) do
			if (#s.tiled_clients >= 1 or c.floating) and c.first_tag.layout.name ~= 'max' then
				if not c.hide_titlebars then
					awful.titlebar.show(c)
				else 
					awful.titlebar.hide(c)
				end
				if c.maximized or not c.round_corners or c.fullscreen then
					c.shape = function(cr, w, h)
						gears.shape.rectangle(cr, w, h)
					end
				else 
					c.shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
					end
				end
			-- elseif (#s.tiled_clients == 1 or c.first_tag.layout.name == 'max') and not c.fullscreen then
				-- awful.titlebar.hide(c)
				-- c.shape = function(cr, w, h)
					-- gears.shape.rectangle(cr, w, h)
				-- end
			end
		end
	end
)


client.connect_signal("property::maximized", function(c)
	c.shape = gears.shape.rectangle
	if not c.maximized then
		c.shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
		end
	end
end)
