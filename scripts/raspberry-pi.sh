#!/bin/bash

# Raspberry Pi
# Manjaro ARM Linux aarch64

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
EOF

# Updating repository data and installing updates.
pacman -Syyuu

# Installing main packages.
pacman -S --needed git vim htop zip unzip unarj neofetch hostapd dnsmasq net-tools tor privoxy cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-croscore ttf-dejavu ttf-bitstream-vera netctl gparted p7zip unrar openresolv xorg-drivers ranger code firefox-i18n-ru firefox jack2 noto-fonts noto-fonts-emoji modemmanager usb_modeswitch crda sddm dmenu i3-wm scrot xorg-xsetroot qterminal pcmanfm-qt i3status gvfs dhclient nm-connection-editor alsa-plugins alsa-utils pulseaudio nyx gpicview xarchiver vlc qbittorrent noto-fonts-cjk xorg-xrdb speedtest-cli uget xdg-user-dirs atril gtk2 gtk3 gtk4

# Automatic login.
cat > /etc/sddm.conf <<EOF
[Autologin]
User=${TELLUSER}
Session=i3.desktop
EOF

# Exiting superuser mode.
exit

# Create user directories.
xdg-user-dirs-update

# Configuring the Xresources file.
cat > ~/.Xresources <<EOF
Xft.dpi: 96
Xft.antialias: true
Xft.hinting: true
Xft.rgba: rgb
Xft.autohint: false
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault
EOF
xrdb -merge ~/.Xresources

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
yaourt -S ttf-ms-win10 windows8-cursor gksu

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
sudo systemctl enable NetworkManager.service && sudo systemctl start NetworkManager.service
sudo systemctl enable ModemManager.service && sudo systemctl start ModemManager.service
sudo systemctl enable sddm.service && sudo systemctl start sddm.service

# Fill in the information for GECOS.
sudo chfn ${TELLUSER}

# Setting up the configuration for my VIM
cat > ~/.vimrc <<EOF
set number
syntax on
set noswapfile
set wrap
set ttyfast
set encoding=utf8
EOF

# Setting the Windows 8 cursor by default.
mkdir -p -v ~/.icons/default
cat > ~/.icons/default/index.theme <<EOF
[icon theme] 
Inherits=Windows8-cursor
EOF
sudo cat > /usr/share/icons/default/index.theme <<EOF
[icon theme] 
Inherits=Windows8-cursor
EOF

# Clear the console.
clear
