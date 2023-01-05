#!/bin/bash

# Arch Linux x86_64
# Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

USERNAME="$(whoami)"

# Clear the console.
clear

echo Firefox Browser
rm "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\favicons.sqlite-shm" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\favicons.sqlite-wal" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\favicons.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\formhistory.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\sessionCheckpoints.json" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\SiteSecurityServiceState.txt" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\Extensions" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\Firefox\Background Tasks Profiles" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\Firefox\Crash Reports" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\Firefox\Pending Pings" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\crashes" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\datareporting" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\minidumps" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\personality-provider" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\SystemExtensionsDev" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\%USERNAME%" /s /q > nul 2>&1
rd "%USERPROFILE%\AppData\LocalLow\Mozilla" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\cookies.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\cookies.sqlite-shm" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\cookies.sqlite-wal" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\places.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\places.sqlite-shm" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\places.sqlite-wal" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\shader-cache" /s /q > nul 2>&1
rd "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\sessionstore-backups" /s /q > nul 2>&1

# Removing debris.
sudo rm -rf /root/.bash_history /root/.bashrc /root/.bash_logout /root/.bash_profile /root/.bash_functions /root/.bash_aliases ~/.bashrc ~/.bash_history ~/.bash_logout ~/.cache/thumbnails ~/.bash_profile ~/.bash_functions ~/.bash_aliases /tmp/* ~/.local/share/Trash/*
sudo pacman -Scc
sudo paccache -r
