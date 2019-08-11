#!/bin/zsh

all='
Brave # brave
Terminal (termite) # termite
Password Manager # passmenu --type
Spotify # spotify
Discord # discord
Messenger # /home/tonowak/.config/rofi/scripts/messenger.sh
Lock Screen # i3lock-fancy
Copy/Paste Clipboard # /home/tonowak/.config/rofi/scripts/clipboard.sh
Rofi (terminal command) # rofi -show run
WiFi # /home/tonowak/.config/rofi/scripts/wifi.sh
SSH # rofi -show ssh
Open windows (window switcher) # rofi -show window
Calculator # rofi -show calc -modi calc -no-show-match -no-sort
Clocks / Stoper / Timer # gnome-clocks
Video Player (vlc) # vlc
Image Viewer (eog) # eog
Screenshot / Recording # slip
File Manager (Nautilus) # nautilus
Archive Manager (file-roller) # file-roller
Torrent Client (transmission) # transmission-gtk
Disk Utility # gnome-disks
USB Live CD Creator # sudo usb-creator-gtk
Removable Media # udiskie-dmenu
Character Map # gucharmap
Steam # steam
Volume Control (pulseaudio) # pavucontrol
Libre Office # libreoffice
'

dmenu_input=""
while read -r line; do
	description=$(echo $line | awk -F" # " '{print $1}')
	command=$(echo $line | awk -F" # " '{print $2}')
	dmenu_input="$dmenu_input$description\n"
done <<< "$all"
dmenu_input="$(echo $dmenu_input | sed '/^$/d')"

output=$(echo "$dmenu_input" | rofi -dmenu -config ~/.config/rofi/config -i)

while read -r line; do
	description=$(echo $line | awk -F" # " '{print $1}')
	command=$(echo $line | awk -F" # " '{print $2}')
	if [ "$description" = "$output" ]; then
		exec $(echo $command)
		notify-send "$(echo $command)"
	fi
done <<< "$all"

