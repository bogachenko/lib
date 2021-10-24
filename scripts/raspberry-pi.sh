#!/bin/bash

# Raspberry Pi
# Manjaro ARM Linux aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

USERNAME=$(whoami)
LLHT='localhost'
PASSWD='N7GZiMD!2ZTaZWYj0mLV'
UA='Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'
FONT='Noto Sans'
FONTM='Noto Sans Mono'
FONTMM='Noto Sans Medium'

# Clear the console.
clear

# Installing the Arch User Repository.
cd /tmp
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query/
makepkg -si
cd ..
cd yaourt/
makepkg -si

# Installing the BlackArch repository.
cd /tmp
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

# Installing updates and updating the data repositories.
yaourt -Syua
sudo pacman -Syyuu

# Installing main packages from the Arch User Repository.
yaourt -S peerflix xcursor-we10xos

# Sorting mirrors for the pacman package manager.
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo pacman-mirrors --fasttrack && sudo pacman -Syyu

# Installing core packages.
sudo pacman -S --needed --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa-libgl xterm xf86-video-nouveau xorg-drivers xorg-xrdb xorg-xclock xorg-xsetroot xorg-xmodmap zsh git vim htop net-tools tor privoxy cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-dejavu ttf-liberation netctl gparted openresolv xorg-drivers code firefox-i18n-ru firefox jack2 noto-fonts noto-fonts-emoji noto-fonts-cjk sddm dmenu i3-wm scrot xorg-xsetroot i3status gvfs dhclient alsa-plugins alsa-utils pulseaudio nyx vlc speedtest-cli xdg-user-dirs gtk2 gtk3 gtk4 dhcpcd xdg-utils xautolock hostapd dnsmasq rxvt-unicode unzip i3lock ppp bluez bluez-utils mathjax youtube-dl pcmanfm-qt python2 python ttf-carlito ttf-caladea ttf-croscore ttf-opensans libevent perl xorg-xclock xorg-xmodmap npm nodejs terminus-font mesa mesa-demos qt5ct pwgen dunst breeze-icons chromium yajl zip unrar p7zip bzip2 lrzip lz4 lzop xz zstd arj lhasa lxqt-archiver pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-alsa qt6-base qt5-base php ffmpeg glu freeglut glew glslang libxcb jre-openjdk-headless jre-openjdk jdk-openjdk qt6ct desktop-file-utils

# Getting root permissions.
su

# Change the shell.
chsh -s /bin/zsh $USERNAME
chsh -s /bin/zsh root

# Russification of the system.
cat > /etc/vconsole.conf <<EOF
FONT=ter-k16n
KEYMAP=ru
EOF
cat > /etc/locale.gen <<EOF
ru_RU.UTF-8 UTF-8
en_US.UTF-8 UTF-8
EOF
locale-gen
setfont ter-k16n
localectl set-locale LANG="ru_RU.UTF-8"
cat > /etc/X11/xorg.conf.d/00-keyboard.conf <<EOF
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,ru"
        Option "XkbModel" "pc105"
        Option "XkbVariant" ""
        Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
EOF

# Setting a parameter for QT.
cat > /etc/environment <<EOF
QT_QPA_PLATFORMTHEME="qt5ct"
EOF

