#!/bin/zsh

clipboard_options="$(greenclip print)
Clear clipboard"

output=$(echo "$clipboard_options" | rofi -dmenu -p clipboard -i)
echo $output
if [ "$output" = "Clear clipboard" ]; then
	greenclip clear
	pkill greenclip
	exec greenclip daemon
else
	greenclip print $output
fi

