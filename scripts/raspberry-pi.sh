#!/bin/bash

# Raspberry Pi
# OS: Manjaro arm64

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

# Updating repository data and installing updates.
pacman -Syu

# Installing main packages.
pacman -S --needed chromium git vim mc htop zip unzip unarj neofetch hostapd dnsmasq net-tools tor privoxy i3-wm i3status sddm dmenu cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-croscore ttf-dejavu ttf-bitstream-vera netctl gparted p7zip unrar xorg-drivers terminator

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
sudo systemctl enable resolvconf.service && sudo systemctl start resolvconf.service
sudo systemctl enable tor.service && sudo systemctl start tor.service
sudo systemctl enable privoxy.service && sudo systemctl start privoxy.service
sudo systemctl enable sshd.service && sudo systemctl start sshd.service
sudo systemctl enable sddm.service && sudo systemctl sddm sshd.service
sudo systemctl enable gpm.service && sudo systemctl start gpm.service

# Fill in the information for GECOS.
sudo chfn ${TELLUSER}

# Automatic login.
sudo cat > /etc/sddm.conf <<EOF
[Autologin]
User=bogachenko
Session=i3.desktop
EOF

# Setting up static DNS (which I gave for the Raspberry Pi in my router settings) for Adguard Home.
#sudo cat > /etc/resolvconf/resolv.conf.d/head <<EOF
#nameserver 192.168.0.104
#nameserver 192.168.0.105
#EOF

# Updating configuration files for DNS and setting it to default on reboot.
#sudo resolvconf --enable-updates
#sudo resolvconf -u
#cat /etc/resolv.conf

sleep .5

# Setting up the configuration for my VIM
cat > ~/.vimrc <<EOF
set number
syntax on
set noswapfile
set wrap
set ttyfast
set encoding=utf8
EOF

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
