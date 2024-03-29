#!/bin/bash

# Arch Linux x86_64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
# https://raw.githubusercontent.com/bogachenko/lib/master/scripts/archlinux-x86_64.sh

echo 'Updating the package list.'
sudo pacman -Syyuu

echo 'Installing the core packages.'
sudo pacman -S --needed --noconfirm linux-firmware base-devel openssh xorg xorg-xclock xorg-xmodmap xorg-xsetroot xorg-server xorg-xinit xorg-xrdb xorg-fonts-misc xorg-xlsfonts xorg-drivers xorg-fonts-cyrillic xterm xautolock htop python python-pip mesa lib32-mesa mesa-utils lib32-mesa-utils zsh ufw netctl net-tools dialog ifplugd netctl perl ruby php lua go gpm apache apparmor xdg-utils xss-lock libnotify cmake plymouth xdg-desktop-portal xdg-user-dirs e2fsprogs xfsprogs reiserfsprogs fatresize dosfstools udftools f2fs-tools exfatprogs jfsutils nilfs-utils ntfs-3g ca-certificates iptables man-db busybox systemd-resolved weston encfs cryfs iw
echo 'Installing the sub-core packages.'
sudo pacman -S --needed --noconfirm ntp vim git pwgen wireplumber pipewire lib32-pipewire pipewire-jack lib32-pipewire-jack pipewire-alsa pipewire-pulse alsa-utils alsa-plugins lib32-alsa-plugins ffmpeg mpd ranger zip unrar p7zip unzip lzop zstd lz4 lrzip arj bzip2 xz wget curl lshw bind dnsmasq hostapd i2pd nyx tor torsocks proxychains privoxy ttf-ubuntu-font-family noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation ttf-dejavu gtk2 gtk3 gtk4 qt5 qt6
echo 'Installing the extra packages.'
sudo pacman -S --needed --noconfirm firefox firefox-i18n-ru thunderbird thunderbird-i18n-ru chromium vlc phonon-qt5-vlc phonon-qt5 phonon-qt6-vlc phonon-qt6 xcursor-vanilla-dmz plasma-desktop xdg-desktop-portal-kde xdg-desktop-portal-gtk plasma-vault plasma-systemmonitor plasma-firewall ffmpegthumbs dolphin-plugins dolphin breeze-gtk plymouth-kcm breeze-plymouth kget kfind kdeplasma-addons gwenview kalarm kalk ksystemlog kompare kdialog colord-kde kde-gtk-config khotkeys krecorder ktimer kclock kgpg ark kdf kcharselect okular spectacle kjournald kcolorchooser kgamma partitionmanager filelight sweeper ksshaskpass kwalletmanager kwallet-pam kleopatra elisa kbackup kde-inotify-survey libappindicator-gtk2 libappindicator-gtk3 lib32-libappindicator-gtk2 lib32-libappindicator-gtk3 bluedevil konsole kcron cronie plasma-wayland-session plasma-pa plasma-nm i3 gvfs sddm rofi dunst scrot rxvt-unicode gimp speedtest-cli steam steam-native-runtime retroarch libretro wine wine-mono wine-gecko hunspell hunspell-ru hyphen-en hunspell-en_US libreoffice-fresh yt-dlp discord telegram-desktop code qbittorrent transmission-cli bluez cups bluez-cups cups-pdf cups-filters networkmanager modemmanager usb_modeswitch obs-studio

echo 'Settings for Internet parameters.'
sudo mv /etc/resolv.conf{,.backup}
echo -e "nameserver 1.1.1.1\nnameserver 1.0.0.1" | sudo tee -a /etc/resolv.conf
sudo sed -i 's/#DNS=/DNS=1.1.1.1 1.0.0.1/g' /etc/systemd/resolved.conf
sudo sed -i 's/#DNSSEC=no/DNSSEC=yes/g' /etc/systemd/resolved.conf
sudo sed -i 's/#DNSOverTLS=no/DNSOverTLS=yes/g' /etc/systemd/resolved.conf
sudo sed -i 's/#MulticastDNS=yes/MulticastDNS=yes/g' /etc/systemd/resolved.conf
sudo sed -i 's/#LLMNR=yes/LLMNR=yes/g' /etc/systemd/resolved.conf
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

echo 'Installing the Arch User Repository.'
cd /tmp;git clone https://aur.archlinux.org/package-query.git;git clone https://aur.archlinux.org/yaourt.git;cd package-query/;makepkg -si;cd ..;cd yaourt/;makepkg -si

echo 'Adding a keys'
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | gpg --import -

echo 'Installing main packages.'
yaourt -S --needed --noconfirm mkinitcpio-firmware ttf-ms-fonts tor-browser spotify

echo 'Settings the time and date.'
sudo timedatectl set-timezone Europe/Moscow
sudo sed -i -e "s/server 0.arch.pool.ntp.org/server 0.ru.pool.ntp.org/g" /etc/ntp.conf;sudo sed -i -e "s/server 1.arch.pool.ntp.org/server 1.ru.pool.ntp.org/g" /etc/ntp.conf;sudo sed -i -e "s/server 2.arch.pool.ntp.org/server 2.ru.pool.ntp.org/g" /etc/ntp.conf;sudo sed -i -e "s/server 3.arch.pool.ntp.org/server 3.ru.pool.ntp.org/g" /etc/ntp.conf

