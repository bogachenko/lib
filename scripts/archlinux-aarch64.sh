#!/bin/bash

# Arch Linux aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

sudo pacman -S --needed --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa-libgl xterm xorg-drivers cmake make mesa mesa-demos python perl net-tools htop netctl linux-firmware dialog wpa_supplicant openssh xorg-fonts-cyrillic man-db ruby lua base-devel glew glu freeglut zsh sudo xorg-xclock xorg-xmodmap xorg-xsetroot
sudo pacman -S --needed --noconfirm git sddm vim chromium firefox tor wget alsa-plugins alsa-utils pulseaudio alsa-lib ffmpeg jack2 pulseaudio-alsa pulseaudio-bluetooth geary noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu ttf-liberation ttf-opensans ttf-ubuntu-font-family vlc terminus-font pwgen zip unrar p7zip bzip2 lrzip lz4 lzop xz zstd mathjax yt-dlp unzip privoxy dnsmasq hostapd xdg-desktop-portal-gnome gnome-console qemu-base networkmanager gnome-text-editor gnome-notes file-roller ghex gnome-dictionary gnome-notes seahorse simple-scan gnome-sound-recorder baobab cheese eog epiphany evince gdm gnome-backgrounds gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-color-manager gnome-contacts gnome-control-center gnome-font-viewer gnome-disk-utility gnome-keyring gnome-logs gnome-menus gnome-photos gnome-music gnome-remote-desktop gnome-session gnome-maps gnome-settings-daemon gnome-shell gnome-system-monitor gvfs gvfs-afc gvfs-mtp nautilus rygel totem sushi xdg-user-dirs-gtk transmission-gtk transmission-cli gnome-firmware gnome-user-share pwgen ntp yajl

sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers

sudo hostnamectl set-hostname raspberry
sudo useradd -m -g users -G wheel -s /bin/zsh username

sudo systemctl enable sshd.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable dnsmasq.service
sudo systemctl enable hostapd.service
sudo systemctl enable bluetooth.service
sudo systemctl enable gdm.service
sudo systemctl enable tor.service
sudo systemctl enable privoxy.service
sudo systemctl enable ntpd.service

echo "forward-socks5 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4a / localhost:9050 ." >> /etc/privoxy/config

sudo timedatectl set-timezone Europe/Moscow
sudo timedatectl set-ntp true
sudo sed -i -e "s/server 0.arch.pool.ntp.org/server 0.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 1.arch.pool.ntp.org/server 1.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 2.arch.pool.ntp.org/server 2.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 3.arch.pool.ntp.org/server 3.ru.pool.ntp.org/g" /etc/ntp.conf

curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

sudo chsh -s /bin/zsh username
sudo chsh -s /bin/zsh root

cat > ~/.zshrc <<EOF
PROMPT="%F{34}%n%f%F{34}@%f%F{34}%m%f:%F{21}%~%f$ "
export BROWSER="firefox"
export EDITOR="vim"
alias ls='ls -la'
alias reboot='sudo reboot'
alias unlockpac='sudo rm -f /var/lib/pacman/db.lck'
alias vi='vim'
alias cl='clear'
alias sysctl='systemctl'
EOF
cat > /tmp/.zshrc <<EOF
PROMPT="%F{9}%n%f%F{9}@%f%F{9}%m%f:%F{21}%~%f# "
export BROWSER="firefox"
export EDITOR="vim"
alias ls='ls -la'
alias unlockpac='rm -f /var/lib/pacman/db.lck'
alias vi='vim'
alias cl='clear'
alias sysctl='systemctl'
EOF
sudo mv /tmp/.zshrc /root/.zshrc