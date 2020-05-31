#!/bin/bash
# Automatic configuration of Manjaro.
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
sudo pacman -Syyuu
sudo pacman -S firefox-i18n-ru vim vlc steam-native-runtime steam
sudo systemctl enable bumblebeed
sudo gpasswd -a $USER bumblebee
sudo rm -rf /home/bogachenko/.mozilla/ 
