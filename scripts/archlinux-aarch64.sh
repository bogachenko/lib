#!/bin/bash

# Arch Linux aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

pacman -Sy sudo openssh
exit

sudo systemctl enable sshd.service
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers

echo 'Updating the list of repository mirrors.'
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
cat > /tmp/mirrorlist <<EOF
Server = http://mirror.yandex.ru/archlinux-arm/$arch/$repo
Server = http://mirror.premi.st/archlinux-arm/$arch/$repo
Server = https://mirror.yandex.ru/archlinux-arm/$arch/$repo
Server = https://mirror.premi.st/archlinux-arm/$arch/$repo
EOF
sudo cp /tmp/mirrorlist /etc/pacman.d/mirrorlist
sudo pacman -Syyuu

echo 'Installing the core packages.'
sudo pacman -S --noconfirm xorg xorg-xclock xorg-xmodmap xorg-xsetroot xorg-server xorg-xinit xorg-xrdb xorg-fonts-misc xorg-xlsfonts xorg-apps xorg-drivers xorg-fonts-cyrillic xterm xautolock xdg-user-dirs man-db base-devel mesa git zsh python python-pip perl ruby lua php go apache whois htop jre-openjdk-headless ppp cmake apparmor
echo 'Installing the sub-core packages.'
sudo pacman -S --noconfirm vim wget pipewire pipewire-jack wireplumber alsa-utils alsa-firmware alsa-card-profiles alsa-plugins pipewire-alsa pipewire-pulse ffmpeg noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu ttf-liberation ttf-opensans ttf-ubuntu-font-family terminus-font mathjax privoxy dnsmasq hostapd pwgen ntp speedtest-cli qt5-base qt6-base gtk3 gtk4 ufw gvfs gvfs-mtp dosfstools bluez bluez-utils
echo 'Installing the extra packages.'
sudo pacman -S --noconfirm chromium tor nyx vlc plymouth sddm rofi i3-wm i3status i3lock i3blocks dunst scrot mpd rxvt-unicode ranger gimp cups system-config-printer transmission-cli zip unrar p7zip unzip xdg-desktop-portal tigervnc


 #  pcmanfm-qt     lxqt-archiver qbittorrent   usb_modeswitch breeze-gtk xdg-desktop-portal-kde xdg-desktop-portal-gtk cdrtools dvd+rw-tools fatresize exfat-utils  ntfsprogs e2fsprogs xfsprogs f2fs-tools udftools

echo 'Setting preferences for kernel parameters.'
sudo sed -i 's/base udev autodetect/base udev plymouth autodetect/g' /etc/mkinitcpio.conf
sudo mkinitcpio -p linux-aarch64
#cat > /boot/cmdline.txt <<EOF
#quiet splash logo.nologo plymouth.ignore-serial-consoles
#EOF

echo 'Installing additional repositories.'
cd /tmp
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query/
makepkg -si
cd ..
cd yaourt/
makepkg -si
cd /tmp

echo 'Installing the extra packages from AUR'
yaourt -S --needed --noconfirm ttf-ms-fonts mkinitcpio-firmware

echo 'Enabling and running services...'
#sudo systemctl enable dnsmasq.service
#sudo systemctl enable hostapd.service
#sudo systemctl enable apparmor.service
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm.service
sudo systemctl enable tor.service
sudo systemctl enable mpd.service
sudo systemctl enable privoxy.service
sudo systemctl enable ntpd.service && sudo systemctl start ntpd.service
sudo systemctl enable gpm.service
sudo systemctl enable ufw.service
#sudo systemctl enable dhcpcd.service && sudo systemctl start dhcpcd.service
sudo systemctl --user enable --now pipewire.service pipewire.socket pipewire-pulse.service wireplumber.service

echo 'Uncomplicated Firewall Rules'
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 21/tcp
sudo ufw allow 5900/tcp
sudo ufw allow 443
sudo ufw allow 80
sudo ufw enable

echo 'Changing the system time.'
echo 'Starting system time synchronization.'
sudo timedatectl set-timezone Europe/Moscow
sudo timedatectl set-ntp true
sudo sed -i -e "s/server 0.arch.pool.ntp.org/server 0.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 1.arch.pool.ntp.org/server 1.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 2.arch.pool.ntp.org/server 2.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 3.arch.pool.ntp.org/server 3.ru.pool.ntp.org/g" /etc/ntp.conf

echo 'Setting preferences for fonts.'
sudo sed -i 's/#export FREETYPE_PROPERTIES/export FREETYPE_PROPERTIES/g' /etc/profile.d/freetype2.sh

echo ''
sudo hostnamectl set-hostname raspberry
sudo useradd -m -g users -G wheel -s /bin/zsh username
sudo passwd username
sudo userdel -rf alarm
sudo chsh -s /bin/zsh root

