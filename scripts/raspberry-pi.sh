#!/bin/bash

# Raspberry Pi
# OS: Manjaro arm64
# URL: https://raw.githubusercontent.com/bogachenko/lib/master/scripts/raspberry-pi.sh

TELLUSER='echo $USER'
echo 'Hello, $USER'

# Getting root permission.
su

# Installing Russian localization for the system.
cat > /etc/vconsole.conf <<EOF
FONT=cyr-sun16
KEYMAP=ru
EOF
cat > /etc/locale.gen <<EOF
ru_RU.UTF-8 UTF-8
en_US.UTF-8 UTF-8
EOF
locale-gen
setfont cyr-sun16
localectl set-locale LANG="ru_RU.UTF-8"

# Choosing fast mirrors for Pacman.
cat > /etc/pacman.d/mirrorlist <<EOF
Server = http://mirrors.colocall.net/manjaro/arm-stable/$repo/$arch
Server = https://mirror.yandex.ru/mirrors/manjaro/arm-stable/$repo/$arch
Server = https://mirror.truenetwork.ru/manjaro/arm-stable/$repo/$arch
Server = https://fastmirror.pp.ua/manjaro/arm-stable/$repo/$arch
EOF

# Updating repository data and installing updates.
pacman -Syyuu

# Installing main packages.
pacman -S --needed git vim htop zip unzip unarj neofetch hostapd dnsmasq net-tools tor privoxy cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-croscore ttf-dejavu ttf-bitstream-vera netctl gparted p7zip unrar openresolv xorg-drivers ranger code firefox-i18n-ru firefox jack2 noto-fonts noto-fonts-emoji gnome

# Exiting superuser mode.
exit

# Installing yaourt.
cd /tmp
git clone https://aur.archlinux.org/package-query.git
cd package-query/
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si
cd ..
sudo rm -dR yaourt/ package-query/

# Installing main packages from yaourt repository 
yaourt -S ttf-ms-fonts

# Downloading and installing Adguard Home.
curl -sSL https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh
clear

# Convert SOCKS to HTTP proxy via Privoxy.
sudo cat > /etc/privoxy/config <<EOF
forward-socks5 / localhost:9050 .
forward-socks4 / localhost:9050 .
forward-socks4a / localhost:9050 .
EOF

# Enabling daemons and starting them for my main packages.
sudo systemctl enable tor.service && sudo systemctl start tor.service
sudo systemctl enable privoxy.service && sudo systemctl start privoxy.service
sudo systemctl enable sshd.service && sudo systemctl start sshd.service
sudo systemctl enable gpm.service && sudo systemctl start gpm.service
sudo systemctl enable hostapd.service && sudo systemctl start hostapd.service
sudo systemctl enable dnsmasq.service && sudo systemctl start dnsmasq.service

# Fill in the information for GECOS.
sudo chfn ${TELLUSER}

# Automatic login.
sudo cat > /etc/gdm/custom.conf <<EOF
# Enable automatic login for user
[daemon]
AutomaticLogin=${TELLUSER}
AutomaticLoginEnable=True
EOF

# Setting up the configuration for my VIM
cat > ~/.vimrc <<EOF
set number
syntax on
set noswapfile
set wrap
set ttyfast
set encoding=utf8
EOF

# Clear the console.
clear

# Change hostname.
sudo hostnamectl set-hostname localhost
sudo cat > /etc/hosts <<EOF
0.0.0.0 0.0.0.0
127.0.0.1 local
127.0.0.1 localhost
127.0.0.1 localhost.localdomain
255.255.255.255 broadcasthost
::1 ip6-localhost
::1 ip6-loopback
::1 localhost
fe80::1%lo0 localhost
ff00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts

192.168.0.104	localhost
192.168.0.105	localhost
EOF

sleep .5