echo 'Enabling services.'
sudo systemctl restart systemd-resolved.service
sudo systemctl disable dnsmasq.service
sudo systemctl disable hostapd.service
sudo systemctl enable apparmor.service
sudo systemctl enable i2pd.service
sudo systemctl enable sshd.service
sudo systemctl enable ufw.service
sudo systemctl enable tor.service
sudo systemctl enable privoxy.service
sudo systemctl disable mpd.service
sudo systemctl enable gpm.service
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable ModemManager.service
sudo systemctl enable httpd.service
systemctl --user enable --now pipewire.socket;systemctl --user enable --now pipewire-pulse.socket;systemctl --user enable --now wireplumber.service

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
sudo ufw allow 51820/udp
sudo ufw allow 4445/tcp
sudo ufw allow 4444/tcp
sudo ufw allow 6881/tcp
sudo ufw allow 51413/tcp
sudo ufw enable

echo 'Setting preferences for fonts.'
sudo sed -i 's/#export FREETYPE_PROPERTIES/export FREETYPE_PROPERTIES/g' /etc/profile.d/freetype2.sh

echo 'Settings for configuration files.'
sudo mkdir -p /etc/gtk-{2.0,3.0,4.0};mkdir -p ~/.config/gtk-{3.0,4.0}
sudo mv /etc/tor/torrc{,.backup};sudo mv /etc/tor/torsocks.conf{,.backup}
mkdir -p ~/.mozilla/firefox/bogachenko;curl -o ~/user.js https://raw.githubusercontent.com/bogachenko/lib/master/text/firefox-user.js;mv ~/user.js ~/.mozilla/firefox/bogachenko/user.js
mkdir -p ~/.thunderbird/bogachenko;curl -o ~/user.js https://raw.githubusercontent.com/bogachenko/lib/master/text/thunderbird-user.js;mv ~/user.js ~/.thunderbird/bogachenko/user.js
mkdir -p ~/.config/dunst;curl -o ~/.config/dunst/config https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/dunst
mkdir -p ~/.icons/default;curl -o ~/.icons/default/index.theme https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/cursortheme;sudo cp ~/.icons/default/index.theme /usr/share/icons/default/index.theme
mkdir -p ~/.config/i3status;curl -o ~/.config/i3status/config https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/i3status
mkdir -p ~/.config/i3;curl -o ~/.config/i3/config https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/i3config
#curl -o ~/.xinitrc https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/xinitrc
curl -o ~/.vimrc https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/vimrc;sudo cp ~/.vimrc /root/.vimrc
curl -o ~/.zshrc https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/zshrc;sudo cp ~/.zshrc /root/.zshrc
sudo sed -i 's/PROMPT=\"%F{34}%n%f%F{34}@%f%F{34}%m%f:%F{21}%~%f$ \"/PROMPT=\"%F{9}%n%f%F{9}@%f%F{9}%m%f:%F{21}%~%f# \"/g' /root/.zshrc
sudo sed -i 's/Listen 80/Listen 8081/g' /etc/httpd/conf/httpd.conf
sudo sh -c "echo \"1\" > /proc/sys/net/ipv4/ip_forward";sudo sh -c "echo \"1\" > /proc/sys/net/ipv6/conf/all/forwarding";
#sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf;sudo sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
curl -o ~/.Xresources https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/Xresources;sudo cp ~/.Xresources /root/.Xresources
curl -o ~/.gtkrc-2.0 https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/gtkrc2;sudo cp ~/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
curl -o ~/.config/gtk-3.0/settings.ini https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/gtkrc3;sudo cp ~/.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini
curl -o ~/.config/gtk-4.0/settings.ini https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/gtkrc4;sudo cp ~/.config/gtk-4.0/settings.ini /etc/gtk-4.0/settings.ini
curl -o ~/.torrc https://raw.githubusercontent.com/bogachenko/lib/master/config/archlinux-x86_64/torrc;sudo mv ~/.torrc /etc/tor/torrc
sudo sh -c "echo \"forward-socks5 / localhost:9050 .\" >> /etc/privoxy/config";sudo sh -c "echo \"forward-socks4 / localhost:9050 .\" >> /etc/privoxy/config";sudo sh -c "echo \"forward-socks4a / localhost:9050 .\" >> /etc/privoxy/config";sudo sh -c "echo \"forward .i2p localhost:4444\" >> /etc/privoxy/config"
sudo ln -sf ~/.gtkrc-2.0 /etc/gtk-2.0/gtkrc;sudo ln -sf ~/.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini;sudo ln -sf ~/.config/gtk-4.0/settings.ini /etc/gtk-4.0/settings.ini
sudo rm -rf /etc/ufw/applications.d/
xdg-user-dirs-update

echo 'Reboot the system'
sudo reboot -f