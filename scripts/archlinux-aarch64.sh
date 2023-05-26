#!/bin/bash

# Arch Linux aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

sudo pacman -S --needed --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa-libgl xterm xorg-drivers cmake make mesa mesa-demos python perl net-tools htop netctl linux-firmware dialog wpa_supplicant openssh xorg-fonts-cyrillic man-db ruby lua base-devel glew glu freeglut zsh xorg-xclock xorg-xmodmap xorg-xsetroot python-pip php go gpm pacman-contrib whois archlinux-appstream-data
sudo pacman -S --needed --noconfirm git vim wget alsa-plugins alsa-utils pulseaudio alsa-lib ffmpeg jack2 pulseaudio-alsa pulseaudio-bluetooth noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu ttf-liberation ttf-opensans ttf-ubuntu-font-family terminus-font mathjax privoxy dnsmasq hostapd pwgen ntp speedtest-cli yajl bluez-utils bluez pulseaudio-bluetooth qt5 qt6 qt6-multimedia-ffmpeg
sudo pacman -S --needed --noconfirm chromium firefox tor vlc zip unrar p7zip bzip2 arj lrzip lz4 lzop xz zstd yt-dlp unzip plasma-desktop phonon-qt5-vlc wireplumber sddm-kcm plasma-pa	plasma-nm bluedevil usb_modeswitch breeze-gtk breeze-plymouth xdg-desktop-portal-kde xdg-desktop-portal plymouth-kcm plasma-vault plasma-systemmonitor plasma-firewall plasma-disks kwayland-integration kwallet-pam ksshaskpass khotkeys kgamma5 kde-gtk-config flatpak-kcm kde-accessibility-meta colord-kde gwenview kcolorchooser kdegraphics-thumbnailers koko kolourpaint okular spectacle svgpart elisa ffmpegthumbs k3b kmix kget dolphin krdc krfb ktorrent konsole kalendar kleopatra kcron kjournald ksystemlog partitionmanager ntfs-3g fatresize xfsprogs e2fsprogs f2fs-tools exfat-utils udftools kdf ark kalk kate kcharselect kclock kdialog keysmith kfind kgpg krecorder ktimer kwalletmanager markdownpart sweeper akonadi-calendar-tools akonadi-import-wizard akonadiconsole dolphin-plugins filelight kalarm kamoso kbackup kde-inotify-survey kdepim-addons plasma-vault drkonqi encfs cryfs

sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers

cd /tmp
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query/
makepkg -si
cd ..
cd yaourt/
makepkg -si
cd ..
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
cat > /tmp/mirrorlist <<EOF
# Russia
Server = http://mirror.yandex.ru/archlinux-arm/$arch/$repo
Server = http://mirror.yandex.ru/mirrors/blackarch/$repo/os/$arch
Server = http://mirror.truenetwork.ru/blackarch/$repo/os/$arch
Server = http://mirror.surf/blackarch/$repo/os/$arch
Server = http://mirror.premi.st/archlinux-arm/$arch/$repo
Server = https://mirror.yandex.ru/archlinux-arm/$arch/$repo
Server = https://mirror.yandex.ru/mirrors/blackarch/$repo/os/$arch
Server = https://mirror.truenetwork.ru/blackarch/$repo/os/$arch
Server = https://mirror.surf/blackarch/$repo/os/$arch
Server = https://mirror.premi.st/archlinux-arm/$arch/$repo
EOF
sudo cp /tmp/mirrorlist /etc/pacman.d/mirrorlist
sudo pacman -Syyuu

yaourt -S snapd

sudo hostnamectl set-hostname raspberry
sudo useradd -m -g users -G wheel -s /bin/zsh username
sudo chsh -s /bin/zsh root

sudo systemctl enable sshd.service
sudo systemctl enable snapd.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable dnsmasq.service
sudo systemctl enable hostapd.service
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm.service
sudo systemctl enable tor.service
sudo systemctl enable privoxy.service
sudo systemctl enable ntpd.service
sudo systemctl enable gpm.service

sudo echo "forward-socks5 / localhost:9050 ." >> /etc/privoxy/config
sudo echo "forward-socks4 / localhost:9050 ." >> /etc/privoxy/config
sudo echo "forward-socks4a / localhost:9050 ." >> /etc/privoxy/config

sudo timedatectl set-timezone Europe/Moscow
sudo timedatectl set-ntp true
sudo sed -i -e "s/server 0.arch.pool.ntp.org/server 0.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 1.arch.pool.ntp.org/server 1.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 2.arch.pool.ntp.org/server 2.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 3.arch.pool.ntp.org/server 3.ru.pool.ntp.org/g" /etc/ntp.conf

curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

cat > /tmp/.zshrc <<EOF
PROMPT="%F{34}%n%f%F{34}@%f%F{34}%m%f:%F{21}%~%f$ "
export BROWSER="firefox"
export EDITOR="vim"
alias ls='ls -la'
alias reboot='sudo reboot'
alias unlockpac='sudo rm -f /var/lib/pacman/db.lck'
alias vi='vim'
alias cl='clear'
alias sysctl='systemctl'
EOF
mv /tmp/.zshrc /home/username/.zshrc
cat > /tmp/.zshrc <<EOF
PROMPT="%F{9}%n%f%F{9}@%f%F{9}%m%f:%F{21}%~%f# "
export BROWSER="firefox"
export EDITOR="vim"
alias ls='ls -la'
alias unlockpac='rm -f /var/lib/pacman/db.lck'
alias vi='vim'
alias cl='clear'
alias sysctl='systemctl'
EOF
sudo mv /tmp/.zshrc /root/.zshrc