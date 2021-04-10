## Raspberry Pi OS

sudo systemctl enable ssh && sudo systemctl start ssh
sudo apt update && sudo apt upgrade
sudo raspi-config
clear
sudo apt --no-install-suggests --no-install-recommends install git tor vim ssh mc htop firefox-esr vlc neofetch firefox-esr firefox-esr-l10n-ru
curl -sSL https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh
sudo apt install xrdp
sudo vim /etc/resolv.conf
## sudo purge chromium-browser
clear
sudo apt autoremove
