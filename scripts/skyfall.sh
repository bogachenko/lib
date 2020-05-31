#!/bin/bash

# Skyfall: Automatic configuration of Manjaro.
# Author: Bogachenko Vyacheslav
# Mail: bogachenkove@gmail.com

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
pacman -Syyuu
pacman -S firefox-i18n-ru vim vlc steam-native-runtime steam opera opera-ffmpeg-codecs gimp ttf-liberation ttf-dejavu opendesktop-fonts ttf-bitstream-vera ttf-arphic-ukai ttf-arphic-uming ttf-hanazono
systemctl enable bumblebeed
gpasswd -a $USER bumblebee
rm -rf /home/bogachenko/.mozilla/
rm /etc/hosts
wget -P /etc/ https://raw.githubusercontent.com/bogachenko/filterlist/personal/hosts
