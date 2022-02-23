#!/bin/bash

# Ubuntu Server LTS x86_64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

USERNAME=$(whoami)
FONT='Ubuntu Mono'

# Clear the console
clear

# Screen resolution
xrandr --size 16:9

# Installing updates and updating the data repositories
sudo apt update && sudo apt upgrade

# Installing core packages
sudo apt-get install xinit mesa-utils x11-xserver-utils x11-utils
sudo apt-get install fping rar unrar unzip p7zip-full p7zip-rar fonts-noto i3

# firefox   vlc ubuntu-restricted-extras tor libavcodec-extra libdvd-pkg   ffmpeg privoxy

# Enabling daemons
#sudo systemctl enable sddm.service && sudo systemctl start sddm.service
sudo systemctl enable tor.service && sudo systemctl start tor.service
sudo systemctl enable privoxy.service && sudo systemctl start privoxy.service

# Desktop background configuration
echo "exec_always --no-startup-id xsetroot -solid \"#003760\"" >> ~/.config/i3/config

# Installing the configuration file user.js for Firefox
cd /tmp
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/firefox-user.js
mv /tmp/user.js ~/.mozilla/firefox/$USERNAME/user.js

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
