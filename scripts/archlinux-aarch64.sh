#!/bin/bash

# Arch Linux aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers

sudo pacman -S --needed --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa-libgl xterm xorg-drivers cmake make mesa mesa-demos python perl net-tools htop netctl linux-firmware dialog wpa_supplicant openssh xorg-fonts-cyrillic man-db ruby lua base-devel glew glu freeglut zsh
sudo pacman -S --needed --noconfirm git sddm vim chromium firefox tor wget alsa-plugins alsa-utils pulseaudio alsa-lib ffmpeg jack2 pulseaudio-alsa pulseaudio-bluetooth geary noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu ttf-liberation ttf-opensans ttf-ubuntu-font-family vlc terminus-font pwgen zip unrar p7zip bzip2 lrzip lz4 lzop xz zstd mathjax yt-dlp unzip privoxy dnsmasq hostapd xdg-desktop-portal-gnome gnome-terminal qemu-base networkmanager gnome-text-editor gnome-notes file-roller ghex gnome-dictionary gnome-notes seahorse simple-scan gnome-sound-recorder baobab cheese eog epiphany evince gdm gnome-backgrounds gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-color-manager gnome-contacts gnome-control-center gnome-font-viewer gnome-disk-utility gnome-keyring gnome-logs gnome-menus gnome-photos gnome-music gnome-remote-desktop gnome-session gnome-maps gnome-settings-daemon gnome-shell gnome-system-monitor gvfs gvfs-afc gvfs-mtp nautilus rygel totem sushi xdg-user-dirs-gtk

sudo hostnamectl set-hostname raspberry
sudo useradd -m -G wheel -s /bin/zsh username

sudo systemctl enable sshd.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable dnsmasq.service
sudo systemctl enable hostapd.service
sudo systemctl enable bluetooth.service
sudo systemctl enable gdm.service
sudo systemctl enable tor.service
sudo systemctl enable privoxy.service
pulseaudio --start

echo "forward-socks5 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4a / localhost:9050 ." >> /etc/privoxy/config

sudo timedatectl set-timezone Europe/Moscow
sudo sed -i -e "s/server 0.arch.pool.ntp.org/server 0.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 1.arch.pool.ntp.org/server 1.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 2.arch.pool.ntp.org/server 2.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 3.arch.pool.ntp.org/server 3.ru.pool.ntp.org/g" /etc/ntp.conf

sudo chsh -s /bin/zsh username
sudo chsh -s /bin/zsh root

