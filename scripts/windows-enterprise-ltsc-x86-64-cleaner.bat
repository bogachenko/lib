@echo off

title Windows 10 Enterprise LTSC Cleaner

:: Windows 10 Enterprise LTSC Cleaner
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
:: License: MIT license <https://raw.githubusercontent.com/bogachenko/lib/master/LICENSE.md>
:: Last update: June 2024
:: Donate:
::          Bitcoin (BTC) - 3JfwK6ULJ1xY8xjpu6uzpBKLm4ghkdSBzG
::          Ethereum (ETH) - 0xb08eE5bC90C2fCAFE453b7d536f158215Cca979A
::          Tron (TRX) - THXmTuAbnMrUWFXPJn92YkWbEzjBDGAEXZ
::          Toncoin (TON) - UQDohNKO4GJj4VGDNwK2GYXtnvWbwgiECYB6V6aijfS2RY28
::          Dogecoin (DOGE) - DFuMmJb8DstHZQpqaCtQaeW5D6CVZHvqFa
::          Litecoin (LTC) - LfW2NSBZ3UwG7Sm9MWKLjEdVt45XVZ1je2
::          Binance Coin (BNB) uses the ETH address.
::          Tether (USDT) or USD Coin (USDC) uses ETH, TRX or TON addresses, depending on the type of chain chosen.

echo GETTING SUPERUSER RIGHTS.
timeout /t "1" /nobreak >nul
setlocal enabledelayedexpansion
set "params=%*"
cd /d "%~dp0"
if exist "%temp%\getadmin.vbs" (
    del "%temp%\getadmin.vbs"
)
fsutil dirty query %systemdrive% 1>nul 2>nul
if errorlevel 1 (
    (
        echo Set UAC = CreateObject^("Shell.Application"^)
        echo UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 !params!", "", "runas", 1
    ) >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
)
timeout /t "1" /nobreak >nul

echo Running a script to clear the clipboard.
echo off | clip

echo STOPPING A PROCESSES IN THE OPERATING SYSTEM.
timeout /t "1" /nobreak >nul
echo Running a script to stop the process The Windows Explorer in the operating system.
tasklist /fi "imagename eq explorer.exe" 2>nul | find /i "explorer.exe" && (
    taskkill /f /im explorer.exe
) || (
    echo The Windows Explorer process was not found.
)
timeout /t "1" /nobreak >nul
echo Running a script to stop the process Firefox in the operating system.
tasklist /fi "imagename eq firefox.exe" 2>nul | find /i "firefox.exe" && (
    taskkill /f /im firefox.exe
) || (
    echo Firefox process was not found.
)
timeout /t "1" /nobreak >nul
echo Running a script to stop the process Discord in the operating system.
tasklist /fi "imagename eq discord.exe" 2>nul | find /i "discord.exe" && (
    taskkill /f /im discord.exe
) || (
    echo Discord process was not found.
)
timeout /t "1" /nobreak >nul
echo Running a script to stop the process Steam in the operating system.
tasklist /fi "imagename eq steam.exe" 2>nul | find /i "steam.exe" && (
    taskkill /f /im steam.exe
) || (
    echo Steam process was not found.
)
timeout /t "1" /nobreak >nul
echo Running a script to stop the process Spotify in the operating system.
tasklist /fi "imagename eq spotify.exe" 2>nul | find /i "spotify.exe" && (
    taskkill /f /im spotify.exe
) || (
    echo Spotify process was not found.
)
timeout /t "1" /nobreak >nul
echo Running a script to stop the process Chromium in the operating system.
tasklist /fi "imagename eq chromium.exe" 2>nul | find /i "chromium.exe" && (
    taskkill /f /im chromium.exe
) || (
    echo Chromium process was not found.
)
timeout /t "1" /nobreak >nul
echo Running a script to stop the process Google Chrome in the operating system.
tasklist /fi "imagename eq chrome.exe" 2>nul | find /i "chrome.exe" && (
    taskkill /f /im chrome.exe
) || (
    echo Google Chrome process was not found.
)
timeout /t "1" /nobreak >nul
echo Running a script to stop the process AdGuard in the operating system.
tasklist /fi "imagename eq adguard.exe" 2>nul | find /i "adguard.exe" && (
    taskkill /f /im adguard.exe
) || (
    echo AdGuard process was not found.
)
timeout /t "1" /nobreak >nul
echo Running a script to stop the process AdGuard VPN in the operating system.
tasklist /fi "imagename eq adguardvpn.exe" 2>nul | find /i "adguardvpn.exe" && (
    taskkill /f /im adguardvpn.exe
) || (
    echo AdGuard VPN process was not found.
)
timeout /t "1" /nobreak >nul
echo Running a script to stop the process Telegram in the operating system.
tasklist /fi "imagename eq telegram.exe" 2>nul | find /i "telegram.exe" && (
    taskkill /f /im telegram.exe
) || (
    echo Telegram process was not found.
)
timeout /t "1" /nobreak >nul
echo Running a script to stop the process Thunderbird in the operating system.
tasklist /fi "imagename eq thunderbird.exe" 2>nul | find /i "thunderbird.exe" && (
    taskkill /f /im thunderbird.exe
) || (
    echo Thunderbird process was not found.
)