echo 'Setting preferences for automatic login to SDDM.'
touch /tmp/sddm.conf
cat > /tmp/sddm.conf <<EOF
[Autologin]
User=username
Session=i3.desktop
EOF
sudo mv /tmp/sddm.conf /etc/sddm.conf

echo 'Setting preferences for Privoxy.'
sudo sh -c "echo \"forward-socks5 / localhost:9050 .\" >> /etc/privoxy/config"
sudo sh -c "echo \"forward-socks4 / localhost:9050 .\" >> /etc/privoxy/config"
sudo sh -c "echo \"forward-socks4a / localhost:9050 .\" >> /etc/privoxy/config"
sudo systemctl restart privoxy.service

echo 'Setting preferences for the language.'
sudo localectl set-keymap en
sudo setfont ter-k16n
sudo localectl set-locale LANG="en_US.UTF-8"
sudo sh -c "echo \"FONT=ter-k16n\" >> /etc/vconsole.conf"
sudo cp /etc/locale.gen /etc/locale.gen.backup
cat > /tmp/locale.gen <<EOF
en_US.UTF-8 UTF-8
EOF
sudo mv /tmp/locale.gen /etc/locale.gen
sudo locale-gen

echo 'Setting preferences for working directories.'
mkdir '/home/username/.config'
mkdir -p '/home/username/.config/{i3,i3status,dunst}'
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
curl -o /home/username/.Xresources https://raw.githubusercontent.com/bogachenko/lib/master/text/.Xresources
sudo cp /home/username/.Xresources /root/.Xresources
cp /etc/i3status.conf /home/username/.config/i3status/config
cp /etc/i3/config /home/username/.config/i3/config
cp /etc/dunst/dunstrc /home/username/.config/dunst/dunstrc
sed -ie 's/Mod1/$mod/g' /home/username/.config/i3/config
sh -c "echo \"exec_always --no-startup-id xsetroot -solid \"#003760\"\" >> /home/username/.config/i3/config"
sh -c "echo \"set \$mod Mod4\" >> /home/username/.config/i3/config"
sh -c "echo \"exec i3\" >> /home/username/.xinitrc"
xdg-user-dirs-update

echo 'Setting preferences for DNS'
sudo sed -i 's/#DNS=/DNS=1.1.1.1 1.0.0.1/g' /etc/systemd/resolved.conf
sudo sed -i 's/#FallbackDNS=1.1.1.1#cloudflare-dns.com 9.9.9.9#dns.quad9.net 8.8.8.8#dns.google 2606:4700:4700::1111#cloudflare-dns.com 2620:fe::9#dns.quad9.net 2001:4860:4860::8888#dns.google/FallbackDNS=8.8.8.8#dns.google 8.8.4.4#dns.google 2001:4860:4860::8844#dns.google 2001:4860:4860::8888#dns.google/g' /etc/systemd/resolved.conf
sudo sed -i 's/#DNSOverTLS=no/DNSOverTLS=yes/g' /etc/systemd/resolved.conf
sudo mkdir -p /etc/systemd/resolved.conf.d
cat > /etc/systemd/resolved.conf.d/adguardhome.conf <<EOF
[Resolve]
DNS=127.0.0.1
DNSStubListener=no
EOF
sudo mv /etc/resolv.conf /etc/resolv.conf.backup
sudo ln -rsf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo systemctl restart systemd-resolved.service

#cat > ~/.config/dnsmasq.conf <<EOF
#interface=wlan0
#dhcp-range=192.168.0.100, 192.168.0.110, 255.255.255.0, 12h
#dhcp-option=3, 192.168.0.103
#dhcp-option=6, 192.168.0.103
#listen-address=127.0.0.1
#port=5353
#EOF
#cat > ~/.config/hostapd.conf <<EOF
#interface=wlan0
#ssid=username
#hw_mode=g
#channel=1
#driver=nl80211
#EOF

echo 'Setting preferences for Z shell'
cat > /tmp/.zshrc <<EOF
PROMPT="%F{34}%n%f%F{34}@%f%F{34}%m%f:%F{21}%~%f$ "
export BROWSER="firefox"
export EDITOR="vim"
alias ls='ls -la'
alias reboot='sudo reboot -f'
alias poweroff='sudo poweroff'
alias ping-cli='ping -c 3 1.1.1.1'
alias unpac='sudo rm -f /var/lib/pacman/db.lck'
alias vi='vim'
alias cl='clear'
alias sysctl='sudo systemctl'
alias paccl='sudo pacman -Scc && sudo paccache -r'
EOF
cp /tmp/.zshrc /home/username/.zshrc
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
mv /tmp/.vimrc /home/username/.vimrc