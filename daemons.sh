# todo: change it so that it executes it only when it needs, thus not requiring sudo for consecutive launches
sudo systemctl enable --now nordvpnd
nordvpn connect