# Configuring configuration files for GTK themes.
cat > /usr/share/gtk-2.0/gtkrc <<EOF
gtk-icon-theme-name="Breeze"
gtk-theme-name="Adwaita"
gtk-cursor-theme-name="We10XOS-cursors"
gtk-font-name="$FONT 9"
gtk-menu-images=0
gtk-button-images=0
gtk-enable-event-sounds=0
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintslight"
gtk-xft-rgba="rgb"
EOF
cat > /usr/share/gtk-3.0/settings.ini <<EOF
[Settings]
gtk-icon-theme-name=Breeze
gtk-theme-name=Adwaita
gtk-cursor-theme-name=We10XOS-cursors
gtk-font-name=$FONT 9
gtk-menu-images=0
gtk-button-images=0
gtk-enable-event-sounds=0
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
EOF
cat > /usr/share/gtk-4.0/settings.ini <<EOF
[Settings]
gtk-icon-theme-name=Breeze
gtk-theme-name=Adwaita
gtk-cursor-theme-name=We10XOS-cursors
gtk-font-name=$FONT 9
gtk-menu-images=0
gtk-button-images=0
gtk-enable-event-sounds=0
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
EOF
mkdir -p ~/.config/gtk-{3.0,4.0}/
chown $USERNAME:$USERNAME ~/.config/gtk-{3.0,4.0}/
cp /usr/share/gtk-2.0/gtkrc ~/.gtkrc-2.0
cp /usr/share/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp /usr/share/gtk-4.0/settings.ini ~/.config/gtk-4.0/settings.ini

# Automatic login to the system.
cat > /etc/sddm.conf <<EOF
[Autologin]
User=$USERNAME
Session=i3.desktop
EOF

# Setting the Windows 10 cursor by default.
cat > /usr/share/icons/default/index.theme <<EOF
[Icon Theme] 
Inherits=We10XOS-cursors
EOF

# Convert SOCKS to HTTP proxy via Privoxy.
echo "forward-socks5 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4a / localhost:9050 ." >> /etc/privoxy/config

# Wi-Fi hotspot.
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.backup
mv /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf.backup
systemctl stop hostapd.service
systemctl stop dnsmasq.service
cat > /etc/dnsmasq.conf <<EOF
port=5353
interface=wlan0
bind-interfaces
dhcp-option=3,10.0.0.1
dhcp-option=6,10.0.0.1
dhcp-range=10.0.0.2,10.0.0.10,255.255.255.0,12h
no-hosts
no-resolv
log-queries
log-facility=/tmp/dnsmasq.log
server=1.1.1.1
server=1.0.0.1
EOF
cat > /etc/hostapd/hostapd.conf <<EOF
ctrl_interface=/run/hostapd
interface=wlan0
ssid=$USERNAME
ignore_broadcast_ssid=0
driver=nl80211
channel=11
hw_mode=g
ieee80211d=1
ieee80211n=1
country_code=RU
macaddr_acl=0
deny_mac_file=/etc/hostapd/hostapd.deny
wmm_enabled=0
auth_algs=1
wpa=2
wpa_key_mgmt=WPA-PSK  
rsn_pairwise=CCMP
wpa_passphrase=$PASSWD
EOF
cat > /usr/bin/autohotspot <<EOF
#!/bin/bash

