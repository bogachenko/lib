#!/bin/bash

# Raspberry Pi aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

sudo useradd -m -g users -G wheel -s /bin/zsh username

echo 'Обновление списка пакетов'
sudo apt update; sudo apt upgrade

echo 'Удаление мусорных пакетов'
sudo apt autoremove

sudo snap disable firefox
sudo snap remove --purge firefox
sudo add-apt-repository ppa:mozillateam/ppa

echo 'Установка приложений'
sudo apt install --no-install-recommends --no-install-suggests openssh-server xserver-xorg x11-utils x11-xserver-utils xfonts-base xterm console-cyrillic htop python3 python3-pip xinit mesa-utils zsh ufw ntp net-tools perl ruby php gpm apparmor xdg-utils xss-lock
sudo apt install --no-install-recommends --no-install-suggests vim git pipewire pipewire-jack pipewire-alsa pipewire-pulse alsa-utils rofi i3 sddm dunst scrot rxvt-unicode mpd ranger zip unrar p7zip unzip wget lshw
sudo apt install --no-install-recommends --no-install-suggests tor firefox plymouth

echo 'Включение сервисов'
sudo systemctl enable ssh.service
sudo systemctl enable ufw.service
sudo systemctl enable ntpsec.service
sudo systemctl enable tor.service
sudo systemctl enable mpd.service

sudo chsh -s /bin/zsh root
sudo chsh -s /bin/zsh username

echo 'Uncomplicated Firewall Rules'
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 123/udp
sudo ufw allow 22/tcp
sudo ufw allow 21/tcp
sudo ufw allow 5900/tcp
sudo ufw allow 443
sudo ufw allow 80
sudo ufw enable

echo 'AdGuard Home'
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

sudo sed -i -e "s/pool 0.debian.pool.ntp.org/pool 0.ru.pool.ntp.org/g" /etc/ntpsec/ntp.conf
sudo sed -i -e "s/pool 1.debian.pool.ntp.org/pool 1.ru.pool.ntp.org/g" /etc/ntpsec/ntp.conf
sudo sed -i -e "s/pool 2.debian.pool.ntp.org/pool 2.ru.pool.ntp.org/g" /etc/ntpsec/ntp.conf
sudo sed -i -e "s/pool 3.debian.pool.ntp.org/pool 3.ru.pool.ntp.org/g" /etc/ntpsec/ntp.conf
sudo systemctl restart ntpsec.service