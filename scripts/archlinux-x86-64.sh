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

# Update mirrorlist.
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
curl -sSL 'https://archlinux.org/mirrorlist/?country=RU&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on' | sudo sed 's/^#Server/Server/g' > /etc/pacman.d/mirrorlist

# Installing updates and updating the data repositories.
yaourt -Syua
sudo pacman -Syyuu

# Installing main packages from the Arch User Repository.
yaourt -S peerflix spotify tor-browser aic94xx-firmware wd719x-firmware upd72020x-fw xcursor-we10xos ttf-ms-fonts

# Import keys.
gpg --recv-keys EB774491D9FF06E2
gpg --recv-keys D1742AD60D811D58

# Installing main packages.
sudo pacman -S --needed --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa-libgl xterm xf86-video-nouveau xorg-drivers xorg-xrdb xorg-xclock xorg-xsetroot xorg-xmodmap zsh git vim htop net-tools tor privoxy cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-dejavu ttf-liberation netctl gparted openresolv code firefox-i18n-ru firefox jack2 noto-fonts noto-fonts-emoji noto-fonts-cjk scrot dhclient alsa-plugins alsa-utils pulseaudio nyx vlc speedtest-cli gtk2 gtk3 gtk4 dhcpcd hostapd dnsmasq unzip ppp bluez bluez-utils mathjax youtube-dl python2 python ttf-carlito ttf-caladea ttf-croscore perl npm nodejs terminus-font mesa mesa-demos qt5ct yajl zip unrar p7zip bzip2 lrzip lz4 lzop xz zstd arj lhasa pulseaudio-bluetooth pulseaudio-equalizer phonon-qt5-vlc rp-pppoe lib32-alsa-lib lib32-alsa-plugins os-prober lib32-mesa pulseaudio-alsa lib32-mesa-libgl qt6-base qt5-base php ffmpeg ttf-opensans libinput xf86-input-libinput qbittorrent plasma sddm sddm-kcm plasma-wayland-session kde-applications cronie hunspell telegram-desktop glu lib32-glu freeglut lib32-freeglut glew lib32-glew glslang weston wayland qt5-wayland qt6-wayland kf5 kf5-aids linux-firmware hwinfo xorg-xwayland libxcb egl-wayland thunderbird thunderbird-i18n-ru obs-studio jre-openjdk-headless jre-openjdk jdk-openjdk lib32-libxcb qt6ct desktop-file-utils ufw giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt gst-plugins-base-libs lib32-gst-plugins-base-libs vkd3d lib32-vkd3d sdl2 lib32-sdl2 libgphoto2 sane gsm samba dosbox discord dkms wqy-zenhei lib32-sdl2

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

# Leisure.
sudo pacman -S --needed --noconfirm steam steam-native-runtime retroarch libretro wine wine-mono wine-gecko

# Entering superuser mode.
su

# Setting the Windows 10 cursor by default.
cat > /usr/share/icons/default/index.theme <<EOF
[Icon Theme] 
Inherits=We10XOS-cursors
EOF

# Change the shell.
chsh -s /bin/zsh $USERNAME
chsh -s /bin/zsh root

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
sudo systemctl disable dhcpcd.service && sudo systemctl stop dhcpcd.service
sudo systemctl disable hostapd.service && sudo systemctl stop hostapd.service
sudo systemctl disable dnsmasq.service && sudo systemctl stop dnsmasq.service
sudo systemctl enable bluetooth.service && sudo systemctl start bluetooth.service
sudo systemctl enable ModemManager.service && sudo systemctl start ModemManager.service
sudo systemctl enable NetworkManager.service && sudo systemctl start NetworkManager.service
sudo systemctl enable ufw.service && sudo systemctl start ufw.service && sudo ufw enable
sudo systemctl enable sddm.service
sudo systemctl enable bumblebeed.service
pulseaudio -k && pulseaudio --start

# Adding to groups.
sudo gpasswd -a $USERNAME bumblebee

# Starting the NTP service.
sudo timedatectl set-ntp true

# Installing the configuration files user.js.
cd /tmp
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/firefox-user.js
mv /tmp/user.js ~/.mozilla/firefox/$USERNAME/user.js
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/thunderbird-user.js
mv /tmp/user.js ~/.thunderbird/$USERNAME/user.js
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/torbrowser-user.js
mv /tmp/user.js ~/.local/opt/tor-browser/app/Browser/TorBrowser/Data/Browser/profile.default/user.js

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
