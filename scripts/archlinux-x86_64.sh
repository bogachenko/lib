#!/bin/bash

# Arch Linux x86_64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
# https://raw.githubusercontent.com/bogachenko/lib/master/scripts/archlinux-x86_64.sh

echo 'Updating the package list.'
sudo pacman -Syyuu

echo 'Installing the core packages.'
sudo pacman -S --needed --noconfirm linux-firmware base-devel openssh xorg xorg-xclock xorg-xmodmap xorg-xsetroot xorg-server xorg-xinit xorg-xrdb xorg-fonts-misc xorg-xlsfonts xorg-drivers xorg-fonts-cyrillic xterm xautolock htop python python-pip mesa lib32-mesa mesa-utils lib32-mesa-utils zsh ufw netctl net-tools dialog ifplugd netctl perl ruby php lua go gpm apache apparmor xdg-utils xss-lock libnotify cmake plymouth xdg-desktop-portal xdg-user-dirs e2fsprogs xfsprogs reiserfsprogs fatresize dosfstools udftools f2fs-tools exfatprogs jfsutils nilfs-utils ntfs-3g ca-certificates iptables man-db busybox systemd-resolved weston encfs cryfs
echo 'Installing the sub-core packages.'
sudo pacman -S --needed --noconfirm ntp vim git pwgen wireplumber pipewire lib32-pipewire pipewire-jack lib32-pipewire-jack pipewire-alsa pipewire-pulse alsa-utils alsa-plugins lib32-alsa-plugins ffmpeg mpd ranger zip unrar p7zip unzip lzop zstd lz4 lrzip arj bzip2 xz wget curl lshw bind dnsmasq hostapd i2pd nyx tor torsocks proxychains privoxy ttf-ubuntu-font-family noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation ttf-dejavu gtk2 gtk3 gtk4 qt5 qt6
echo 'Installing the extra packages.'
sudo pacman -S --needed --noconfirm firefox firefox-i18n-ru thunderbird thunderbird-i18n-ru chromium vlc xcursor-vanilla-dmz i3 gvfs sddm rofi dunst scrot rxvt-unicode gimp speedtest-cli steam steam-native-runtime retroarch libretro wine wine-mono wine-gecko hunspell hunspell-ru hyphen-en hunspell-en_US libreoffice-fresh yt-dlp telegram-desktop code qbittorrent transmission-cli bluez cups bluez-cups cups-pdf cups-filters networkmanager modemmanager usb_modeswitch

echo 'Installing the Arch User Repository.'
cd /tmp;git clone https://aur.archlinux.org/package-query.git;git clone https://aur.archlinux.org/yaourt.git;cd package-query/;makepkg -si;cd ..;cd yaourt/;makepkg -si

echo 'Adding a keys'
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org

echo 'Installing main packages.'
yaourt -S --needed --noconfirm ttf-ms-fonts tor-browser mkinitcpio-firmware

echo 'Settings the time and date.'
sudo timedatectl set-timezone Europe/Moscow
sudo sed -i -e "s/server 0.arch.pool.ntp.org/server 0.ru.pool.ntp.org/g" /etc/ntp.conf;sudo sed -i -e "s/server 1.arch.pool.ntp.org/server 1.ru.pool.ntp.org/g" /etc/ntp.conf;sudo sed -i -e "s/server 2.arch.pool.ntp.org/server 2.ru.pool.ntp.org/g" /etc/ntp.conf;sudo sed -i -e "s/server 3.arch.pool.ntp.org/server 3.ru.pool.ntp.org/g" /etc/ntp.conf

echo 'Enabling services.'
sudo systemctl restart systemd-resolved.service
sudo systemctl disable dnsmasq.service
sudo systemctl disable hostapd.service
sudo systemctl enable apparmor.service
sudo systemctl enable i2pd.service
sudo systemctl enable sshd.service
sudo systemctl enable ufw.service
sudo systemctl enable tor.service
sudo systemctl enable privoxy.service
sudo systemctl disable mpd.service
sudo systemctl enable gpm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable ModemManager.service
sudo systemctl enable httpd.service
sudo systemctl --user enable --now pipewire.service pipewire.socket pipewire-pulse.service wireplumber.service