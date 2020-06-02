#!/bin/bash

# Bomjaro: Automatic configuration of Manjaro.
# Author: Bogachenko Vyacheslav
# Mail: bogachenkove@gmail.com

clear
echo "Checking network connection."
echo "Please wait..."
ping google.com -c 1 >/dev/null 2>&1

if [ $? != "0" ]
	echo "Good, you have an internet connection!"
then
    echo "Network error, please check network connection!"
    pause
fi
sleep 5
su
pacman-mirrors --fasttrack
pacman -Syyuu
pacman -S firefox-i18n-ru vim vlc steam-native-runtime steam opera opera-ffmpeg-codecs gimp ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-hanazono ttf-ubuntu-font-family jre-openjdk jdk-openjdk jre-openjdk-headless chromium capitaine-cursors discord telegram-desktop zsh thunderbird-i18n-ru thunderbird gparted wine wine-gecko wine-mono virtualbox
chsh -s /bin/zsh
cd /home/$USER
rm -rf .bash_history .bash_logout .bash_profile .bashrc
systemctl enable bumblebeed
systemctl restart systemd-binfmt
gpasswd -a $USER bumblebee
rm -rf /home/$USER/.mozilla/
cd /home/$USER/.mozilla/firefox/
mkdir $USER
rm /etc/hosts
wget -P /etc/ https://raw.githubusercontent.com/bogachenko/filterlist/personal/hosts
pacman -S --needed base-devel git wget yajl
cd /tmp/
git clone https://aur.archlinux.org/package-query.git
cd package-query/
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si
cd ..
rm -dR yaourt/ package-query/
rm -rf /tmp/*
exit
sudo chsh -s /bin/zsh
yaourt -S ttf-ms-fonts vscodium-bin github-desktop-bin
ln -s /usr/share/icons/capitaine-cursors-light/cursors ~/.icons/default/cursors
sudo pacman -Syyuu
yaourt -Syu
sudo paccache -r
sudo pacman -Scc
sudo reboot
