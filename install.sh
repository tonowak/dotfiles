#!/bin/zsh

function link() {
	local from="$HOME/dotfiles/$1"
	local to="$HOME/.config/$2"
	mkdir -p $(dirname $to)
	rm -f $to
	ln -s $from $to
}

link neofetch neofetch/config.conf
link trizen trizen/trizen.conf
link termite termite/config
link polybar polybar/config
link i3-gaps-fix gtk-3.0/gtk.css