wifiap()
{
ip link set dev wlan0 down
ip addr add 10.0.0.1/24 dev wlan0
ip link set dev wlan0 up
dhcpcd -k wlan0 >/dev/null 2>&1
iptables -A FORWARD -i eth0 -o wlan0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
systemctl start dnsmasq
systemctl start hostapd
echo 1 > /proc/sys/net/ipv4/ip_forward
}
killwifiap()
{
ip link set dev wlan0 down
systemctl stop hostapd
systemctl stop dnsmasq
iptables -D FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -D FORWARD -i wlan0 -o eth0 -j ACCEPT
echo 0 > /proc/sys/net/ipv4/ip_forward
ip addr flush dev wlan0
ip link set dev wlan0 up
dhcpcd  -n wlan0 >/dev/null 2>&1
}
EOF
chmod +x /usr/bin/autohotspot
echo "nohook wpa_supplicant" >> /etc/dhcpcd.conf
cat > /etc/systemd/system/autohotspot.service <<EOF
[Unit]
Description=Automatically generates a Hotspot when a valid SSID is in range
After=multi-user.target
[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/autohotspot
[Install]
WantedBy=multi-user.target
EOF

# Exiting superuser mode.
exit

# Enabling daemons.
sudo systemctl enable tor.service && sudo systemctl start tor.service
sudo systemctl enable privoxy.service && sudo systemctl start privoxy.service
sudo systemctl enable sshd.service && sudo systemctl start sshd.service
sudo systemctl enable gpm.service && sudo systemctl start gpm.service
sudo systemctl enable sddm.service && sudo systemctl start sddm.service
sudo systemctl enable dhcpcd.service && sudo systemctl start dhcpcd.service
sudo systemctl enable hostapd.service && sudo systemctl start hostapd.service
sudo systemctl enable dnsmasq.service && sudo systemctl start dnsmasq.service
sudo systemctl enable bluetooth.service && sudo systemctl start bluetooth.service
sudo systemctl enable autohotspot.service
pulseaudio -k && pulseaudio --start

# Starting the NTP service.
sudo timedatectl set-ntp true

# Create user directories.
xdg-user-dirs-update

# Configuring the Xresources file.
cat > ~/.Xresources <<EOF
Xft.dpi: 96
Xft.antialias: 1
Xft.hinting: 1
Xft.rgba: rgb
Xft.autohint: 0
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault

URxvt.iso14755: false
URxvt.iso14755_52: false
URxvt.clipboard.autocopy: true
URxvt.keysym.Shift-Control-V: eval:paste_clipboard
URxvt.keysym.Shift-Control-C: eval:selection_to_clipboard
URxvt.scrollBar: false
URxvt.background: #000000
URxvt.foreground: #ffffff
URxvt.font: xft:$FONTM:regular:size=9
URxvt.boldFont: xft:$FONTM:bold:size=9
URxvt.italicFont: xft:$FONTM:italic:size=9
URxvt.boldItalicFont: xft:$FONTM:bold:italic:size=9
URxvt.geometry: 150x30
URxvt.scrollTtyOutput: false
URxvt.cursorBlink: true
EOF
xrdb -merge ~/.Xresources

# Installing the configuration file user.js for Firefox.
cd /tmp
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/firefox-user.js
mv /tmp/user.js ~/.mozilla/firefox/$USERNAME/user.js

# Downloading and installing Adguard Home.
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

# Fill in the information for GECOS.
sudo chfn $USERNAME

# Configuring i3wm and i3status.
mkdir -p ~/.config/i3status
cd ~/.config/i3status
curl -o config https://gist.githubusercontent.com/bogachenko/599361c72df40d9ef4fa6cb8f3b6b82f/raw/b7964a856bf2dba10474e8423a8142104c6b3eb5/i3status
cd ~/.config/i3
curl -o config https://gist.githubusercontent.com/bogachenko/599361c72df40d9ef4fa6cb8f3b6b82f/raw/b7964a856bf2dba10474e8423a8142104c6b3eb5/i3config

# Configuration for the Vim program.
cat > ~/.vimrc <<EOF
set number
syntax on
set noswapfile
set wrap
set ttyfast
set encoding=utf8
EOF
sudo cp ~/.vimrc /root/.vimrc

# Configuration for the Z shell.
cd /tmp
curl -o zshrc https://gist.githubusercontent.com/bogachenko/05f67ffa8ac6aeeb8f2ba14956d3ad9c/raw/d7e1473de17e0ccdb2cc3889bb5f3e414dcf9fd7/zshrc
mv /tmp/zshrc ~/.zshrc
curl -o zshrc https://gist.githubusercontent.com/bogachenko/05f67ffa8ac6aeeb8f2ba14956d3ad9c/raw/d7e1473de17e0ccdb2cc3889bb5f3e414dcf9fd7/zshrc-root
sudo mv /tmp/zshrc /root/.zshrc

# Removing debris.
sudo rm -rf /root/.bash_history /root/.bashrc /root/.bash_logout /root/.bash_profile /root/.bash_functions /root/.bash_aliases ~/.bashrc ~/.bash_history ~/.bash_logout ~/.cache/thumbnails ~/.bash_profile ~/.bash_functions ~/.bash_aliases /tmp/* ~/.local/share/Trash/*
sudo pacman -Scc
sudo paccache -r

# Clear the console.
clear

# Reboot.
sudo reboot
