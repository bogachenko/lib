#!/bin/bash

# Arch Linux x86_64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

TELLUSER=$(whoami)
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
cd package-query/
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si
cd /tmp

# Installing the BlackArch repository.
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

# Update mirrorlist.
curl -sSL 'https://archlinux.org/mirrorlist/?country=RU&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on' | sed 's/^#Server/Server/g' > /etc/pacman.d/mirrorlist

# Installing updates and updating the data repositories.
yaourt -Syua
sudo pacman -Syyuu

# Installing main packages from the Arch User Repository.
yaourt -S peerflix spotify 

# Installing main packages.
sudo pacman -S --needed --noconfirm zsh git vim htop neofetch net-tools tor privoxy cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-dejavu ttf-liberation netctl gparted openresolv xorg-drivers xorg-server ranger code firefox-i18n-ru firefox xorg-xinit jack2 noto-fonts noto-fonts-emoji scrot xorg-xsetroot dhclient alsa-plugins alsa-utils pulseaudio nyx vlc noto-fonts-cjk xorg-xrdb speedtest-cli gtk2 gtk3 gtk4 dhcpcd xdg-utils xautolock hostapd xorg-apps dnsmasq unzip ppp bluez bluez-utils mathjax youtube-dl python2 python ttf-carlito ttf-caladea ttf-croscore libevent perl xorg-xclock xorg-xmodmap npm nodejs terminus-font mesa mesa-demos qt5ct imagemagick libjpeg-turbo chromium yajl zip unrar p7zip bzip2 lrzip lz4 lzop xz zstd arj lhasa pulseaudio-bluetooth pulseaudio-equalizer phonon-qt5-vlc xf86-input-synaptics rp-pppoe lib32-virtualgl virtualgl lib32-alsa-lib lib32-alsa-plugins steam steam-native-runtime retroarch libretro sddm xfce4 os-prober lib32-mesa pulseaudio-alsa lib32-mesa-libgl qt6-base qt5-base networkmanager nm-connection-editor usb_modeswitch modemmanager network-manager-applet gvfs xdg-user-dirs php

# Installing drivers.
nvidia=$(lspci | grep -e VGA -e 3D | grep 'NVIDIA' 2> /dev/null || echo '')
intel=$(lspci | grep -e VGA -e 3D | grep 'Intel' 2> /dev/null || echo '')
amd=$(lspci | grep -e VGA -e 3D | grep 'AMD' 2> /dev/null || echo '')
vmware=$(lspci | grep -e VGA -e 3D | grep 'VMware' 2> /dev/null || echo '')
if [[ -n "$vmware" ]]; then
sudo pacman -S --needed --noconfirm xf86-video-vesa
fi
if [[ -n "$nvidia" ]]; then
yaourt -S nvidia-390xx-dkms opencl-nvidia-390xx
yaourt -S lib32-nvidia-390xx-utils lib32-opencl-nvidia-390xx
fi
if [[ -n "$intel" ]]; then
sudo pacman -S --needed --noconfirm xf86-video-intel
sudo pacman -S --noconfirm intel-ucode --overwrite=/boot/intel-ucode.img
fi
if [[ -n "$nvidia" && -n "$intel" ]]; then
sudo pacman -S --needed --noconfirm bumblebee bbswitch primus lib32-primus
sudo cat > /etc/modprobe.d/killnouveau.conf <<EOF
blacklist nouveau
EOF
sudo sed -i -e "s/Driver=/Driver=nvidia/g" /etc/bumblebee/bumblebee.conf
sudo sed -i -e "s/Bridge=auto/Bridge=virtualgl/g" /etc/bumblebee/bumblebee.conf
sudo sed -i -e "s/MODULES=()/MODULES=(i915 bbswitch)/g" /etc/mkinitcpio.conf
sudo mkinitcpio -p linux
sudo sed -i -e "s/GRUB_CMDLINE_LINUX_DEFAULT=\"loglevel=3 quiet\"/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet rcutree.rcu_idle_gp_delay=1\"/g" /etc/default/grub
sudo sed -i -e "s/#   BusID \"PCI:01:00:0\"/BusID \"PCI:01:00:0\"/g" /etc/bumblebee/xorg.conf.nvidia
fi
if [[ -n "$amd" ]]; then
sudo pacman -S --needed --noconfirm xf86-video-amdgpu
sudo pacman -S --noconfirm amd-ucode --overwrite=/boot/amd-ucode.img
fi
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Getting root permissions.
su

