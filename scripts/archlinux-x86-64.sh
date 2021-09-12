#!/bin/bash

# Arch Linux x86_64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

USERNAME=$(whoami)
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
sudo pacman -S --needed --noconfirm xorg-server xorg-xinit xorg-apps mesa-libgl xterm xf86-video-nouveau zsh git vim htop net-tools tor privoxy cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-dejavu ttf-liberation netctl gparted openresolv code firefox-i18n-ru firefox jack2 noto-fonts noto-fonts-emoji noto-fonts-cjk scrot dhclient alsa-plugins alsa-utils pulseaudio nyx vlc speedtest-cli gtk2 gtk3 gtk4 dhcpcd hostapd dnsmasq unzip ppp bluez bluez-utils mathjax youtube-dl python2 python ttf-carlito ttf-caladea ttf-croscore perl npm nodejs terminus-font mesa mesa-demos qt5ct yajl zip unrar p7zip bzip2 lrzip lz4 lzop xz zstd arj lhasa pulseaudio-bluetooth pulseaudio-equalizer phonon-qt5-vlc rp-pppoe lib32-alsa-lib lib32-alsa-plugins os-prober lib32-mesa pulseaudio-alsa lib32-mesa-libgl qt6-base qt5-base php ffmpeg ttf-opensans libinput xf86-input-libinput qbittorrent plasma sddm sddm-kcm plasma-wayland-session kde-applications cronie hunspell telegram-desktop glu lib32-glu freeglut lib32-freeglut glew lib32-glew glslang weston wayland qt5-wayland qt6-wayland kf5 kf5-aids

# Installing drivers.
nvidia=$(lspci | grep -e VGA -e 3D | grep 'NVIDIA' 2> /dev/null || echo '')
intel=$(lspci | grep -e VGA -e 3D | grep 'Intel' 2> /dev/null || echo '')
vmware=$(lspci | grep -e VGA -e 3D | grep 'VMware' 2> /dev/null || echo '')
if [[ -n "$vmware" ]]; then
sudo pacman -S --needed --noconfirm xf86-video-vesa xf86-video-vmware open-vm-tools
sudo systemctl enable vmtoolsd
fi
if [[ -n "$nvidia" ]]; then
echo 'Please select the correct driver according to your graphics card:'
select norleg in "Normal" "Legacy"; do
case $norleg in
Normal )
sudo pacman -S --needed nvidia-dkms libglvnd
sudo pacman -S --needed lib32-nvidia-utils lib32-opencl-nvidia lib32-libglvnd
sudo pacman -S virtualgl lib32-virtualgl
;;
Legacy )
yaourt -S nvidia-390xx-dkms libglvnd
yaourt -S lib32-nvidia-390xx-utils lib32-opencl-nvidia-390xx lib32-libglvnd
sudo pacman -S virtualgl lib32-virtualgl
;;
esac
done
fi
if [[ -n "$intel" ]]; then
sudo pacman -S --needed --noconfirm xf86-video-intel
sudo grub-mkconfig -o /boot/grub/grub.cfg
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
sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

# Leisure.
sudo pacman -S steam steam-native-runtime retroarch libretro 

# Entering superuser mode.
su

# Change the shell.
chsh -s /bin/zsh $USERNAME
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
sudo chfn $USERNAME

# Enabling daemons.
sudo systemctl enable tor.service && sudo systemctl start tor.service
sudo systemctl enable privoxy.service && sudo systemctl start privoxy.service
sudo systemctl enable sshd.service && sudo systemctl start sshd.service
sudo systemctl enable gpm.service && sudo systemctl start gpm.service
sudo systemctl enable dhcpcd.service && sudo systemctl start dhcpcd.service
sudo systemctl disable hostapd.service && sudo systemctl stop hostapd.service
sudo systemctl disable dnsmasq.service && sudo systemctl stop dnsmasq.service
sudo systemctl enable bluetooth.service && sudo systemctl start bluetooth.service
sudo systemctl enable ModemManager.service && sudo systemctl start ModemManager.service
sudo systemctl enable NetworkManager.service && sudo systemctl start NetworkManager.service
sudo systemctl enable sddm.service
sudo systemctl enable bumblebeed.service
pulseaudio -k && pulseaudio --start

# Adding to groups.
sudo gpasswd -a $USERNAME bumblebee

# Installing the configuration file user.js for Firefox.
cd /tmp
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/firefox-user.js
mv /tmp/user.js ~/.mozilla/firefox/$USERNAME/user.js

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
