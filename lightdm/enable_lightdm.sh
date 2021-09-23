#!/bin/sh

if [ $(systemctl is-active lightdm) != "active" ]; then
	sudo systemctl enable lightdm --now
fi
