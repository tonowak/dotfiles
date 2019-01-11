#!/bin/zsh

function link() {
	local from="$HOME/dotfiles/$1"
	local to="$HOME/.config/$2"
	mkdir -p $(dirname $to)
	rm -f $to
	ln -s $from $to
}

link compton compton.conf
link i3 i3/config
link i3-gaps-fix gtk-3.0/gtk.css
link termite termite/config
link polybar polybar/config
link neofetch neofetch/config.conf
link rofi rofi/config
link rofi_scripts rofi/scripts
