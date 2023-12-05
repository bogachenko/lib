#!/bin/bash

# Raspberry Pi aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

echo 'Updating the package list.'
sudo apt update; sudo apt upgrade

echo 'Removing garbage packages after updating packages.'
sudo apt autoremove

echo 'Installing the core packages.'
sudo apt install --no-install-recommends --no-install-suggests openssh-server xserver-xorg x11-utils x11-xserver-utils xfonts-base xterm console-cyrillic htop python3 python3-pip xinit mesa-utils zsh ufw net-tools dialog ifplugd netctl perl ruby php gpm apache2 apparmor xdg-utils xss-lock systemd-resolved
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
echo 'Installing the sub-core packages.'
sudo apt install --no-install-recommends --no-install-suggests vim git pwgen wireplumber pipewire pipewire-jack pipewire-alsa pipewire-pulse alsa-utils ffmpeg mpd ranger zip unrar p7zip unzip wget lshw dnsmasq hostapd tor nyx torsocks obfs4proxy privoxy fonts-ubuntu fonts-noto-color-emoji fonts-noto-mono fonts-noto fonts-liberation fonts-dejavu
echo 'Installing the extra packages.'
sudo apt install --no-install-recommends --no-install-suggests firefox chromium plymouth vlc rofi i3 i3lock gvfs lightdm dunst scrot rxvt-unicode gimp libgtk-3-0 libgtk-4-1 libgtk2.0-0 speedtest-cli cups bluez-cups system-config-printer

echo ''
sudo mkdir -p /etc/systemd/resolved.conf.d
cat > /etc/systemd/resolved.conf.d/adguardhome.conf <<EOF
[Resolve]
DNS=127.0.0.1
DNSStubListener=no
EOF
sudo mv /etc/resolv.conf /etc/resolv.conf.backup
sudo sed -i 's/#DNS=/DNS=1.1.1.1 1.0.0.1/g' /etc/systemd/resolved.conf
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo systemctl restart systemd-resolved.service

echo 'Enabling and running services.'
#sudo systemctl enable dnsmasq.service
#sudo systemctl enable hostapd.service
#sudo systemctl enable apparmor.service
sudo systemctl enable ssh.service
sudo systemctl enable ufw.service
sudo systemctl enable tor.service
sudo systemctl enable privoxy.service
sudo systemctl enable mpd.service
sudo systemctl enable gpm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable lightdm.service
sudo systemctl enable ifplugd.service
sudo systemctl enable apache2
sudo raspi-config

echo 'Enabling the Z shell by default.'
sudo chsh -s /bin/zsh root
sudo chsh -s /bin/zsh username

echo 'Enabling firewall rules.'
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 21/tcp
sudo ufw allow 631/tcp
sudo ufw allow 3000/tcp
sudo ufw allow 67/udp
sudo ufw allow 68/udp
sudo ufw allow 9050
sudo ufw allow 5355
sudo ufw allow 853
sudo ufw allow 443
sudo ufw allow 80
sudo ufw allow 53
sudo ufw allow 8118
sudo ufw enable

echo ''
sudo sh -c "echo \"forward-socks5 / localhost:9050 .\" >> /etc/privoxy/config"
sudo sh -c "echo \"forward-socks4 / localhost:9050 .\" >> /etc/privoxy/config"
sudo sh -c "echo \"forward-socks4a / localhost:9050 .\" >> /etc/privoxy/config"
sudo systemctl restart privoxy.service

curl -o ~/.Xresources https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-aarch64/Xresources