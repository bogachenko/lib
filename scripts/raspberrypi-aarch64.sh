#!/bin/bash

# Raspberry Pi aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
# https://raw.githubusercontent.com/bogachenko/lib/master/scripts/raspberrypi-aarch64.sh

echo 'Updating the package list.'
sudo apt update;sudo apt upgrade

echo 'Installing the core packages.'
sudo apt install --no-install-recommends --no-install-suggests --yes openssh-server xorg xserver-xorg x11-utils x11-xserver-utils xfonts-base xterm console-cyrillic htop python3 python3-pip xinit mesa-utils zsh ufw net-tools gawk dialog ifplugd netctl perl ruby php gpm apache2 apparmor xdg-utils xss-lock libnotify-bin cmake plymouth xdg-desktop-portal xdg-user-dirs e2fsprogs xfsprogs reiserfsprogs fatresize dosfstools udftools f2fs-tools exfatprogs jfsutils nilfs-tools ntfs-3g ca-certificates ssl-cert iptables iw vim git pwgen wget curl lshw bind9 dnsmasq hostapd encfs cryfs whois dnsutils ntp
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
echo 'Installing the sub-core packages.'
sudo apt install --no-install-recommends --no-install-suggests --yes wireplumber pipewire pipewire-jack pipewire-alsa pipewire-pulse alsa-utils pipewire-audio-client-libraries ffmpeg mpd ranger zip unrar p7zip unzip lzop zstd lz4 lrzip arj bzip2 xz-utils i2pd nyx tor obfs4proxy privoxy fonts-ubuntu fonts-noto-color-emoji fonts-noto-mono fonts-noto fonts-liberation fonts-dejavu
echo 'Installing the extra packages.'
sudo apt install --no-install-recommends --no-install-suggests --yes lynx chromium vlc dmz-cursor-theme sddm i3 i3lock gvfs rofi dunst scrot rxvt-unicode speedtest-cli retroarch yt-dlp code qbittorrent transmission-cli systemd-resolved usb-modeswitch modemmanager network-manager ppp wireshark

echo 'Enabling services.'
sudo systemctl restart systemd-resolved.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable ModemManager.service
sudo systemctl enable apparmor.service
sudo systemctl enable i2pd.service
sudo systemctl enable ntpd.service
sudo systemctl enable ssh.service
sudo systemctl enable ufw.service
sudo systemctl enable tor.service
sudo systemctl enable privoxy.service
sudo systemctl enable gpm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable ifplugd.service
sudo systemctl enable apache2.service
sudo systemctl enable sddm.service;sudo dpkg-reconfigure sddm
systemctl --user enable --now pipewire.socket;systemctl --user enable --now pipewire-pulse.socket;systemctl --user enable --now wireplumber.service
sudo /opt/AdGuardHome/AdGuardHome -s stop
sudo systemctl disable dnsmasq.service
sudo systemctl disable hostapd.service
sudo systemctl disable bind9.service
sudo systemctl disable named.service
sudo systemctl disable mpd.service

