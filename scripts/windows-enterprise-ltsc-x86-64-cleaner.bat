@echo off

title Windows 10 Enterprise LTSC Cleaner

:: Windows 10 Enterprise LTSC Cleaner
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
:: License: MIT license
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
timeout /t "5" /nobreak >nul
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

rem Clipboard Cleaner
echo off | clip

echo Stop processes
rem Windows Explorer
taskkill /f /im explorer.exe
rem Firefox
taskkill /f /im firefox.exe
rem Discord
taskkill /f /im discord.exe
rem Steam
taskkill /f /im steam.exe
rem Spotify
taskkill /f /im spotify.exe
rem Chromium
taskkill /f /im chrome.exe
rem AdGuard
taskkill /f /im adguard.exe
rem AdGuard VPN
taskkill /f /im adguardvpn.exe
rem Telegram
taskkill /f /im telegram.exe
rem Thunderbird
taskkill /f /im thunderbird.exe
rem Windows Security Health Service
taskkill /f /im SecurityHealthService.exe
taskkill /f /im SecurityHealthSystray.exe
rem Microsoft Compatibility Telemetry
taskkill /f /im compattelrunner.exe
rem Microsoft SmartScreen
taskkill /f /im smartscreen.exe

echo Stop services
rem Windows Update Center
net stop wuauserv

echo Flush DNS Cache
ipconfig /flushdns

echo Deleting Recovery points
vssadmin delete shadows /all /quiet

echo Tor Browser
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

echo Firefox Browser
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

echo Thunderbird
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

echo DirectX
rd "%LOCALAPPDATA%\D3DSCache" /s /q

echo Discord
for %%S in (
    "GPUCache"
    "Code Cache"
    "Cache"
) do (
    powershell.exe -Command "Remove-Item -Path '%APPDATA%\discord\%%~S' -Recurse -Force"
)
del "%LOCALAPPDATA%\Discord\*.log" /s /q

echo Spotify
del "%LOCALAPPDATA%\Spotify\Browser\*.log" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\Cache" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\databases" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\GPUCache" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\Service Worker" /s /q
rd "%LOCALAPPDATA%\Spotify\Data" /s /q
rd "%LOCALAPPDATA%\Spotify\Storage" /s /q

echo Steam
del "%PROGRAMFILES(x86)%\Steam\*.log" /s /q
rd "%LOCALAPPDATA%\Steam\htmlcache" /s /q
rd "%PROGRAMFILES(x86)%\Steam\dumps" /s /q
rd "%PROGRAMFILES(x86)%\Steam\logs" /s /q

echo Chromium Browser
del "%LOCALAPPDATA%\Chromium\User Data\BrowserMetrics-*" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Favicons-journal" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Favicons" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\heavy_ad_intervention_opt_out.db-journal" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\heavy_ad_intervention_opt_out.db" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\History-journal" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\History" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Network Action Predictor-journal" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Network Action Predictor" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Shortcuts-journal" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Shortcuts" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Top Sites-journal" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Top Sites" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Visited Links" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Web Data-journal" /s /q
del "%LOCALAPPDATA%\Chromium\User Data\Default\Web Data" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\BrowserMetrics" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Cache" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Code Cache" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\commerce_subscription_db" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\coupon_db" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\databases" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\DawnCache" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Extension State" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Feature Engagement Tracker" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\GPUCache" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\IndexedDB" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Local Storage" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Network" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\optimization_guide_hint_cache_store" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\optimization_guide_model_metadata_store" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Platform Notifications" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Session Storage" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Sessions" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\shared_proto_db" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Site Characteristics Database" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\VideoDecodeStats" /s /q
rd "%LOCALAPPDATA%\Chromium\User Data\Default\WebrtcVideoStats" /s /q

echo AdGuard VPN
rd "%PROGRAMDATA%\AdguardVpn\Logs" /s /q
rd "%PROGRAMDATA%\AdguardVpn\Crashes" /s /q
rd "%PROGRAMDATA%\AdguardVpn\Temp" /s /q

echo AdGuard
rd "%PROGRAMDATA%\Adguard\Logs" /s /q
rd "%PROGRAMDATA%\Adguard\Temp" /s /q
rd "%PROGRAMDATA%\Adguard\Crashes" /s /q

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
rd "%APPDATA%\Code\logs" /s /q
rd "%APPDATA%\Code\Cache" /s /q
rd "%APPDATA%\Code\GPUCache" /s /q
rd "%APPDATA%\Code\User\History" /s /q
rd "%APPDATA%\Code\CachedData" /s /q
rd "%APPDATA%\Code\Crashpad" /s /q
rd "%APPDATA%\Code\Code Cache" /s /q
del "%APPDATA%\Microsoft VS Code\*.log" /s /q

echo VLC media player
rd "%APPDATA%\vlc\crashdump" /s /q

echo Countdown
timeout 5

echo Start process
rem Windows Explorer
start explorer.exe

echo Start services
rem Windows Update Center
net start wuauserv

echo Shutdown
exit