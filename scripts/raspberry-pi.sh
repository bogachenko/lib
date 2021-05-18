#!/bin/bash

# Raspberry Pi
# Manjaro ARM Linux aarch64

TELLUSER='echo $USER'
echo 'Hello, $USER'

# Getting root permission.
su

# Refresh mirrors for Pacman.
pacman-mirrors

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
pacman -Syyuu

# Installing main packages.
pacman -S --needed git vim htop zip unzip unarj neofetch hostapd dnsmasq net-tools tor privoxy cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-croscore ttf-dejavu ttf-bitstream-vera netctl gparted p7zip unrar openresolv xorg-drivers ranger code firefox-i18n-ru firefox jack2 noto-fonts noto-fonts-emoji modemmanager usb_modeswitch crda sddm dmenu i3-wm scrot xorg-xsetroot qterminal pcmanfm-qt i3status gvfs dhclient nm-connection-editor alsa-plugins alsa-utils pulseaudio nyx gpicview xarchiver vlc qbittorrent noto-fonts-cjk xorg-xrdb speedtest-cli uget xdg-user-dirs atril gtk2 gtk3 gtk4 networkmanager dhcpcd

# Automatic login.
cat > /etc/sddm.conf <<EOF
[Autologin]
User=${TELLUSER}
Session=i3.desktop
EOF

# Create the WIFI-hotspot.
cat > /etc/NetworkManager/system-connections/linux-wifi-hotspot.nmconnection <<EOF
[connection]
id=linux-wifi-hotspot
uuid=313620c4-59ae-494d-9aa2-16541d1f0be4
type=wifi
interface-name=wlan0
permissions=
timestamp=1621310313
 
[wifi]
band=a
cloned-mac-address=stable
mac-address=E4:5F:01:00:E9:35
mac-address-blacklist=
mode=ap
seen-bssids=FA:A3:DB:BB:0C:44;
ssid=One-Two
 
[wifi-security]
key-mgmt=wpa-psk
psk=Af35k767del37n!
 
[ipv4]
dns-search=
method=shared
 
[ipv6]
addr-gen-mode=stable-privacy
dns-search=
ip6-privacy=0
method=shared
 
[proxy]
EOF

# Convert SOCKS to HTTP proxy via Privoxy.
echo "forward-socks5 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4a / localhost:9050 ." >> /etc/privoxy/config

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
yaourt -S xcursor-hackneyed-light kdesu ttf-ms-fonts

# Downloading and installing Adguard Home.
curl -sSL https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh
clear

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
sudo systemctl enable dhcpcd.service && sudo systemctl start dhcpcd.service

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

# Setting the Hackneyed cursor by default.
mkdir -p -v ~/.icons/default
cat > ~/.icons/default/index.theme <<EOF
[Icon Theme] 
Inherits=Hackneyed
EOF
sudo cat > /usr/share/icons/default/index.theme <<EOF
[Icon Theme] 
Inherits=Hackneyed
EOF

# Clear the console.
clear
