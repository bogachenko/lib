## Raspberry Pi

sudo systemctl enable ssh && sudo systemctl start ssh
sudo apt update && sudo apt upgrade
sudo raspi-config
clear
sudo apt --no-install-suggests --no-install-recommends install chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra git tor vim ssh mc htop vlc neofetch hostapd dnsmasq
curl -sSL https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh
sudo apt install -y xrdp fonts-noto ttf-mscorefonts-installer
sudo vim /etc/resolv.conf
clear
sudo apt autoremove
