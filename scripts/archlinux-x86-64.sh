#!/bin/bash

# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

TELLUSER=$(whoami)
PASSWD='N7GZiMD!2ZTaZWYj0mLV'
UA='Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'
FONT='Noto Sans'
FONTM='Noto Sans Mono'
FONTMM='Noto Sans Medium'

# Getting root permission.
su

# Installing Russian localization for the system.
cat > /etc/vconsole.conf <<EOF
FONT=ter-k16n
KEYMAP=ru
EOF
cat > /etc/locale.gen <<EOF
ru_RU.UTF-8 UTF-8
en_US.UTF-8 UTF-8
EOF
locale-gen
setfont ter-k16n
localectl set-locale LANG="ru_RU.UTF-8"
cat > /etc/X11/xorg.conf.d/00-keyboard.conf <<EOF
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,ru"
        Option "XkbModel" "pc105"
        Option "XkbVariant" ""
        Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
EOF

# Refresh mirrors for the pacman.
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
pacman-mirrors --country Russia

# Updating repository data and installing updates.
pacman -Syyuu

# Installing main packages.
pacman -S --needed zsh git vim htop neofetch net-tools tor privoxy cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-dejavu ttf-liberation netctl gparted openresolv xorg-drivers xorg-server ranger code firefox-i18n-ru firefox xorg-xinit jack2 noto-fonts noto-fonts-emoji sddm dmenu i3-wm scrot xorg-xsetroot i3status gvfs dhclient alsa-plugins alsa-utils pulseaudio nyx vlc noto-fonts-cjk xorg-xrdb speedtest-cli xdg-user-dirs gtk2 gtk3 gtk4 dhcpcd xdg-utils xautolock hostapd xorg-apps dnsmasq rxvt-unicode unzip i3lock ppp bluez bluez-untils ttf-fira-code ttf-fira-mono mathjax youtube-dl pcmanfm-qt python2 python create_ap ttf-carlito ttf-caladea ttf-croscore libevent perl xorg-xclock xorg-xmodmap npm nodejs terminus-font mesa mesa-demos qt5ct pwgen imagemagick dunst libjpeg-turbo capitaine-cursors breeze-icons chromium yajl zip unrar p7zip bzip2 lrzip lz4 lzop xz zstd arj lhasa lxqt-archiver onboard pulseaudio-bluetooth pulseaudio-equalizer
