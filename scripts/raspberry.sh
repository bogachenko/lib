#!/bin/bash

# Raspberry Pi

TELLUSER='echo $USER'
echo 'Hello, $USER'

# Installing the SSH package and starting its service.
sudo apt install -y ssh
sudo systemctl enable ssh.service && sudo systemctl start ssh.service

# Updating repository data and installing updates.
sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y

# Adding the Kali repository.
sudo sh -c '# deb http://http.kali.org/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list"

# Running the standard config file for the Raspberry Pi.
sudo raspi-config

# Downloading and installing Adguard Home.
curl -sSL https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh
clear

# Installing main packages.
sudo apt --no-install-suggests --no-install-recommends install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra git vim mc htop vlc neofetch hostapd dnsmasq resolvconf
sudo apt install -y xrdp fonts-noto ttf-mscorefonts-installer tor privoxy qbittorrent

# Convert SOCKS to HTTP proxy via Privoxy.
echo "forward-socks5 / localhost:9050 ." | sudo tee /etc/privoxy/config
echo "forward-socks4 / localhost:9050 ." | sudo tee /etc/privoxy/config
echo "forward-socks4a / localhost:9050 ." | sudo tee /etc/privoxy/config

# Enabling daemons and starting them for my main packages.
sudo systemctl enable resolvconf.service && sudo systemctl start resolvconf.service
sudo systemctl enable tor.service && sudo systemctl start tor.service
sudo systemctl enable privoxy.service && sudo systemctl start privoxy.service

# Setting up static DNS (which I gave for the Raspberry Pi in my router settings) for Adguard Home.
sudo cat > /etc/resolvconf/resolv.conf.d/head <<EOF 
nameserver 192.168.0.104
nameserver 192.168.0.102
EOF

# Updating configuration files for DNS and setting it to default on reboot.
sudo resolvconf --enable-updates
sudo resolvconf -u
cat /etc/resolv.conf

sleep .5

# Setting up the configuration for my VIM
cat > ~/.vimrc <<EOF 
set number " Show absolute line numbers on the left.
filetype plugin on " Auto-detect un-labeled filetypes
syntax on " Turn syntax highlighting on
set ai " Sets auto-indentation
set si " Sets smart-indentation
set noswapfile " Prevent vim from creating .swp files
set tabstop=2 " Tab equal 2 spaces (default 4)
set wrap " Wrap overflowing lines
set hlsearch " When searching (/), highlights matches as you go
set incsearch " When searching (/), display results as you type (instead of only upon ENTER)
set ignorecase " When searching (/), ignore case entirely
set smartcase " When searching (/), automatically switch to a case-sensitive search if you use any capital letters
set cmdheight=2 " Set height of the command bar to 2
set ttyfast " Boost speed by altering character redraw rates to your terminal
set encoding=utf8 " Set text encoding as utf8
set clipboard=unnamed " Use the OS clipboard by default
EOF

clear

# Running package clean-up using apt autoclean and autoremove.
sudo apt autoremove -y && apt autoclean -y
