#!/bin/bash

#   Arch Linux x86_64
#   Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
#   License: MIT license <https://raw.githubusercontent.com/bogachenko/lib/master/LICENSE.md>
#   Last update: March 2025
#   Bitcoin (BTC) - bc1qnmderzmag45pa3a0jyaqah654x0055n6y8madh
#   Bitcoin Cash (BCH) - qzptqmjr0vrj053wgcxa5yesdlejk973xq9xctmxcg
#   Binance Coin (BNB) - 0xE4869C3140134522383E316d329612bC886F85E2
#   Ethereum (ETH) - 0xE4869C3140134522383E316d329612bC886F85E2
#   Ethereum Classic (ETC) - 0x4A11511a9C69eA1CFa8B1135c9B8A3B27c84eE55
#   Tron (TRX) - TW8ocDJLPTnVFG4Karb7zctbBfjFaZfuJn
#   Toncoin (TON) - UQA5s93oUhxmmkaivrZim1VOh9v-D6CI15jlk80FP6wWtYrw
#   Dogecoin (DOGE) - D7BHKJ4ymU5uZKrju5BbYQpSfdENc5qtr1
#   Litecoin (LTC) - ltc1q3t9hmgqyze8qlrw56rxepyw8ll44jcl7uc8z4p
#   Solana (SOL) - 5fsRA5NiQKX5GLzatbmYS7UbZ9Q2LMqdCH7pBgtrXDJM
#   Ripple (XRP) - rnEWArfEDm4yFJeG7xnvDCkW7GKperxf6t
#   Dash (DASH) - XkQFy1UfKCCpiSw391A5YYTEYEKYvxVoxE
#   Cardano (ADA) - addr1q8yjcner4yq7kgd0gleq4qf0gae2xemvvpu790nhfk7a3y8gje4zxphcq0kyg3ry5yvgtzy2huhd49l9rdwmh6khmm4se2er3a
#   Zcash (ZEC) - t1N8QRJg6jFt2m92DyFkYVDEv36ZK3JnQP2

echo NETWORK INFORMATION RETRIEVAL.
echo Running a script to get information about the network in the operating system.
if ping -c 1 "1.1.1.1" >/dev/null; then
    echo "Internet connection detected. Proceeding with the script."
else
    echo "No internet connection detected. Exiting script."
    exit 1
fi

echo SUPERUSER RIGHTS RETRIEVAL.
if [[ $(id -u) -ne 0 ]]; then
    echo "Running a script to obtain superuser rights in the operating system."
    exit 1
fi

echo 'Updating the package list.'
sudo pacman -Syyuu

echo 'Installing the core packages.'
sudo pacman -S --noconfirm xorg xorg-server xorg-xinit man-db xterm xorg-fonts-cyrillic \
    xorg-fonts-misc xorg-drivers python python-pip lib32-mesa mesa-utils lib32-mesa-utils mesa-libgl \
    ufw openssh net-tools dialog ifplugd netctl lua go wpa_supplicant perl ruby php gpm apache apparmor \
    xdg-utils xss-lock cmake plymouth xdg-desktop-portal xdg-user-dirs iw iwd git wget curl lshw bind \
    dnsmasq hostapd whois ntp encfs cryfs systemd-resolvconf htop vim dhcpcd dhclient
echo 'Installing the sub-core packages.'
sudo pacman -S --noconfirm wireplumber pipewire lib32-pipewire pipewire-jack lib32-pipewire-jack \
    pipewire-alsa pipewire-pulse alsa-utils alsa-plugins lib32-alsa-plugins ffmpeg ranger gtk2 gtk3 gtk4 \
    zip unrar p7zip unzip i2pd nyx tor privoxy noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu ttf-liberation \
    qt5-base qt6-base jre-openjdk-headless
echo 'Installing the extra packages.'
sudo pacman -S --noconfirm vlc mpd firefox firefox-i18n-ru thunderbird thunderbird-i18n-ru chromium gimp \
    steam steam-native-runtime retroarch libretro wine wine-mono wine-gecko ly i3 picom gvfs rofi dunst libnotify \
    scrot rxvt-unicode speedtest-cli pwgen libreoffice-fresh libreoffice-fresh-ru discord telegram-desktop yt-dlp code \
    qbittorrent ppp

echo 'Installing the Arch User Repository.'
cd /tmp;git clone https://aur.archlinux.org/package-query.git;git clone https://aur.archlinux.org/yaourt.git;cd package-query/;makepkg -si;cd ..;cd yaourt/;makepkg -si
yaourt -S --needed --noconfirm xcursor-dmz
yaourt -Syua
