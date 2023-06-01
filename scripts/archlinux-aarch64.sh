#!/bin/bash

# Arch Linux aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
cat > /tmp/mirrorlist <<EOF
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

echo 'Installing the core packages.'
sudo pacman -S --needed --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa-libgl xterm xorg-drivers cmake make mesa mesa-demos python perl net-tools htop netctl linux-firmware dialog wpa_supplicant openssh xorg-fonts-cyrillic man-db ruby lua base-devel zsh xorg-xclock xorg-xmodmap xorg-xsetroot python-pip php go gpm pacman-contrib whois weston wayland jre-openjdk jdk-openjdk apache xorg-fonts-misc xorg-xlsfonts rp-pppoe xorg-xauth xorg-xhost autossh dhcpcd xorg-xrdb
echo 'Installing the sub-core packages.'
sudo pacman -S --needed --noconfirm git vim wget alsa-plugins alsa-utils pulseaudio alsa-lib ffmpeg jack2 pulseaudio-alsa pulseaudio-bluetooth noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu ttf-liberation ttf-opensans ttf-ubuntu-font-family terminus-font mathjax privoxy dnsmasq hostapd pwgen ntp speedtest-cli yajl bluez-utils bluez qt5 qt6 gtk2 gtk3 gtk4 ufw
echo 'Installing the extra packages.'
sudo pacman -S --needed --noconfirm chromium firefox tor vlc zip unrar p7zip bzip2 arj lrzip lz4 lzop xz zstd yt-dlp unzip plasma-desktop phonon-qt5-vlc wireplumber sddm-kcm plasma-pa plasma-nm bluedevil usb_modeswitch breeze-gtk breeze-plymouth xdg-desktop-portal-kde xdg-desktop-portal plymouth plymouth-kcm plasma-vault plasma-systemmonitor plasma-firewall plasma-disks kwayland-integration kwallet-pam ksshaskpass khotkeys kgamma5 kde-gtk-config flatpak-kcm kde-accessibility-meta colord-kde gwenview kcolorchooser kdegraphics-thumbnailers koko kolourpaint okular spectacle svgpart elisa ffmpegthumbs k3b kmix kget dolphin krdc krfb ktorrent konsole kalendar kleopatra kcron cronie kjournald ksystemlog partitionmanager ntfs-3g fatresize xfsprogs e2fsprogs f2fs-tools exfat-utils udftools kdf ark kalk kate kcharselect kclock kdialog keysmith kfind kgpg krecorder ktimer kwalletmanager markdownpart sweeper akonadi-calendar-tools akonadi-import-wizard akonadiconsole dolphin-plugins filelight kalarm kamoso kbackup kde-inotify-survey kdepim-addons drkonqi encfs cryfs plasma-workspace-wallpapers kdeplasma-addons kwrited kompare cups libcups system-config-printer libreoffice-fresh libappindicator-gtk2 libappindicator-gtk3 qt6-multimedia-ffmpeg plasma-wayland-session i3-wm dmenu i3status i3lock rxvt-unicode gimp modemmanager thunderbird archlinux-appstream-data

echo 'Installing additional repositories.'
cd /tmp
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query/
makepkg -si
cd ..
cd yaourt/
makepkg -si
cd ..
sudo rm -rf /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinuxarm
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

echo 'Installing the extra packages from AUR'
yaourt -S snapd ttf-ms-fonts urxvt-fullscreen xrdp xorgxrdp

sudo systemctl enable sshd.service
sudo systemctl enable snapd.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable ModemManager.service
sudo systemctl enable dnsmasq.service
sudo systemctl enable hostapd.service
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm.service
sudo systemctl enable tor.service
sudo systemctl enable privoxy.service
sudo systemctl enable ntpd.service && sudo systemctl start ntpd.service
sudo systemctl enable gpm.service
sudo systemctl enable ufw.service
sudo systemctl enable cups.service
sudo systemctl enable xrdp.service && sudo systemctl start ntpd.service
sudo systemctl enable dhcpcd.service && sudo systemctl start ntpd.service

sudo timedatectl set-timezone Europe/Moscow
sudo timedatectl set-ntp true
sudo sed -i -e "s/server 0.arch.pool.ntp.org/server 0.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 1.arch.pool.ntp.org/server 1.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 2.arch.pool.ntp.org/server 2.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 3.arch.pool.ntp.org/server 3.ru.pool.ntp.org/g" /etc/ntp.conf

sudo sed -i 's/#export FREETYPE_PROPERTIES/export FREETYPE_PROPERTIES/g' /etc/profile.d/freetype2.sh

sudo hostnamectl set-hostname raspberry
sudo useradd -m -g users -G wheel -s /bin/zsh username
sudo passwd username
sudo chsh -s /bin/zsh root

sudo echo "forward-socks5 / localhost:9050 ." >> /etc/privoxy/config
sudo echo "forward-socks4 / localhost:9050 ." >> /etc/privoxy/config
sudo echo "forward-socks4a / localhost:9050 ." >> /etc/privoxy/config

sudo localectl set-keymap en
sudo setfont cyr-sun16
sudo localectl set-locale LANG="en_US.UTF-8"
export LANG=en_US.UTF-8
sudo cp /etc/locale.gen /etc/locale.gen.backup
cat > /tmp/locale.gen <<EOF
en_US.UTF-8 UTF-8
EOF
sudo mv /tmp/locale.gen /etc/locale.gen
sudo locale-gen

curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
curl -o ~/.mozilla/firefox/username/user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/firefox-user.js
curl -o ~/.Xresources https://raw.githubusercontent.com/bogachenko/lib/master/text/.Xresources
xrdb -merge ~/.Xresources

cat > /tmp/.xinitrc <<EOF
exec i3
exec_always --no-startup-id xsetroot -solid "#003760"
EOF
mv /tmp/.xinitrc /home/username/.xinitrc

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


cat > /tmp/.vimrc <<EOF
set number
syntax on
set noswapfile
set wrap
set ttyfast
set encoding=utf8
EOF
sudo cp /tmp/.vimrc /root/.vimrc
sudo cp /tmp/.vimrc /home/username/.vimrc