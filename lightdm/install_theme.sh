if ! grep -q 'litarvan' /etc/lightdm/lightdm-webkit2-greeter.conf; then
	echo "not containing litarvan"
	find /usr/share/lightdm-webkit/themes/litarvan/css -type f -exec \
			sudo sed -i 's/blur(10px)/blur(0)/g' {} +

	sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf

	sudo sed -i 's/^webkit_theme.*/webkit_theme        = litarvan/g' /etc/lightdm/lightdm-webkit2-greeter.conf

	sudo cp ../wallpaper/* /usr/share/backgrounds/
fi