echo Stop services
rem Windows Update Center
net stop wuauserv

echo Flush DNS Cache
timeout /t "1" /nobreak >nul
ipconfig /flushdns
timeout /t "1" /nobreak >nul

echo Deleting Recovery points
timeout /t "1" /nobreak >nul
vssadmin delete shadows /all /quiet
timeout /t "1" /nobreak >nul

echo Tor Browser
timeout /t "1" /nobreak >nul
for %%S in (
    "cookies.sqlite"
    "favicons.sqlite"
    "formhistory.sqlite"
    "places.sqlite"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\Tor Browser\Browser\TorBrowser\Data\Browser\profile.default\%%~S' -Force"
)
for %%S in (
    "datareporting"
    "shader-cache"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\Tor Browser\Browser\TorBrowser\Data\Browser\profile.default\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul

echo Firefox Browser
timeout /t "1" /nobreak >nul
for %%S in (
    "cookies.sqlite"
    "cookies.sqlite-shm"
    "cookies.sqlite-wal"
    "places.sqlite"
    "places.sqlite-shm"
    "places.sqlite-wal"
    "favicons.sqlite-shm"
    "favicons.sqlite-wal"
    "favicons.sqlite"
    "formhistory.sqlite"
    "sessionCheckpoints.json"
    "SiteSecurityServiceState.txt"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\%%~S' -Force"
)
for %%S in (
    "shader-cache"
    "sessionstore-backups"
    "crashes"
    "datareporting"
    "minidumps"
    "personality-provider"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\%%~S' -Recurse -Force"
)
for %%S in (
    "Background Tasks Profiles"
    "Crash Reports"
    "Pending Pings"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\Mozilla\Firefox\%%~S' -Recurse -Force"
)
for %%S in (
    "Extensions"
    "SystemExtensionsDev"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\Mozilla\%%~S' -Recurse -Force"
)
powershell.exe -Command "Remove-Item -Path '%PROGRAMDATA%\Mozilla-*' -Recurse -Force"
powershell.exe -Command "Remove-Item -Path '%LOCALAPPDATA%\Mozilla\Firefox\Profiles\%USERNAME%' -Recurse -Force"
powershell.exe -Command "Remove-Item -Path '%USERPROFILE%\AppData\LocalLow\Mozilla' -Recurse -Force"
timeout /t "1" /nobreak >nul

echo Thunderbird
timeout /t "1" /nobreak >nul
for %%S in (
    "Crash Reports"
    "Pending Pings"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\Thunderbird\%%~S' -Recurse -Force"
)
for %%S in (
    "crashes"
    "minidumps"
    "datareporting"
    "shader-cache"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\Thunderbird\Profiles\%USERNAME%\%%~S' -Recurse -Force"
)
for %%S in (
    "favicons.sqlite"
    "favicons.sqlite-shm"
    "favicons.sqlite-wal"
    "cookies.sqlite"
    "cookies.sqlite-shm"
    "cookies.sqlite-wal"
    "places.sqlite"
    "places.sqlite-shm"
    "places.sqlite-wal"
    "history.sqlite"
    "history.sqlite-shm"
    "history.sqlite-wal"
    "formhistory.sqlite"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\Thunderbird\Profiles\%USERNAME%\%%~S' -Force"
)
rd "%LOCALAPPDATA%\Thunderbird\Profiles\%USERNAME%" /s /q
timeout /t "1" /nobreak >nul

echo DirectX
timeout /t "1" /nobreak >nul
rd "%LOCALAPPDATA%\D3DSCache" /s /q
timeout /t "1" /nobreak >nul

echo Discord
timeout /t "1" /nobreak >nul
for %%S in (
    "GPUCache"
    "Code Cache"
    "Cache"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\discord\%%~S' -Recurse -Force"
)
del "%LOCALAPPDATA%\Discord\*.log" /s /q
timeout /t "1" /nobreak >nul

echo Spotify
timeout /t "1" /nobreak >nul
del "%LOCALAPPDATA%\Spotify\Browser\*.log" /s /q
for %%S in (
    "Cache"
    "databases"
    "GPUCache"
    "Service Worker"
) do (
    powershell.exe -Command "Remove-Item -Path '%LOCALAPPDATA%\Spotify\Browser\%%~S' -Recurse -Force"
)
for %%S in (
    "Data"
    "Storage"
) do (
    powershell.exe -Command "Remove-Item -Path '%LOCALAPPDATA%\Spotify\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul

echo Steam
timeout /t "1" /nobreak >nul
del "%PROGRAMFILES(x86)%\Steam\*.log" /s /q
rd "%LOCALAPPDATA%\Steam\htmlcache" /s /q
for %%S in (
    "logs"
    "dumps"
) do (
    powershell.exe -Command "Remove-Item -Path '%PROGRAMFILES(x86)%\Steam\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul

echo Chromium Browser
timeout /t "1" /nobreak >nul
del "%LOCALAPPDATA%\Chromium\User Data\BrowserMetrics-*" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\BrowserMetrics" /s /q
for %%S in (
    "Cache"
    "Code Cache"
    "commerce_subscription_db"
    "coupon_db"
    "databases"
    "DawnCache"
    "Extension State"
    "Feature Engagement Tracker"
    "GPUCache"
    "IndexedDB"
    "Local Storage"
    "Network"
    "optimization_guide_hint_cache_store"
    "optimization_guide_model_metadata_store"
    "Platform Notifications"
    "Session Storage"
    "Sessions"
    "shared_proto_db"
    "Site Characteristics Database"
    "VideoDecodeStats"
    "WebrtcVideoStats"
) do (
    powershell.exe -Command "Remove-Item -Path '%LOCALAPPDATA%\Chromium\User Data\Default\%%~S' -Recurse -Force"
)
for %%S in (
    "Favicons-journal"
    "Favicons"
    "heavy_ad_intervention_opt_out.db-journal"
    "heavy_ad_intervention_opt_out.db"
    "History-journal"
    "History"
    "Network Action Predictor-journal"
    "Network Action Predictor"
    "Shortcuts-journal"
    "Shortcuts"
    "Top Sites-journal"
    "Top Sites"
    "Visited Links"
    "Web Data-journal"
    "Web Data"
) do (
    powershell.exe -Command "Remove-Item -Path '%LOCALAPPDATA%\Chromium\User Data\Default\%%~S' -Force"
)
timeout /t "1" /nobreak >nul

echo AdGuard VPN
timeout /t "1" /nobreak >nul
for %%S in (
    "Logs"
    "Crashes"
    "Temp"
) do (
    powershell.exe -Command "Remove-Item -Path '%PROGRAMDATA%\AdguardVpn\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul

echo AdGuard
timeout /t "1" /nobreak >nul
for %%S in (
    "Logs"
    "Crashes"
    "Temp"
) do (
    powershell.exe -Command "Remove-Item -Path '%PROGRAMDATA%\Adguard\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul

echo qBittorrent
rd "%LOCALAPPDATA%\qBittorrent" /s /q

echo Rockstar Games Launcher
del "%PROGRAMDATA%\Rockstar Games\Launcher\*.log" /s /q
rd "%LOCALAPPDATA%\Rockstar Games\Launcher\CrashLogs" /s /q

echo SquirrelTemp
rd "%LOCALAPPDATA%\SquirrelTemp" /s /q

echo GitHub Desktop
rd "%LOCALAPPDATA%\GitHubDesktop\*.log" /s /q

echo Windows
cleanmgr /sagerun:1 /s /q
rd "%WINDIR%\Panther" /s /q
rd "%WINDIR%\softwareDistribution" /s /q
rd "%WINDIR%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization" /s /q
rd "%WINDIR%\ServiceProfiles\NetworkService\AppData\LocalLow\Microsoft\CryptnetUrlCache" /s /q
rd "%PROGRAMDATA%\USOShared\Logs" /s /q
del "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" /s /q
del "%PROGRAMDATA%\Microsoft\Search\Data\Applications\Windows\*.*" /s /q
del "%WINDIR%\*.log" /s /q
del "%WINDIR%\Debug\*.log" /s /q
del "%WINDIR%\inf\*.log" /s /q
powershell.exe -command "Remove-item '%LOCALAPPDATA%\Microsoft\CLR_*'" -Recurse
powershell.exe -command "Remove-item '%WINDIR%\System32\sru\SRU*.*'" -Recurse
rd "%APPDATA%\Microsoft\Windows\Recent" /s /q
rd "%LOCALAPPDATA%\ElevatedDiagnostics" /s /q
rd "%LOCALAPPDATA%\Microsoft\Windows\WebCache" /s /q
rd "%LOCALAPPDATA%\Temp" /s /q
rd "%PROGRAMDATA%\Microsoft\Diagnosis" /s /q
rd "%PROGRAMDATA%\Microsoft\Windows Defender\" /s /q
rd "%SYSTEMDRIVE%\$Recycle.bin" /s /q
rd "%USERPROFILE%\AppData\LocalLow\Microsoft\CryptnetUrlCache" /s /q
rd "%WINDIR%\DiagTrack" /s /q
rd "%WINDIR%\Installer" /s /q
rd "%WINDIR%\Logs" /s /q
del "%WINDIR%\Logs\waasmedic\*.etl" /s /q
rd "%WINDIR%\Prefetch" /s /q
rd "%WINDIR%\SoftwareDistribution" /s /q
rd "%WINDIR%\Temp" /s /q
rd "%LOCALAPPDATA%\Microsoft\Windows\Caches" /s /q
rd "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files" /s /q
rd "%WINDIR%\Offline Web Pages" /s /q
rd "%PROGRAMDATA%\Microsoft\Windows\WER" /s /q
del "%LOCALAPPDATA%\IconCache.db" /s /q
rd "%LOCALAPPDATA%\cache" /s /q
rd "%WINDIR%\LiveKernelReports" /s /q
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
Dism.exe /online /Cleanup-Image /StartComponentCleanup

echo Microsoft Office
rd "%APPDATA%\Microsoft\Office" /s /q
rd "%LOCALAPPDATA%\Microsoft\Office" /s /q

echo Nvidia
rd "%LOCALAPPDATA%\NVIDIA\DXCache" /s /q
rd "%LOCALAPPDATA%\NVIDIA\GLCache" /s /q
rd "%PROGRAMDATA%\NVIDIA Corporation" /s /q
rd "%PROGRAMDATA%\NVIDIA" /s /q
rd "%PROGRAMDATA%\NVIDIA Corporation\Installer2" /s /q

echo Intel
rd "%PROGRAMDATA%\Intel" /s /q
rd "%USERPROFILE%\AppData\LocalLow\Intel\ShaderCache" /s /q

echo Telegram
del "%APPDATA%\Telegram Desktop\log.txt" /s /q
powershell.exe -command "Remove-item '%APPDATA%\Telegram Desktop\log_*.txt'" -Recurse
rd "%APPDATA%\Telegram Desktop\tdata\dumps" /s /q
rd "%APPDATA%\Telegram Desktop\tdata\user_data" /s /q

echo Visual Studio Code
rd "%APPDATA%\Code\User\History" /s /q
for %%S in (
    "logs"
    "Cache"
    "GPUCache"
    "CachedData"
    "Crashpad"
    "Code Cache"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\Code\%%~S' -Recurse -Force"
)
del "%APPDATA%\Microsoft VS Code\*.log" /s /q

echo VLC media player
rd "%APPDATA%\vlc\crashdump" /s /q

echo Start process
rem Windows Explorer
start explorer.exe

echo Start services
rem Windows Update Center
net start wuauserv

echo Shutdown
exit