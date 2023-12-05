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
sudo apt install --no-install-recommends --no-install-suggests vim git pwgen wireplumber pipewire pipewire-jack pipewire-alsa pipewire-pulse alsa-utils ffmpeg mpd ranger zip unrar p7zip unzip wget curl lshw dnsmasq hostapd tor nyx torsocks obfs4proxy privoxy fonts-ubuntu fonts-noto-color-emoji fonts-noto-mono fonts-noto fonts-liberation fonts-dejavu
echo 'Installing the extra packages.'
sudo apt install --no-install-recommends --no-install-suggests firefox chromium plymouth vlc rofi i3 i3lock gvfs lightdm dunst scrot rxvt-unicode gimp libgtk-3-0 libgtk-4-1 libgtk2.0-0 speedtest-cli cups bluez-cups system-config-printer

echo 'Settings for Internet parameters.'
sudo mkdir -p /etc/systemd/resolved.conf.d
sudo bash -c 'cat > /etc/systemd/resolved.conf.d/adguardhome.conf <<EOF
[Resolve]
DNS=127.0.0.1
DNSStubListener=no
EOF'
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
sudo ufw allow 546/udp
sudo ufw allow 547/udp
sudo ufw allow 123/udp
sudo ufw allow 9050
sudo ufw allow 5355
sudo ufw allow 853
sudo ufw allow 443
sudo ufw allow 80
sudo ufw allow 53
sudo ufw allow 5353
sudo ufw allow 8118
sudo ufw enable

echo 'Settings for configuration files.'
sudo cp /etc/tor/torrc{,.backup}
mkdir -p '/home/username/.config/{i3,i3status,dunst}'
mkdir -p '/home/username/.config/gtk-{3.0,4.0}'
curl -o ~/.Xresources https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/Xresources
curl -o ~/.config/i3status/config https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/i3status
curl -o ~/.config/i3/config https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/i3config
curl -o ~/.xinitrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/xinitrc
curl -o ~/.vimrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/vimrc
curl -o ~/.zshrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/zshrc
curl -o ~/.gtkrc-2.0 https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/gtkrc2
curl -o ~/.config/gtk-3.0/settings.ini https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/gtkrc3
curl -o ~/.config/gtk-4.0/settings.ini https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/gtkrc4
curl -o ~/.torrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/torrc
sudo sh -c "echo \"forward-socks5 / localhost:9050 .\" >> /etc/privoxy/config"
sudo sh -c "echo \"forward-socks4 / localhost:9050 .\" >> /etc/privoxy/config"
sudo sh -c "echo \"forward-socks4a / localhost:9050 .\" >> /etc/privoxy/config"
sudo cp ~/.Xresources /root/.Xresources
sudo cp ~/.zshrc /root/.zshrc
sudo cp ~/.vimrc /root/.vimrc
sudo cp ~.torrc /etc/tor/torrc
sudo ln -sf ~/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
sudo ln -sf ~/.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini
sudo ln -sf ~/.config/gtk-4.0/settings.ini /etc/gtk-4.0/settings.ini
sudo sed -i 's/PROMPT=\"%F{34}%n%f%F{34}@%f%F{34}%m%f:%F{21}%~%f$ \"/PROMPT=\"%F{9}%n%f%F{9}@%f%F{9}%m%f:%F{21}%~%f# \"/g' /root/.zshrc
sudo cp /etc/locale.gen /etc/locale.gen.backup;sudo sh -c "echo \"en_US.UTF-8 UTF-8\" > /etc/locale.gen";sudo locale-gen
