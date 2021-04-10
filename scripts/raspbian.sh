## Raspberry Pi OS

sudo apt update && sudo apt upgrade
sudo raspi-config
clear
sudo apt --no-install-suggests --no-install-recommends install git tor vim ssh mc htop firefox-esr vlc neofetch firefox-esr
sudo apt install xrdp
nano /etc/resolv.conf
## sudo purge chromium-browser
curl -sSL https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh
clear
sudo apt autoremove
