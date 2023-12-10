#!/bin/bash

# Raspberry Pi aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
# https://raw.githubusercontent.com/bogachenko/lib/master/scripts/raspberrypi-aarch64.sh

echo 'Updating the package list.'
sudo apt update;sudo apt upgrade

echo 'Removing garbage packages after updating packages.'
sudo apt autoremove

echo 'Updating DNS servers'
echo -e "nameserver 1.1.1.1\nnameserver 1.0.0.1" | sudo tee -a /etc/resolv.conf

echo 'Installing the core packages.'
sudo apt install --no-install-recommends --no-install-suggests --yes openssh-server xorg xserver-xorg x11-utils x11-xserver-utils xfonts-base xterm console-cyrillic htop python3 python3-pip xinit mesa-utils zsh ufw net-tools dialog ifplugd netctl perl ruby php gpm apache2 apparmor xdg-utils xss-lock libnotify-bin systemd-resolved cmake plymouth xdg-desktop-portal xdg-user-dirs e2fsprogs xfsprogs reiserfsprogs fatresize dosfstools udftools f2fs-tools exfatprogs jfsutils nilfs-tools ntfs-3g ca-certificates iptables
echo 'Installing the sub-core packages.'
sudo apt install --no-install-recommends --no-install-suggests --yes vim git pwgen wireplumber pipewire pipewire-jack pipewire-alsa pipewire-pulse alsa-utils pipewire-audio-client-libraries ffmpeg mpd ranger zip unrar p7zip unzip lzop zstd lz4 lrzip arj bzip2 xz-utils wget curl lshw dnsmasq hostapd nyx tor torsocks obfs4proxy proxychains privoxy fonts-ubuntu fonts-noto-color-emoji fonts-noto-mono fonts-noto fonts-liberation fonts-dejavu
echo 'Installing the extra packages.'
sudo apt install --no-install-recommends --no-install-suggests --yes firefox thunderbird chromium vlc mousepad libxfce4ui-utils thunar xfce4-appfinder xfce4-panel xfce4-session xfce4-settings xfconf xfdesktop4 xfwm4 xfce4-power-manager xfce4-screenshooter xfce4-taskmanager xfce4-xkb-plugin dmz-cursor-theme i3 i3lock gvfs sddm rofi dunst scrot rxvt-unicode gimp speedtest-cli cups bluez-cups cups-pdf cups-filters system-config-printer retroarch hunspell hunspell-ru hyphen-en-us libreoffice yt-dlp code qbittorrent

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
sudo systemctl enable sddm.service
sudo systemctl enable ifplugd.service
sudo systemctl enable apache2.service
sudo systemctl --user enable --now pipewire.service pipewire.socket pipewire-pulse.service wireplumber.service

echo 'Enabling the Z shell by default.'
sudo chsh -s /bin/zsh root
sudo chsh -s /bin/zsh username

echo 'Enabling firewall rules.'
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 123/udp
sudo ufw allow 21/tcp
sudo ufw allow 22/tcp
sudo ufw allow 443
sudo ufw allow 465
sudo ufw allow 53
sudo ufw allow 5353
sudo ufw allow 5355
sudo ufw allow 5443
sudo ufw allow 546/udp
sudo ufw allow 547/udp
sudo ufw allow 631/tcp
sudo ufw allow 67/udp
sudo ufw allow 68/udp
sudo ufw allow 80
sudo ufw allow 8080
sudo ufw allow 8081
sudo ufw allow 8118/tcp
sudo ufw allow 853
sudo ufw allow 9050/tcp
sudo ufw allow 993
sudo ufw enable

echo 'Installing AdguardHome'
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

echo 'Settings for configuration files.'
sudo mkdir -p /etc/gtk-{2.0,3.0,4.0}
sudo mv /etc/tor/torrc{,.backup};sudo mv /etc/tor/torsocks{,.backup}
sudo mv /etc/locale.gen{,.backup};sudo sh -c "echo \"en_US.UTF-8 UTF-8\" > /etc/locale.gen";sudo locale-gen
mkdir -p ~/.mozilla/firefox/username;curl -o ~/user.js https://raw.githubusercontent.com/bogachenko/lib/master/text/firefox-user.js;mv ~/user.js ~/.mozilla/firefox/username/user.js
mkdir -p ~/.thunderbird/username;curl -o ~/user.js https://raw.githubusercontent.com/bogachenko/lib/master/text/thunderbird-user.js;mv ~/user.js ~/.thunderbird/username/user.js
mkdir -p ~/.icons/default;curl -o ~/.icons/default/index.theme https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/cursortheme;sudo cp ~/.icons/default/index.theme /usr/share/icons/default/index.theme
mkdir -p ~/.config/dunst;curl -o ~/.config/dunst/config https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/dunst
mkdir -p ~/.config/i3status;curl -o ~/.config/i3status/config https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/i3status
mkdir -p ~/.config/i3;curl -o ~/.config/i3/config https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/i3config
curl -o ~/.xinitrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/xinitrc
curl -o ~/.vimrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/vimrc;sudo cp ~/.vimrc /root/.vimrc
curl -o ~/.zshrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/zshrc;sudo cp ~/.zshrc /root/.zshrc
sudo sed -i 's/PROMPT=\"%F{34}%n%f%F{34}@%f%F{34}%m%f:%F{21}%~%f$ \"/PROMPT=\"%F{9}%n%f%F{9}@%f%F{9}%m%f:%F{21}%~%f# \"/g' /root/.zshrc
sudo sed -i 's/Listen 80/Listen 8081/g' /etc/apache2/ports.conf
sudo sh -c "echo \"1\" > /proc/sys/net/ipv4/ip_forward"
sudo sh -c "echo \"1\" > /proc/sys/net/ipv6/conf/all/forwarding"
curl -o ~/.Xresources https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/Xresources;sudo cp ~/.Xresources /root/.Xresources
curl -o ~/.gtkrc-2.0 https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/gtkrc2;sudo cp /etc/gtk-2.0/gtkrc ~/.gtkrc-2.0
mkdir -p ~/.config/gtk-3.0;curl -o ~/.config/gtk-3.0/settings.ini https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/gtkrc3;sudo cp /etc/gtk-3.0/settings.ini ~/.config/gtk-3.0
mkdir -p ~/.config/gtk-4.0;curl -o ~/.config/gtk-4.0/settings.ini https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/gtkrc4;sudo cp /etc/gtk-4.0/settings.ini ~/.config/gtk-4.0
curl -o ~/.torrc https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/torrc;sudo cp ~/.torrc /etc/tor/torrc
curl -o ~/00-apt-conf https://raw.githubusercontent.com/bogachenko/lib/master/config/raspberrypi-aarch64/00-apt-conf;sudo mv ~/00-apt-conf /etc/apt/apt.conf.d/00-apt-conf
sudo sh -c "echo \"forward-socks5 / localhost:9050 .\" >> /etc/privoxy/config"
sudo sh -c "echo \"forward-socks4 / localhost:9050 .\" >> /etc/privoxy/config"
sudo sh -c "echo \"forward-socks4a / localhost:9050 .\" >> /etc/privoxy/config"
sudo ln -sf ~/.gtkrc-2.0 /etc/gtk-2.0/gtkrc;sudo ln -sf ~/.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini;sudo ln -sf ~/.config/gtk-4.0/settings.ini /etc/gtk-4.0/settings.ini
xdg-user-dirs-update

echo 'Reboot the system'
sudo reboot -f