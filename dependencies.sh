# needed:
# trizen git
# not installing:
# oh-my-zsh

function install() {
	trizen --quiet --needed -S $@
}

# DE
install compton-tryone-git i3-gaps polybar dunst rofi

# terminal
install termite zsh vim

# rofi
install rofi rofi-calc

# pass
install rofi-dmenu pass passmenu browserpass qrencode

# fonts
install ttf-dejavu ttf-font-awesome ttf-ubuntu-font-family powerline-fonts-git

# gtk themes
install lxappearance equilux-theme papirus-icon-theme-git

# gtk apps
install transmission-gtk gnome-disk-utility nautilus file-roller eog gnome-screenshot gucharmap vlc usb-creator pavucontrol

# terminal / gui utilities
install 7z wget bc clang xclip
install i3lock-fancy-git neofetch feh

# applications
install redshift spotify chromium
