## Raspberry Pi

TELLUSER='echo $USER'
echo 'Hello, $USER'

# Installing the SSH package and starting its service.
sudo apt install -y ssh
sudo systemctl enable ssh.service && sudo systemctl start ssh.service

# Updating repository data and installing updates.
sudo apt update && sudo apt upgrade

# Adding the Kali repository.
sudo sh -c "# deb http://http.kali.org/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list"

# Running the standard config file for the Raspberry Pi.
sudo raspi-config

# Downloading and installing Adguard Home.
curl -sSL https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh
clear

# Installing main packages.
sudo apt --no-install-suggests --no-install-recommends install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra git tor vim mc htop vlc neofetch hostapd dnsmasq resolvconf privoxy
sudo apt install -y xrdp fonts-noto ttf-mscorefonts-installer

# Enabling daemons and starting them for my main packages.
sudo systemctl enable resolvconf.service && sudo systemctl start resolvconf.service
sudo systemctl start tor.service && sudo systemctl enable tor.service
sudo systemctl start privoxy.service && sudo systemctl enable privoxy.service

# Setting up static DNS (which I gave for the Raspberry Pi in my router settings) for Adguard Home.
cat > /etc/resolvconf/resolv.conf.d/head <<EOF 
nameserver 192.168.0.104
nameserver 192.168.0.102
EOF

# Updating configuration files for DNS and setting it to default on reboot.
sudo resolvconf --enable-updates
sudo resolvconf -u
cat /etc/resolv.conf

sleep .5
clear
sudo apt autoremove
