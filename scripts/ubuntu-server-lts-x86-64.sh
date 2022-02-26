#!/bin/bash

# Ubuntu Server LTS x86_64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

FONT='Noto Mono'

# Clear the console
clear

# Installing updates and updating the data repositories
sudo apt update && sudo apt upgrade

# Installing core packages
sudo apt install fonts-noto i3 fping firefox tor privoxy ttf-mscorefonts-installer make python
sudo apt install xinit x11-xserver-utils virtualbox-guest-x11 mesa-utils
sudo apt --no-install-recommends install sddm ffmpeg gvfs xdg-dbus-proxy xdg-user-dirs-gtk xdg-utils ranger

# Disabling recommended and suggested packages during installation
cat > /etc/apt/apt.conf.d/99norecommends <<EOF
APT::Install-Recommends "0";
APT::Install-Suggests "0";
EOF

# Installing the VSCodium package
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium

# Creating default directories
xdg-user-dirs-update

# Enabling daemons
sudo systemctl enable sddm.service
sudo systemctl enable tor.service && sudo systemctl start tor.service
sudo systemctl enable privoxy.service && sudo systemctl start privoxy.service

# Desktop background configuration
echo "exec_always --no-startup-id xsetroot -solid \"#003760\"" >> ~/.config/i3/config

# Xresources file configuration
cat > ~/.Xresources <<EOF
Xft.dpi: 96
Xft.antialias: 1
Xft.hinting: 1
Xft.rgba: rgb
Xft.autohint: 0
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault

URxvt.iso14755: false
URxvt.iso14755_52: false
URxvt.clipboard.autocopy: true
URxvt.keysym.Shift-Control-V: eval:paste_clipboard
URxvt.keysym.Shift-Control-C: eval:selection_to_clipboard
URxvt.scrollBar: false
URxvt.background: #000000
URxvt.foreground: #ffffff
URxvt.font: xft:$FONT:bold:size=9
URxvt.geometry: 150x30
URxvt.scrollTtyOutput: false
URxvt.cursorBlink: true
EOF
xrdb ~/.Xresources
