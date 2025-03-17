@echo off

title Windows 10 Enterprise LTSC Cleaner

::  Windows 10 Enterprise LTSC Cleaner
::  Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
::  License: MIT license <https://raw.githubusercontent.com/bogachenko/lib/master/LICENSE.md>
::  Last update: March 2025
::  Bitcoin (BTC) - bc1qnmderzmag45pa3a0jyaqah654x0055n6y8madh
::  Bitcoin Cash (BCH) - qzptqmjr0vrj053wgcxa5yesdlejk973xq9xctmxcg
::  Binance Coin (BNB) 0xE4869C3140134522383E316d329612bC886F85E2
::  Ethereum (ETH) - 0xE4869C3140134522383E316d329612bC886F85E2
::  Ethereum Classic (ETC) - 0x4A11511a9C69eA1CFa8B1135c9B8A3B27c84eE55
::  Tron (TRX) - TW8ocDJLPTnVFG4Karb7zctbBfjFaZfuJn
::  Toncoin (TON) - UQA5s93oUhxmmkaivrZim1VOh9v-D6CI15jlk80FP6wWtYrw
::  Dogecoin (DOGE) - D7BHKJ4ymU5uZKrju5BbYQpSfdENc5qtr1
::  Litecoin (LTC) - ltc1q3t9hmgqyze8qlrw56rxepyw8ll44jcl7uc8z4p
::  Solana (SOL) - 5fsRA5NiQKX5GLzatbmYS7UbZ9Q2LMqdCH7pBgtrXDJM
::  Ripple (XRP) - rnEWArfEDm4yFJeG7xnvDCkW7GKperxf6t
::  Dash (DASH) - XkQFy1UfKCCpiSw391A5YYTEYEKYvxVoxE
::  Cardano (ADA) - addr1q8yjcner4yq7kgd0gleq4qf0gae2xemvvpu790nhfk7a3y8gje4zxphcq0kyg3ry5yvgtzy2huhd49l9rdwmh6khmm4se2er3a
::  Zcash (ZEC) - t1N8QRJg6jFt2m92DyFkYVDEv36ZK3JnQP2

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
    exit /b
)
timeout /t "1" /nobreak >nul

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

echo STOPPING A SERVICES IN THE OPERATING SYSTEM.
timeout /t "1" /nobreak >nul
echo Windows Update Center
net stop wuauserv
timeout /t "1" /nobreak >nul

