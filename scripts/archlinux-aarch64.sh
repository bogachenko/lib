#!/bin/bash

# Arch Linux aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers
sudo hostnamectl set-hostname raspberry

sudo pacman -S --needed --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa-libgl xterm xorg-drivers cmake make mesa mesa-demos python perl net-tools htop netctl linux-firmware dialog wpa_supplicant openssh xorg-fonts-cyrillic man-db ruby lua base-devel glew glu freeglut
sudo pacman -S --needed --noconfirm git sddm vim chromium firefox tor wget alsa-plugins alsa-utils pulseaudio alsa-lib ffmpeg jack2 pulseaudio-alsa pulseaudio-bluetooth geary noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu ttf-liberation ttf-opensans ttf-ubuntu-font-family vlc terminus-font pwgen zip unrar p7zip bzip2 lrzip lz4 lzop xz zstd mathjax yt-dlp unzip privoxy dnsmasq hostapd xdg-desktop-portal-gnome gnome-terminal qemu-base networkmanager gedit gnome-notes file-roller ghex gnome-dictionary gnome-notes seahorse simple-scan gnome-sound-recorder baobab cheese

sudo systemctl enable sshd.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable dnsmasq.service
sudo systemctl enable hostapd.service
sudo systemctl enable bluetooth.service
sudo systemctl enable gdm.service