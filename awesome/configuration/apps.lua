local filesystem = require('gears.filesystem')

local config_dir = filesystem.get_configuration_dir()
-- local bin_dir = config_dir .. 'binaries/'

return {
	default = {
		terminal 			= 'alacritty',
		text_editor 		= 'vim',
		web_browser 		= 'brave',
		file_manager 		= 'dolphin',
		discord				= 'discord',
		spotify				= 'env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify',
		-- network_manager 	= 'nm-connection-editor',
		-- power_manager 	= 'xfce4-power-manager',
		-- package_manager 	= 'pamac-manager',
		lock 				= 'light-locker-command -l',
		-- quake 			= 'kitty --name QuakeTerminal',

		rofiglobal			= 'rofi -dpi ' .. screen.primary.dpi .. 
								' -show "Global Search" -modi "Global Search":' .. config_dir .. 
								'/configuration/rofi/sidebar/rofi-spotlight.sh' .. 
								' -theme ' .. config_dir ..
								'/configuration/rofi/sidebar/rofi.rasi',
		

		rofiappmenu 		= 'rofi -dpi ' .. screen.primary.dpi ..
								' -show drun -theme ' .. config_dir ..
								'/configuration/rofi/appmenu/rofi.rasi'
	},
	
	-- List of apps to start once on start-up
	-- auto-start.lua module will start these

	run_on_start_up = {
		'picom -b --experimental-backends --dbus',
		'gpgconf --launch gpg-agent',
		'redshift',
		'setxkbmap pl',
		'light-locker'
	},
}
