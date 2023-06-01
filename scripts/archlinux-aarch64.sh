#!/bin/bash

# Arch Linux aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers
#USERNAME="$(whoami)"
#MYDIR="/home/username/"

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
sudo pacman -S --needed --noconfirm xorg xorg-xclock xorg-xmodmap xorg-xsetroot xorg-server xorg-xinit xorg-xrdb xorg-fonts-misc xorg-xlsfonts xorg-apps xorg-drivers xorg-fonts-cyrillic xterm cmake make mesa mesa-demos mesa-libgl python perl net-tools htop netctl linux-firmware dialog wpa_supplicant openssh man-db ruby lua base-devel zsh python-pip php go gpm pacman-contrib whois weston wayland jre-openjdk jdk-openjdk apache rp-pppoe dhcpcd ant
echo 'Installing the sub-core packages.'
sudo pacman -S --needed --noconfirm git vim wget alsa-plugins alsa-utils pulseaudio alsa-lib ffmpeg jack2 pulseaudio-alsa pulseaudio-bluetooth noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu ttf-liberation ttf-opensans ttf-ubuntu-font-family terminus-font mathjax privoxy dnsmasq hostapd pwgen ntp speedtest-cli yajl bluez-utils bluez qt5 qt6 gtk2 gtk3 gtk4 ufw
echo 'Installing the extra packages.'
sudo pacman -S --needed --noconfirm chromium firefox tor vlc zip unrar p7zip bzip2 arj lrzip lz4 lzop xz zstd yt-dlp unzip sddm i3-wm i3status i3lock i3blocks dunst rofi dmenu rxvt-unicode plymouth

echo ''
sudo sed -i 's/HOOKS=\(base udev autodetect modconf kms keyboard keymap consolefont block filesystems fsck\)/HOOKS=\(base udev autodetect modconf kms keyboard keymap plymouth consolefont block filesystems fsck\)/g' /etc/mkinitcpio.conf

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
yaourt -S --needed --noconfirm ttf-ms-fonts

echo 'Enabling and running services...'
sudo systemctl enable sshd.service
sudo systemctl enable dnsmasq.service
sudo systemctl enable hostapd.service
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm.service
sudo systemctl enable tor.service
sudo systemctl enable privoxy.service
sudo systemctl enable ntpd.service && sudo systemctl start ntpd.service
sudo systemctl enable gpm.service
sudo systemctl enable ufw.service
sudo systemctl enable dhcpcd.service && sudo systemctl start dhcpcd.service

echo 'Changing the system time.'
echo 'Starting system time synchronization.'
sudo timedatectl set-timezone Europe/Moscow
sudo timedatectl set-ntp true
sudo sed -i -e "s/server 0.arch.pool.ntp.org/server 0.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 1.arch.pool.ntp.org/server 1.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 2.arch.pool.ntp.org/server 2.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 3.arch.pool.ntp.org/server 3.ru.pool.ntp.org/g" /etc/ntp.conf

echo 'Subpixel hinting mode.'
sudo sed -i 's/#export FREETYPE_PROPERTIES/export FREETYPE_PROPERTIES/g' /etc/profile.d/freetype2.sh

echo ''
sudo hostnamectl set-hostname raspberry
sudo useradd -m -g users -G wheel -s /bin/zsh username
sudo passwd username
sudo chsh -s /bin/zsh root

echo ''
cat > /tmp/etc/sddm.conf <<EOF
[Autologin]
User=username
Session=i3.desktop
EOF
sudo mv /tmp/etc/sddm.conf /etc/sddm.conf

echo ''
sudo sh -c "echo \"forward-socks5 / localhost:9050 .\" >> /etc/privoxy/config"
sudo sh -c "echo \"forward-socks4 / localhost:9050 .\" >> /etc/privoxy/config"
sudo sh -c "echo \"forward-socks4a / localhost:9050 .\" >> /etc/privoxy/config"
sudo systemctl restart privoxy.service

echo ''
sudo localectl set-keymap en
sudo setfont cyr-sun16
sudo localectl set-locale LANG="en_US.UTF-8"
export LANG=en_US.UTF-8
sudo sh -c "FONT=cyr-sun16 >> /etc/vconsole.conf"
sudo cp /etc/locale.gen /etc/locale.gen.backup
cat > /tmp/locale.gen <<EOF
en_US.UTF-8 UTF-8
EOF
sudo mv /tmp/locale.gen /etc/locale.gen
sudo locale-gen

echo ''
# Creating dirictory.
cd ~
mkdir '~/.config'
mkdir -p '/home/username/.mozilla/firefox'
mkdir -p '/home/username/.config/{i3status,i3}'
#
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
curl -o ~/.mozilla/firefox/username/user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/firefox-user.js
curl -o ~/.Xresources https://raw.githubusercontent.com/bogachenko/lib/master/text/.Xresources
#
cp /etc/i3status.conf /home/username/.config/i3status/config
cp /etc/i3/config /home/username/.config/i3/config
sed -ie 's/Mod1/$mod/g' /home/username/.config/i3/config
sed -i 's/exec --no-startup-id nm-applet/#exec --no-startup-id nm-applet/g' /home/username/.config/i3/config
echo "exec_always --no-startup-id xsetroot -solid \"#003760\"" >> /home/username/.config/i3/config
echo "set \$mod Mod4" >> /home/username/.config/i3/config
echo "exec i3" >> /home/username/.xinitrc

echo 'Setting preferences for .zsh'
cat > /tmp/.zshrc <<EOF
PROMPT="%F{34}%n%f%F{34}@%f%F{34}%m%f:%F{21}%~%f$ "
export BROWSER="firefox"
export EDITOR="vim"
alias ls='ls -la'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias ping-cli='ping -c 3 1.1.1.1'
alias unlockpac='sudo rm -f /var/lib/pacman/db.lck'
alias vi='vim'
alias cl='clear'
alias sysctl='sudo systemctl'
EOF
cp /tmp/.zshrc ~/.zshrc
sed -i 's/PROMPT=\"%F{34}%n%f%F{34}@%f%F{34}%m%f:%F{21}%~%f$ \"/PROMPT=\"%F{9}%n%f%F{9}@%f%F{9}%m%f:%F{21}%~%f# \"/g' /tmp/.zshrc
sudo mv /tmp/.zshrc /root/.zshrc

echo 'Setting preferences for Vim'
cat > /tmp/.vimrc <<EOF
set number
syntax on
set noswapfile
set wrap
set ttyfast
set encoding=utf8
EOF
sudo cp /tmp/.vimrc /root/.vimrc
mv /tmp/.vimrc /home/$UN/.vimrc