echo 'Enabling firewall rules.'
sudo rm -r /etc/ufw/applications.d/*
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 123/udp          # Network Time Protocol
sudo ufw allow 22/tcp           # SSH
sudo ufw allow 443              # HTTPS/DNSCrypt
sudo ufw allow 465              # SMTP
sudo ufw allow 53               # DNS
sudo ufw allow 5353             # mDNS
sudo ufw allow 5355             # LLMNR
sudo ufw allow 5443             # DNSCrypt old
sudo ufw allow 631/tcp          # Internet Printing Protocol
sudo ufw allow 67/udp           # DHCP server v4
sudo ufw allow 68/udp           # DHCP client v4
sudo ufw allow 546/udp          # DHCP client v6
sudo ufw allow 547/udp          # DHCP server v6
sudo ufw allow 80               # HTTP
sudo ufw allow 8080             # HTTP alternative - AdGuard Home
sudo ufw allow 8081             # HTTP alternative - AdGuard Home control panel
sudo ufw allow 8082             # Apache
sudo ufw allow 8118/tcp         # Privoxy
sudo ufw allow 853              # DoT/DoQ
sudo ufw allow 9050/tcp         # TOR
sudo ufw allow 993              # IMAPS
sudo ufw allow 4444/tcp         # i2p HTTP Proxy
sudo ufw allow 4445/tcp         # i2p HTTPS Proxy
sudo ufw allow 4447/tcp         # i2p Socks Proxy
sudo ufw enable

echo 'Settings for configuration files.'
# Configuring Internet files
echo -e "nameserver 1.1.1.1\nnameserver 1.0.0.1" | sudo tee -a /etc/resolv.conf;sudo sed -i 's/#DNS=/DNS=1.1.1.1 1.0.0.1/g' /etc/systemd/resolved.conf;sudo sed -i 's/#DNSSEC=no/DNSSEC=yes/g' /etc/systemd/resolved.conf;sudo sed -i 's/#DNSOverTLS=no/DNSOverTLS=yes/g' /etc/systemd/resolved.conf;sudo sed -i 's/#MulticastDNS=yes/MulticastDNS=yes/g' /etc/systemd/resolved.conf;sudo sed -i 's/#LLMNR=yes/LLMNR=yes/g' /etc/systemd/resolved.conf
sudo mkdir -p /etc/systemd/resolved.conf.d;curl -o ~/adguardhome-resolved https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/adguardhome-resolved;sudo mv ~/adguardhome-resolved /etc/systemd/resolved.conf.d/adguardhome.conf;sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo sh -c "echo \"1\" > /proc/sys/net/ipv4/ip_forward";sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf;sudo sh -c "echo \"1\" > /proc/sys/net/ipv6/conf/all/forwarding";sudo sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
# Configuring Local DNS Server files
curl -o ~/adguardhome.cfg https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/adguardhome;sudo mv ~/adguardhome.cfg /opt/AdGuardHome/AdGuardHome.yaml
curl -o ~/bindnamedconfoptions https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/bindnamedconfoptions;sudo mv ~/bindnamedconfoptions /etc/bind/named.conf.options
# Configuring TOR files
sudo mv /etc/tor/torrc{,.backup}
curl -o ~/.torrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/torrc;sudo mv ~/.torrc /etc/tor/torrc
sudo chown username:debian-tor /run/tor/control.authcookie;sudo chown username:debian-tor /var/run/tor/control.authcookie
# Configuring Privoxy files
sudo sh -c "echo \"forward-socks5 / localhost:9050 .\" >> /etc/privoxy/config";sudo sh -c "echo \"forward-socks4 / localhost:9050 .\" >> /etc/privoxy/config";sudo sh -c "echo \"forward-socks4a / localhost:9050 .\" >> /etc/privoxy/config";sudo sh -c "echo \"forward .i2p localhost:4444\" >> /etc/privoxy/config"
# Configuring i2pd files
curl -o ~/i2pdconf https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/i2pdconf;sudo mv ~/i2pdconf /etc/i2pd/i2pd.conf
# Configuring hostname
sudo hostnamectl set-hostname 'localhost'
# Configuring GTK files
sudo mkdir -p /etc/gtk-{2.0,3.0,4.0};mkdir -p ~/.config/gtk-{3.0,4.0}
curl -o ~/.gtkrc-2.0 https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/gtkrc2;sudo cp ~/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
curl -o ~/.config/gtk-3.0/settings.ini https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/gtkrc3;sudo cp ~/.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini
curl -o ~/.config/gtk-4.0/settings.ini https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/gtkrc4;sudo cp ~/.config/gtk-4.0/settings.ini /etc/gtk-4.0/settings.ini
sudo ln -sf ~/.gtkrc-2.0 /etc/gtk-2.0/gtkrc;sudo ln -sf ~/.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini;sudo ln -sf ~/.config/gtk-4.0/settings.ini /etc/gtk-4.0/settings.ini
# Configuring localization files
sudo mv /etc/locale.gen{,.backup};sudo sh -c "echo \"en_US.UTF-8 UTF-8\" > /etc/locale.gen";sudo locale-gen >> /dev/null;sudo sh -c "echo \"en_US.UTF-8 UTF-8\" > /etc/default/locale"
# Configuring i3wm files
mkdir -p ~/.config/i3status;curl -o ~/.config/i3status/config https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/i3status
mkdir -p ~/.config/i3;curl -o ~/.config/i3/config https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/i3config
# Configuring X files
curl -o ~/.xinitrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/xinitrc
curl -o ~/.Xresources https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/Xresources;sudo cp ~/.Xresources /root/.Xresources
xdg-user-dirs-update;sudo xdg-user-dirs-update
# Configuring Vim files
curl -o ~/.vimrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/vimrc;sudo cp ~/.vimrc /root/.vimrc
# Configuring Zsh files
sudo chsh -s /bin/zsh root;sudo chsh -s /bin/zsh username;curl -o ~/.zshrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/zshrc;sudo cp ~/.zshrc /root/.zshrc;sudo sed -i 's/PROMPT=\"%F{34}%n%f%F{34}@%f%F{34}%m%f:%F{21}%~%f$ \"/PROMPT=\"%F{9}%n%f%F{9}@%f%F{9}%m%f:%F{21}%~%f# \"/g' /root/.zshrc
# Configuring Dunst files
mkdir -p ~/.config/dunst;curl -o ~/.config/dunst/config https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/dunst
# Configuring theme files
mkdir -p ~/.icons/default;curl -o ~/.icons/default/index.theme https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/cursortheme;sudo cp ~/.icons/default/index.theme /usr/share/icons/default/index.theme
# Configuring Apache HTTP Server files
sudo sed -i 's/Listen 80/Listen 8082/g' /etc/apache2/ports.conf
# Configuring APT files
curl -o ~/00-apt-conf https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/00-apt-conf;sudo mv ~/00-apt-conf /etc/apt/apt.conf.d/00-apt-conf
# Configuring DM files
sudo rm /etc/systemd/system/display-manager.service;sudo ln -s /lib/systemd/system/sddm.service /etc/systemd/system/display-manager.service

echo 'Reboot the system'
sudo reboot -f