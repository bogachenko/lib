#!/bin/bash

# Raspberry Pi aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

echo 'Updating the package list.'
sudo apt update; sudo apt upgrade

echo 'Removing garbage packages after updating packages.'
sudo apt autoremove

echo 'Installing the core packages.'
sudo apt install --no-install-recommends --no-install-suggests openssh-server xserver-xorg x11-utils x11-xserver-utils xfonts-base xterm console-cyrillic htop python3 python3-pip xinit mesa-utils zsh ufw net-tools perl ruby php gpm apparmor xdg-utils xss-lock
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
echo 'Installing the sub-core packages.'
sudo apt install --no-install-recommends --no-install-suggests vim git pipewire pipewire-jack pipewire-alsa pipewire-pulse alsa-utils rofi i3 sddm dunst scrot rxvt-unicode mpd ranger zip unrar p7zip unzip wget lshw
echo 'Installing the extra packages.'
sudo apt install --no-install-recommends --no-install-suggests tor firefox plymouth

echo 'Enabling and running services.'
sudo systemctl enable ssh.service
sudo systemctl enable ufw.service
sudo systemctl enable tor.service
sudo systemctl enable mpd.service

echo 'Enabling the Z shell by default.'
sudo chsh -s /bin/zsh root
sudo chsh -s /bin/zsh username

echo 'Enabling firewall rules.'
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 123/udp
sudo ufw allow 22/tcp
sudo ufw allow 21/tcp
sudo ufw allow 5900/tcp
sudo ufw allow 443
sudo ufw allow 80
sudo ufw enable