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

# Refresh mirrors for Pacman.
pacman-mirrors

# Updating repository data and installing updates.
pacman -Syyuu

# Installing main packages.
pacman -S --needed zsh git vim htop neofetch net-tools tor privoxy cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-dejavu ttf-liberation netctl gparted openresolv xorg-drivers xorg-server ranger code firefox-i18n-ru firefox xorg-xinit jack2 noto-fonts noto-fonts-emoji modemmanager usb_modeswitch crda sddm dmenu i3-wm scrot xorg-xsetroot i3status gvfs dhclient nm-connection-editor alsa-plugins alsa-utils pulseaudio nyx vlc noto-fonts-cjk xorg-xrdb speedtest-cli xdg-user-dirs atril gtk2 gtk3 gtk4 networkmanager dhcpcd xdg-utils xautolock pavucontrol hostapd xorg-apps dnsmasq rxvt-unicode unzip i3lock ppp bluez bluez-untils ttf-fira-code ttf-fira-mono mathjax youtube-dl thunderbird qmmp pcmanfm-qt

# Automatic login.
cat > /etc/sddm.conf <<EOF
[Autologin]
User=${TELLUSER}
Session=i3.desktop
EOF

# Convert SOCKS to HTTP proxy via Privoxy.
echo "forward-socks5 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4a / localhost:9050 ." >> /etc/privoxy/config

# Change the shell.
chsh -s /bin/zsh ${TELLUSER}
chsh -s /bin/zsh root

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
Xft.hintstyle: hintfull
Xft.lcdfilter: lcddefault

URxvt.iso14755: false
URxvt.iso14755_52: false
URxvt.clipboard.autocopy: true
URxvt.keysym.Shift-Control-V: eval:paste_clipboard
URxvt.keysym.Shift-Control-C: eval:selection_to_clipboard
URxvt.scrollBar: false
URxvt.background: #000000
URxvt.foreground: #ffffff
URxvt.font: xft:Fira Mono:regular:size=10
URxvt.boldFont: xft:Fira Mono:bold:size=10
URxvt.italicFont: xft:Fira Mono:italic:size=10
URxvt.boldItalicFont: xft:Fira Mono:bold:italic:size=10
URxvt.geometry: 150x30
URxvt.scrollTtyOutput: false
URxvt.cursorBlink: true
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
yaourt -S windows8-cursor

# Installing my user.js file in Firefox.
cd /tmp
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/firefox-user.js
mv /tmp/user.js ~/.mozilla/firefox/${TELLUSER}/user.js

# Downloading and installing Adguard Home.
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

# Enabling daemons and starting them for my main packages.
sudo systemctl enable tor.service && sudo systemctl start tor.service
sudo systemctl enable privoxy.service && sudo systemctl start privoxy.service
sudo systemctl enable sshd.service && sudo systemctl start sshd.service
sudo systemctl enable gpm.service && sudo systemctl start gpm.service
sudo systemctl enable NetworkManager.service && sudo systemctl start NetworkManager.service
sudo systemctl enable ModemManager.service && sudo systemctl start ModemManager.service
sudo systemctl enable sddm.service && sudo systemctl start sddm.service
sudo systemctl enable dhcpcd.service && sudo systemctl start dhcpcd.service
#sudo systemctl enable hostapd.service && sudo systemctl start hostapd.service
#sudo systemctl enable dnsmasq.service && sudo systemctl start dnsmasq.service
sudo systemctl enable bluetooth.service && sudo systemctl start bluetooth.service

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
Inherits=Windows8-cursor
EOF
sudo cat > /usr/share/icons/default/index.theme <<EOF
[Icon Theme] 
Inherits=Windows8-cursor
EOF

# ZSH Generator.
cat > ~/.zshrc <<EOF
PROMPT="%n%F{10}$%f "
RPROMPT="%d"
EOF
sudo cat > /root/.zshrc <<EOF
PROMPT="%n%F{9}$%f "
RPROMPT="%d"
EOF

# Removing debris.
sudo rm -rf /root/.bash_history /root/.bashrc

# Clear the console.
clear
