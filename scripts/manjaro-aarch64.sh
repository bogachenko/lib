#!/bin/bash

# Manjaro Linux aarch64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

USERNAME="$(whoami)"
UA="Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)"
FONT="Noto Sans"
FONTM="Noto Sans Mono"

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

# Checking and installing updates.
sudo sed -i 's/#Color/Color/' /etc/pacman.conf
sudo pacman -Syyuu

# Sorting mirrors for the pacman package manager.
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo pacman-mirrors --fasttrack && sudo pacman -Syyu

# Installing core packages.
sudo pacman -S --needed --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa-libgl xterm xf86-video-nouveau xorg-drivers xorg-xrdb xorg-xclock xorg-xsetroot xorg-xmodmap zsh git vim htop net-tools tor privoxy cmake pkgconf make iw base-devel wget ttf-ubuntu-font-family ttf-dejavu ttf-liberation netctl gparted openresolv code firefox-i18n-ru firefox jack2 noto-fonts noto-fonts-emoji noto-fonts-cjk sddm dmenu i3-wm scrot xorg-xsetroot i3status gvfs dhclient alsa-plugins alsa-utils pulseaudio nyx vlc speedtest-cli xdg-user-dirs gtk2 gtk3 gtk4 dhcpcd xdg-utils xautolock hostapd dnsmasq rxvt-unicode unzip i3lock ppp bluez bluez-utils mathjax youtube-dl pcmanfm-qt python2 python ttf-carlito ttf-caladea ttf-croscore ttf-opensans libevent perl xorg-xclock xorg-xmodmap npm nodejs terminus-font mesa mesa-demos qt5ct pwgen dunst breeze-icons chromium yajl zip unrar p7zip bzip2 lrzip lz4 lzop xz zstd arj lhasa lxqt-archiver pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-alsa qt6-base qt5-base php ffmpeg glu freeglut glew glslang libxcb jre-openjdk-headless jre-openjdk jdk-openjdk qt6ct desktop-file-utils create_ap

# Checking and installing updates.
yaourt -Syua

# Time.
sudo timedatectl set-timezone Europe/Moscow
sudo sed -i -e "s/server 0.arch.pool.ntp.org/server 0.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 1.arch.pool.ntp.org/server 1.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 2.arch.pool.ntp.org/server 2.ru.pool.ntp.org/g" /etc/ntp.conf
sudo sed -i -e "s/server 3.arch.pool.ntp.org/server 3.ru.pool.ntp.org/g" /etc/ntp.conf

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
sudo systemctl disable hostapd.service && sudo systemctl stop hostapd.service
sudo systemctl disable dnsmasq.service && sudo systemctl stop dnsmasq.service
sudo systemctl enable ntpd.service && sudo systemctl start ntpd.service
sudo systemctl enable sddm.service
pulseaudio -k && pulseaudio --start

# Installing the configuration file user.js for Firefox.
cd /tmp
curl -o user.js https://raw.githubusercontent.com/bogachenko/lib/master/mozilla/firefox-user.js
mv /tmp/user.js ~/.mozilla/firefox/$USERNAME/user.js

# Downloading and installing Adguard Home.
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

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
URxvt.font: xft:$FONTM:regular:size=9
URxvt.boldFont: xft:$FONTM:bold:size=9
URxvt.italicFont: xft:$FONTM:italic:size=9
URxvt.boldItalicFont: xft:$FONTM:bold:italic:size=9
URxvt.geometry: 150x30
URxvt.scrollTtyOutput: false
URxvt.cursorBlink: true
EOF
xrdb -merge ~/.Xresources

# Configuring i3wm and i3status.
mkdir -p ~/.config/i3status
cat > ~/.config/i3status/config <<EOF
general {
        output_format = "i3bar"
        colors = true
        color_good = "#00FF00"
        color_degraded = "#FFFF00"
        color_bad = "#FF0000"
        interval = 1
}

order += "ipv6"
order += "wireless _first_"
order += "ethernet _first_"
order += "disk /"
order += "load"
order += "memory"
order += "tztime local"

wireless _first_ {
        format_up = "W: (%quality at %essid) %ip"
        format_down = "W: down"
}

ethernet _first_ {
        format_up = "E: %ip (%speed)"
        format_down = "E: down"
}

disk "/" {
        format = "D: %avail"
}

load {
        format = "L: %1min"
}

memory {
        format = "M: %used - %available"
        threshold_degraded = "1G"
        format_degraded = "MEMORY < %available"
}

tztime local {
        format = "%a %d %B %Y, %H:%M"
}
EOF
cat > ~/.config/i3/config <<EOF
set $mod Mod4
font pango:$FONTMM 9
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status
floating_modifier $mod
bindsym $mod+Return exec urxvt
bindsym $mod+Shift+q kill
bindsym $mod+d exec "dmenu_run -nf '#BEBEBE' -nb '#000000' -sb '#1000C0' -sf '#FFFFFF' -fn '$FONTMM-9'
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right
bindsym $mod+h split h
bindsym $mod+v split v
bindsym $mod+f fullscreen toggle
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split
bindsym $mod+Shift+space floating toggle
bindsym $mod+space focus mode_toggle
bindsym $mod+a focus parent
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"
mode "resize" {
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}
bindsym $mod+r mode "resize"
client.focused          #4C7899 #285577 #FFFFFF #2E9EF4   #285577
client.focused_inactive #333333 #5F676A #FFFFFF #484E50   #5F676A
client.unfocused        #333333 #222222 #888888 #292D2E   #222222
client.urgent           #2F343A #900000 #FFFFFF #900000   #900000
client.placeholder      #000000 #0C0C0C #FFFFFF #000000   #0C0C0C
client.background       #FFFFFF
bar {
        status_command i3status
colors {
    background #000000
    statusline #FFFFFF
    separator  #666666

    focused_workspace  #4C7899 #285577 #FFFFFF
    active_workspace   #333333 #222222 #FFFFFF
    inactive_workspace #333333 #222222 #888888
    urgent_workspace   #2F343A #900000 #FFFFFF
    binding_mode       #2F343A #900000 #FFFFFF
        }
}
exec_always --no-startup-id xsetroot -solid "#003760"
EOF

# Configuration for the Vim program.
cat > ~/.vimrc <<EOF
set number
syntax on
set noswapfile
set wrap
set ttyfast
set encoding=utf8
EOF
sudo cp ~/.vimrc /root/.vimrc

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
alias sysctl='systemctl'
alias wifiap='sudo create_ap --daemon wlan0 eth0 RP4-bogachenko oBy8neNmnZ'
EOF
cat > /tmp/.zshrc <<EOF
PROMPT="%F{9}%n%f%F{9}@%f%F{9}%m%f:%F{21}%~%f# "

export BROWSER="firefox"
export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"

alias ls='ls -la'
alias unlockpac='rm -f /var/lib/pacman/db.lck'
alias vi='vim'
alias cl='clear'
alias sysctl='systemctl'
alias wifiap='create_ap --daemon wlan0 eth0 RP4-bogachenko oBy8neNmnZ'
EOF
sudo mv /tmp/.zshrc /root/.zshrc

# Removing debris.
sudo rm -rf /root/.bash_history /root/.bashrc /root/.bash_logout /root/.bash_profile /root/.bash_functions /root/.bash_aliases ~/.bashrc ~/.bash_history ~/.bash_logout ~/.cache/thumbnails ~/.bash_profile ~/.bash_functions ~/.bash_aliases /tmp/* ~/.local/share/Trash/*
sudo pacman -Scc
sudo paccache -r

# Clear the console.
clear

# Reboot.
sudo reboot