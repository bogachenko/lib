#!/bin/bash

# Arch Linux x86_64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

USERNAME="$(whoami)"
FONT="Noto Sans"
FONTM="Noto Sans Mono"
FONTMM="Noto Sans Medium"

# Clear the console.
clear

# Checking and installing updates.
sudo sed -i 's/#Color/Color/' /etc/pacman.conf
sudo pacman -Syyuu

# Installing main packages.
sudo pacman -S --needed --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa-libgl xterm xorg-drivers cmake make mesa mesa-demos lib32-mesa python perl net-tools htop netctl openresolv linux-firmware dialog wpa_supplicant openssh xorg-fonts-cyrillic
sudo pacman -S --needed --noconfirm git i3 rofi sddm vim zsh jack2 wget tor gtk2 gtk3 gtk4 rxvt-unicode weston wayland php ffmpeg privoxy alsa-plugins alsa-utils pulseaudio alsa-lib lib32-alsa-lib lib32-alsa-plugins libjpeg-turbo lib32-libjpeg-turbo pulseaudio-bluetooth bluez-utils libpng lib32-libpng hwinfo jre-openjdk jdk-openjdk noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-ubuntu-font-family ttf-dejavu ttf-liberation ttf-carlito ttf-caladea ttf-croscore ttf-opensans gvfs gvfs-nfs gvfs-mtp ntp
sudo pacman -S --needed --noconfirm firefox firefox-i18n-ru vlc code thunderbird thunderbird-i18n-ru chromium youtube-dl telegram-desktop discord steam steam-native-runtime retroarch libretro wine wine-mono wine-gecko nyx speedtest-cli pcmanfm-qt papirus-icon-theme

# Installing the Arch User Repository (AUR).
cd /tmp
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query/
makepkg -si
cd ..
cd yaourt/
makepkg -si

# Installing the BlackArch repository.
cd /tmp
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

# Installing main packages.
yaourt -S --needed --noconfirm ttf-ms-fonts tor-browser python2

# Checking and installing updates.
yaourt -Syua

# Time.
sudo timedatectl set-timezone Europe/Moscow
sudo sed -i -e "s/server 0.arch.pool.ntp.org/server 0.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 1.arch.pool.ntp.org/server 1.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 2.arch.pool.ntp.org/server 2.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 3.arch.pool.ntp.org/server 3.ru.pool.ntp.org/g" /etc/ntp.conf

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
sudo pacman -S --needed --noconfirm nvidia-dkms libglvnd
sudo pacman -S --needed --noconfirm lib32-nvidia-utils lib32-opencl-nvidia lib32-libglvnd
sudo pacman -S --needed --noconfirm virtualgl lib32-virtualgl libvdpau lib32-libvdpau
;;
Legacy )
yaourt -S nvidia-390xx-dkms libglvnd
yaourt -S lib32-nvidia-390xx-utils lib32-opencl-nvidia-390xx lib32-libglvnd
sudo pacman -S --needed --noconfirm virtualgl
sudo pacman -S --needed --noconfirm lib32-virtualgl libvdpau lib32-libvdpau
;;
esac
done
fi
if [[ -n "$intel" ]]; then
sudo pacman -S --needed --noconfirm xf86-video-intel intel-ucode libva libva-utils libva-intel-driver vulkan-intel iucode-tool
sudo pacman -S --needed --noconfirm lib32-libva lib32-libva-intel-driver lib32-vulkan-intel
sudo modprobe cpuid
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo cat > /etc/X11/xorg.conf.d/20-intel.conf <<EOF
Section "Device"
   Identifier  "Intel Graphics"
   Driver      "intel"
   Option      "TearFree"    "true"
EndSection
EOF
fi
if [[ -n "$nvidia" && -n "$intel" ]]; then
sudo pacman -S --needed --noconfirm bumblebee bbswitch primus lib32-primus
sudo systemctl enable bumblebeed.service
sudo gpasswd -a $USERNAME bumblebee
sudo cat > /etc/modprobe.d/killnouveau.conf <<EOF
blacklist nouveau
EOF
sudo sed -i -e "s/Driver=/Driver=nvidia/g" /etc/bumblebee/bumblebee.conf
sudo sed -i -e "s/Bridge=auto/Bridge=virtualgl/g" /etc/bumblebee/bumblebee.conf
sudo sed -i -e "s/MODULES=()/MODULES=(i915 bbswitch nvidia nvidia_modeset nvidia_uvm nvidia_drm)/g" /etc/mkinitcpio.conf
sudo mkinitcpio -p linux
sudo sed -i -e "s/GRUB_CMDLINE_LINUX_DEFAULT=\"loglevel=3 quiet\"/GRUB_CMDLINE_LINUX_DEFAULT=\"loglevel=3 quiet rcutree.rcu_idle_gp_delay=1 nvidia-drm.modeset=1 i915.modeset=1\"/g" /etc/default/grub
sudo sed -i -e "s/GRUB_TIMEOUT=5\"/GRUB_TIMEOUT=0\"/g" /etc/default/grub
sudo sed -i -e "s/#   BusID \"PCI:01:00:0\"/BusID \"PCI:01:00:0\"/g" /etc/bumblebee/xorg.conf.nvidia
sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

# Entering superuser mode.
su

# Change the shell.
chsh -s /bin/zsh $USERNAME
chsh -s /bin/zsh root

# Automatic login to the system.
cat > /etc/sddm.conf <<EOF
[Autologin]
User=$USERNAME
Session=i3.desktop
EOF

# Subpixel hinting mode.
cat > /etc/profile.d/freetype2.sh <<EOF
export FREETYPE_PROPERTIES="truetype:interpreter-version=38"
EOF

# Настройка Fontconfig.
cat > /etc/fonts/local.conf <<EOF
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
 <match target="font">

  <edit mode="assign" name="rgba">
   <const>rgb</const>
  </edit>

  <edit mode="assign" name="hinting">
   <bool>true</bool>
  </edit>

  <edit mode="assign" name="hintstyle">
   <const>hintslight</const>
  </edit>

  <edit mode="assign" name="antialias">
   <bool>true</bool>
  </edit>

  <edit mode="assign" name="lcdfilter">
    <const>lcddefault</const>
  </edit>

 </match>
</fontconfig>
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
sudo systemctl enable gpm.service && sudo systemctl start gpm.service
sudo systemctl enable bluetooth.service && sudo systemctl start bluetooth.service
sudo systemctl enable ntpd.service && sudo systemctl start ntpd.service
sudo systemctl enable sddm.service
pulseaudio -k && pulseaudio --start

# Installing the configuration files user.js.
cd /tmp
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/firefox-user.js
mv /tmp/user.js ~/.mozilla/firefox/$USERNAME/user.js
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/thunderbird-user.js
mv /tmp/user.js ~/.thunderbird/$USERNAME/user.js
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/torbrowser-user.js
mv /tmp/user.js ~/.local/opt/tor-browser/app/Browser/TorBrowser/Data/Browser/profile.default/user.js

# Create user directories.
# xdg-user-dirs-update

# Xresources file configuration.
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
URxvt.font: xft:$FONTM:regular:size=8
URxvt.boldFont: xft:$FONTM:bold:size=8
URxvt.italicFont: xft:$FONTM:italic:size=8
URxvt.boldItalicFont: xft:$FONTM:bold:italic:size=8
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
sudo reboot