# Configuration the time zone.
ln -sf /usr/share/zoneinfo/Asia/Sakhalin /etc/localtime

# Change the shell.
chsh -s /bin/zsh $TELLUSER
chsh -s /bin/zsh root

# Russification of the system.
cat > /etc/vconsole.conf <<EOF
FONT=cyr-sun16
KEYMAP=ru
EOF
cat > /etc/locale.gen <<EOF
ru_RU.UTF-8 UTF-8
en_US.UTF-8 UTF-8
EOF
locale-gen
setfont cyr-sun16
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

# Convert SOCKS to HTTP proxy via Privoxy.
echo "forward-socks5 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4 / localhost:9050 ." >> /etc/privoxy/config
echo "forward-socks4a / localhost:9050 ." >> /etc/privoxy/config

# Exiting superuser mode.
exit

# Fill in the information for GECOS.
sudo chfn $TELLUSER

# Enabling daemons.
sudo systemctl enable tor.service && sudo systemctl start tor.service
sudo systemctl enable privoxy.service && sudo systemctl start privoxy.service
sudo systemctl enable sshd.service && sudo systemctl start sshd.service
sudo systemctl enable gpm.service && sudo systemctl start gpm.service
sudo systemctl enable dhcpcd.service && sudo systemctl start dhcpcd.service
sudo systemctl disable hostapd.service && sudo systemctl stop hostapd.service
sudo systemctl disable dnsmasq.service && sudo systemctl stop dnsmasq.service
sudo systemctl enable bluetooth.service && sudo systemctl start bluetooth.service
sudo systemctl enable sddm.service
sudo systemctl enable bumblebeed.service
pulseaudio -k && pulseaudio --start

# Adding to groups.
sudo gpasswd -a $TELLUSER bumblebee

# Installing the configuration file user.js for Firefox.
cd /tmp
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/firefox-user.js
mv /tmp/user.js ~/.mozilla/firefox/$TELLUSER/user.js

# Create user directories.
xdg-user-dirs-update

# Configuration for the Xresources file.
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

# Configuration for the Zsh shell.
cat > ~/.zshrc <<EOF
PROMPT="%F{34}%n%f%F{34}@%f%F{34}%m%f:%F{21}%~%f$ "

export BROWSER="firefox"
export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"

alias ls='ls -la'
alias reboot='sudo reboot'
alias updXres='xrdb -merge ~/.Xresources'
alias unlockpac='sudo rm -f /var/lib/pacman/db.lck'
alias vi='vim'
alias cl='clear'

EOF
sudo cat > /root/.zshrc <<EOF
PROMPT="%F{9}%n%f%F{9}@%f%F{9}%m%f:%F{21}%~%f# "

export BROWSER="firefox"
export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"

alias ls='ls -la'
alias unlockpac='rm -f /var/lib/pacman/db.lck'
alias vi='vim'
alias cl='clear'

EOF

# Removing debris.
sudo rm -rf /root/.bash_history /root/.bashrc /root/.bash_logout /root/.bash_profile /root/.bash_functions /root/.bash_aliases ~/.bashrc ~/.bash_history ~/.bash_logout ~/.cache/thumbnails ~/.bash_profile ~/.bash_functions ~/.bash_aliases /tmp/* ~/.local/share/Trash/*
sudo pacman -Scc
sudo paccache -r

# Clear the console.
clear

# Reboot.
if [[ "$?" == "0" ]]; then
  echo "Completed successfully."
  read -r -p "Reboot now? [Y/n]" confirm
  if [[ ! "$confirm" =~ ^(n|N) ]]; then
    reboot
  fi
fi