echo STARTING THE SCRIPT.
timeout /t "1" /nobreak >nul
echo Running a script to clear the clipboard.
timeout /t "1" /nobreak >nul
echo off | clip
timeout /t "1" /nobreak >nul
echo Running a script to clean up the DNS cache.
timeout /t "1" /nobreak >nul
ipconfig /flushdns
timeout /t "1" /nobreak >nul
echo Running a script to delete recovery points.
timeout /t "1" /nobreak >nul
vssadmin delete shadows /all /quiet
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Tor Browser.
timeout /t "1" /nobreak >nul
for %%S in (
    "cookies.sqlite"
    "favicons.sqlite"
    "formhistory.sqlite"
    "places.sqlite"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\Tor Browser\Browser\TorBrowser\Data\Browser\profile.default\%%~S' -Force"
)
for %%S in (
    "datareporting"
    "shader-cache"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\Tor Browser\Browser\TorBrowser\Data\Browser\profile.default\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Firefox browser.
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%PROGRAMDATA%\Mozilla-*' -Recurse -Force"
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Mozilla\Firefox\Profiles\%USERNAME%' -Recurse -Force"
powershell -Command "Remove-Item -Path '%USERPROFILE%\AppData\LocalLow\Mozilla' -Recurse -Force"
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
    powershell -Command "Remove-Item -Path '%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\%%~S' -Force"
)
for %%S in (
    "shader-cache"
    "sessionstore-backups"
    "crashes"
    "datareporting"
    "minidumps"
    "personality-provider"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\%%~S' -Recurse -Force"
)
for %%S in (
    "Background Tasks Profiles"
    "Crash Reports"
    "Pending Pings"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\Mozilla\Firefox\%%~S' -Recurse -Force"
)
for %%S in (
    "Extensions"
    "SystemExtensionsDev"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\Mozilla\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Thunderbird mail. 
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Thunderbird\Profiles\%USERNAME%' -Recurse -Force"
for %%S in (
    "Crash Reports"
    "Pending Pings"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\Thunderbird\%%~S' -Recurse -Force"
)
for %%S in (
    "crashes"
    "minidumps"
    "datareporting"
    "shader-cache"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\Thunderbird\Profiles\%USERNAME%\%%~S' -Recurse -Force"
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
    powershell -Command "Remove-Item -Path '%APPDATA%\Thunderbird\Profiles\%USERNAME%\%%~S' -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the DirectX.
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\D3DSCache' -Recurse -Force"
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Discord.
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Discord\*.log' -Force"
for %%S in (
    "GPUCache"
    "Code Cache"
    "Cache"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\discord\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Spotify.
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Spotify\Browser\*.log' -Force"
for %%S in (
    "Cache"
    "databases"
    "GPUCache"
    "Service Worker"
) do (
    powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Spotify\Browser\%%~S' -Recurse -Force"
)
for %%S in (
    "Data"
    "Storage"
) do (
    powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Spotify\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Steam.
timeout /t "1" /nobreak >nul
del "%PROGRAMFILES(x86)%\Steam\*.log" /s /q
rd "%LOCALAPPDATA%\Steam\htmlcache" /s /q
for %%S in (
    "logs"
    "dumps"
) do (
    powershell -Command "Remove-Item -Path '%PROGRAMFILES(x86)%\Steam\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Chromium browser.
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Chromium\User Data\BrowserMetrics' -Recurse -Force"
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Chromium\User Data\BrowserMetrics-*' -Force"
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
    powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Chromium\User Data\Default\%%~S' -Recurse -Force"
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
    powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Chromium\User Data\Default\%%~S' -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the AdGuard VPN.
timeout /t "1" /nobreak >nul
for %%S in (
    "Logs"
    "Crashes"
    "Temp"
) do (
    powershell -Command "Remove-Item -Path '%PROGRAMDATA%\AdguardVpn\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the AdGuard.
timeout /t "1" /nobreak >nul
for %%S in (
    "Logs"
    "Crashes"
    "Temp"
) do (
    powershell -Command "Remove-Item -Path '%PROGRAMDATA%\Adguard\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the qBittorrent.
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\qBittorrent' -Recurse -Force"
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Rockstar Games Launcher.
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Rockstar Games\Launcher\CrashLogs' -Recurse -Force"
powershell -Command "Remove-Item -Path '%PROGRAMDATA%\Rockstar Games\Launcher\*.log' -Force"
timeout /t "1" /nobreak >nul
echo Running a script to clean up the SquirrelTemp.
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\SquirrelTemp' -Recurse -Force"
timeout /t "1" /nobreak >nul
echo Running a script to clean up the GitHub Desktop.
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\GitHubDesktop\*.log' -Force"
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Windows.
timeout /t "1" /nobreak >nul
cleanmgr /sagerun:1 /s /q
dism /online /Cleanup-Image /StartComponentCleanup /ResetBase
dism /online /Cleanup-Image /StartComponentCleanup
powershell -command "Remove-item '%WINDIR%\*.log' -Force"
powershell -command "Remove-item '%WINDIR%\Debug\*.log' -Force"
powershell -command "Remove-item '%WINDIR%\inf\*.log' -Force"
powershell -command "Remove-item '%PROGRAMDATA%\Microsoft\Search\Data\Applications\Windows\*.*' -Force"
powershell -command "Remove-item '%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db' -Force"
powershell -command "Remove-item '%LOCALAPPDATA%\IconCache.db' -Force"
powershell -command "Remove-item '%LOCALAPPDATA%\Microsoft\CLR_*' -Recurse -Force"
powershell -command "Remove-item '%WINDIR%\System32\sru\SRU*.*' -Recurse -Force"
powershell -command "Remove-item '%WINDIR%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization' -Recurse -Force"
powershell -command "Remove-item '%WINDIR%\ServiceProfiles\NetworkService\AppData\LocalLow\Microsoft\CryptnetUrlCache' -Recurse -Force"
powershell -command "Remove-item '%PROGRAMDATA%\USOShared\Logs' -Recurse -Force"
powershell -command "Remove-item '%PROGRAMDATA%\Microsoft\Windows\WER' -Recurse -Force"
powershell -command "Remove-item '%LOCALAPPDATA%\cache' -Recurse -Force"
powershell -command "Remove-item '%USERPROFILE%\AppData\LocalLow\Microsoft\CryptnetUrlCache' -Recurse -Force"
powershell -command "Remove-item '%SYSTEMDRIVE%\$Recycle.bin' -Recurse -Force"
powershell -command "Remove-item '%APPDATA%\Microsoft\Windows\Recent' -Recurse -Force"
for %%S in (
    "DiagTrack"
    "Installer"
    "Prefetch"
    "SoftwareDistribution"
    "Temp"
    "LiveKernelReports"
    "Logs"
    "Offline Web Pages"
    "Panther"
) do (
    powershell -Command "Remove-Item -Path '%WINDIR%\%%~S' -Recurse -Force"
)
for %%S in (
    "WebCache"
    "Temporary Internet Files"
    "Caches"
) do (
    powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\Microsoft\Windows\%%~S' -Recurse -Force"
)
for %%S in (
    "Temp"
    "ElevatedDiagnostics"
) do (
    powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\%%~S' -Recurse -Force"
)
for %%S in (
    "Diagnosis"
    "Windows Defender"
) do (
    powershell -Command "Remove-Item -Path '%PROGRAMDATA%\Microsoft\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Microsoft Office.
timeout /t "1" /nobreak >nul
powershell -command "Remove-item '%APPDATA%\Microsoft\Office' -Recurse -Force"
powershell -command "Remove-item '%LOCALAPPDATA%\Microsoft\Office' -Recurse -Force"
timeout /t "1" /nobreak >nul
echo Running a script to clean up the NVIDIA.
timeout /t "1" /nobreak >nul
powershell -command "Remove-item '%PROGRAMDATA%\NVIDIA Corporation' -Recurse -Force"
powershell -command "Remove-item '%PROGRAMDATA%\NVIDIA' -Recurse -Force"
for %%S in (
    "DXCache"
    "GLCache"
) do (
    powershell -Command "Remove-Item -Path '%LOCALAPPDATA%\NVIDIA\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Intel.
timeout /t "1" /nobreak >nul
powershell -command "Remove-item '%PROGRAMDATA%\Intel' -Recurse -Force"
powershell -command "Remove-item '%USERPROFILE%\AppData\LocalLow\Intel\ShaderCache' -Recurse -Force"
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Telegram.
timeout /t "1" /nobreak >nul
for %%S in (
    "log.txt"
    "log_*.txt"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\Telegram Desktop\%%~S' -Force"
)
for %%S in (
    "dumps"
    "user_data"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\Telegram Desktop\tdata\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the Visual Studio Code.
timeout /t "1" /nobreak >nul
powershell -Command "Remove-Item -Path '%APPDATA%\Microsoft VS Code\*.log' -Force"
powershell -command "Remove-item '%APPDATA%\Code\User\History' -Recurse -Force"
for %%S in (
    "logs"
    "Cache"
    "GPUCache"
    "CachedData"
    "Crashpad"
    "Code Cache"
) do (
    powershell -Command "Remove-Item -Path '%APPDATA%\Code\%%~S' -Recurse -Force"
)
timeout /t "1" /nobreak >nul
echo Running a script to clean up the VLC media player.
powershell -Command "Remove-Item -Path '%APPDATA%\vlc\crashdump' -Recurse -Force"
timeout /t "1" /nobreak >nul

echo STARTING A PROCESSES IN THE OPERATING SYSTEM.
timeout /t "1" /nobreak >nul
echo Running a script to stop the process The Windows Explorer in the operating system.
tasklist /fi "imagename eq explorer.exe" 2>nul | find /i "explorer.exe" && (
    start explorer.exe
) || (
    echo The Windows Explorer process was not found.
)

echo STARTING A SERVICES IN THE OPERATING SYSTEM.
timeout /t "1" /nobreak >nul
echo Windows Update Center
net start wuauserv
timeout /t "1" /nobreak >nul

echo ENDING THE SCRIPT.
exit