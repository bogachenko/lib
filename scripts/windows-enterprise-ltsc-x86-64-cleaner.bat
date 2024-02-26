@echo off

title Windows 10 Enterprise LTSC Cleaner

rem Getting superuser rights
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Windows 10 Enterprise LTSC Cleaner
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

rem Clipboard Cleaner
echo off | clip > nul 2>&1

echo Stop processes > nul 2>&1
rem Windows Explorer
taskkill /f > nul 2>&1 /im explorer.exe > nul 2>&1
rem Firefox
taskkill /f > nul 2>&1 /im firefox.exe > nul 2>&1
rem Discord
taskkill /f > nul 2>&1 /im discord.exe > nul 2>&1
rem Steam
taskkill /f > nul 2>&1 /im steam.exe > nul 2>&1
rem Spotify
taskkill /f > nul 2>&1 /im spotify.exe > nul 2>&1
rem Chromium
taskkill /f > nul 2>&1 /im chrome.exe > nul 2>&1
rem AdGuard
taskkill /f > nul 2>&1 /im adguard.exe > nul 2>&1
rem AdGuard VPN
taskkill /f > nul 2>&1 /im adguardvpn.exe > nul 2>&1
rem Telegram
taskkill /f > nul 2>&1 /im telegram.exe > nul 2>&1
rem Thunderbird
taskkill /f > nul 2>&1 /im thunderbird.exe > nul 2>&1
rem Windows Security Health Service
taskkill /f > nul 2>&1 /im SecurityHealthService.exe > nul 2>&1
taskkill /f > nul 2>&1 /im SecurityHealthSystray.exe > nul 2>&1
rem Microsoft Compatibility Telemetry
taskkill /f > nul 2>&1 /im compattelrunner.exe > nul 2>&1
rem Microsoft SmartScreen
taskkill /f > nul 2>&1 /im smartscreen.exe > nul 2>&1

echo Stop services > nul 2>&1
rem Windows Update Center
net stop wuauserv > nul 2>&1

echo Flush DNS Cache > nul 2>&1
ipconfig /flushdns > nul 2>&1

echo Deleting Recovery points > nul 2>&1
vssadmin delete shadows /all /quiet > nul 2>&1

echo Tor Browser > nul 2>&1
del "%APPDATA%\Tor Browser\Browser\TorBrowser\Data\Browser\profile.default\cookies.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Tor Browser\Browser\TorBrowser\Data\Browser\profile.default\favicons.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Tor Browser\Browser\TorBrowser\Data\Browser\profile.default\formhistory.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Tor Browser\Browser\TorBrowser\Data\Browser\profile.default\places.sqlite" /s /q > nul 2>&1
rd "%APPDATA%\Tor Browser\Browser\TorBrowser\Data\Browser\profile.default\datareporting" /s /q > nul 2>&1
rd "%APPDATA%\Tor Browser\Browser\TorBrowser\Data\Browser\profile.default\shader-cache" /s /q > nul 2>&1

echo Firefox Browser > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\favicons.sqlite-shm" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\favicons.sqlite-wal" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\favicons.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\formhistory.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\sessionCheckpoints.json" /s /q > nul 2>&1
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\SiteSecurityServiceState.txt" /s /q > nul 2>&1
powershell.exe -command "Remove-item '%PROGRAMDATA%\Mozilla-*'" -Recurse > nul 2>&1
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

echo Thunderbird > nul 2>&1
rd "%LOCALAPPDATA%\Thunderbird\Profiles\%USERNAME%" /s /q > nul 2>&1
rd "%APPDATA%\Thunderbird\Crash Reports" /s /q > nul 2>&1
rd "%APPDATA%\Thunderbird\Pending Pings" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\favicons.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\favicons.sqlite-shm" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\favicons.sqlite-wal" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\cookies.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\cookies.sqlite-shm" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\cookies.sqlite-wal" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\places.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\places.sqlite-shm" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\places.sqlite-wal" /s /q > nul 2>&1
rd "%APPDATA%\Thunderbird\Profiles\%USERNAME%\shader-cache" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\history.sqlite" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\history.sqlite-shm" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\history.sqlite-wal" /s /q > nul 2>&1
rd "%APPDATA%\Thunderbird\Profiles\%USERNAME%\crashes" /s /q > nul 2>&1
rd "%APPDATA%\Thunderbird\Profiles\%USERNAME%\minidumps" /s /q > nul 2>&1
rd "%APPDATA%\Thunderbird\Profiles\%USERNAME%\datareporting" /s /q > nul 2>&1
del "%APPDATA%\Thunderbird\Profiles\%USERNAME%\formhistory.sqlite" /s /q > nul 2>&1

echo DirectX > nul 2>&1
rd "%LOCALAPPDATA%\D3DSCache" /s /q > nul 2>&1

echo Discord > nul 2>&1
rd "%APPDATA%\discord\Cache" /s /q > nul 2>&1
rd "%APPDATA%\discord\Code Cache" /s /q > nul 2>&1
rd "%APPDATA%\discord\GPUCache" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Discord\*.log" /s /q > nul 2>&1

echo Spotify > nul 2>&1
del "%LOCALAPPDATA%\Spotify\Browser\*.log" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Spotify\Browser\Cache" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Spotify\Browser\databases" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Spotify\Browser\GPUCache" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Spotify\Browser\Service Worker" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Spotify\Data" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Spotify\Storage" /s /q > nul 2>&1

echo Steam > nul 2>&1
del "%PROGRAMFILES(x86)%\Steam\*.log" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Steam\htmlcache" /s /q > nul 2>&1
rd "%PROGRAMFILES(x86)%\Steam\dumps" /s /q > nul 2>&1
rd "%PROGRAMFILES(x86)%\Steam\logs" /s /q > nul 2>&1

echo Chromium Browser > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\BrowserMetrics-*" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Favicons-journal" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Favicons" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\heavy_ad_intervention_opt_out.db-journal" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\heavy_ad_intervention_opt_out.db" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\History-journal" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\History" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Network Action Predictor-journal" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Network Action Predictor" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Shortcuts-journal" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Shortcuts" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Top Sites-journal" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Top Sites" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Visited Links" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Web Data-journal" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Chromium\User Data\Default\Web Data" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\BrowserMetrics" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Cache" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Code Cache" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\commerce_subscription_db" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\coupon_db" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\databases" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\DawnCache" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Extension State" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Feature Engagement Tracker" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\GPUCache" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\IndexedDB" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Local Storage" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Network" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\optimization_guide_hint_cache_store" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\optimization_guide_model_metadata_store" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Platform Notifications" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Session Storage" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Sessions" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\shared_proto_db" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\Site Characteristics Database" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\VideoDecodeStats" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Chromium\User Data\Default\WebrtcVideoStats" /s /q > nul 2>&1

echo AdGuard VPN > nul 2>&1
rd "%PROGRAMDATA%\AdguardVpn\Logs" /s /q > nul 2>&1
rd "%PROGRAMDATA%\AdguardVpn\Crashes" /s /q > nul 2>&1
rd "%PROGRAMDATA%\AdguardVpn\Temp" /s /q > nul 2>&1

echo AdGuard > nul 2>&1
rd "%PROGRAMDATA%\Adguard\Logs" /s /q > nul 2>&1
rd "%PROGRAMDATA%\Adguard\Temp" /s /q > nul 2>&1
rd "%PROGRAMDATA%\Adguard\Crashes" /s /q > nul 2>&1

echo qBittorrent > nul 2>&1
rd "%LOCALAPPDATA%\qBittorrent" /s /q > nul 2>&1

echo Rockstar Games Launcher > nul 2>&1
del "%PROGRAMDATA%\Rockstar Games\Launcher\*.log" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Rockstar Games\Launcher\CrashLogs" /s /q > nul 2>&1

echo SquirrelTemp > nul 2>&1
rd "%LOCALAPPDATA%\SquirrelTemp" /s /q > nul 2>&1

echo GitHub Desktop > nul 2>&1
rd "%LOCALAPPDATA%\GitHubDesktop\*.log" /s /q > nul 2>&1

echo Windows > nul 2>&1
cleanmgr /sagerun:1 /s /q > nul 2>&1
rd "%WINDIR%\Panther" /s /q > nul 2>&1
rd "%WINDIR%\softwareDistribution" /s /q > nul 2>&1
rd "%WINDIR%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization" /s /q > nul 2>&1
rd "%WINDIR%\ServiceProfiles\NetworkService\AppData\LocalLow\Microsoft\CryptnetUrlCache" /s /q > nul 2>&1
rd "%PROGRAMDATA%\USOShared\Logs" /s /q > nul 2>&1
del "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" /s /q > nul 2>&1
del "%PROGRAMDATA%\Microsoft\Search\Data\Applications\Windows\*.*" /s /q > nul 2>&1
del "%WINDIR%\*.log" /s /q > nul 2>&1
del "%WINDIR%\Debug\*.log" /s /q > nul 2>&1
del "%WINDIR%\inf\*.log" /s /q > nul 2>&1
powershell.exe -command "Remove-item '%LOCALAPPDATA%\Microsoft\CLR_*'" -Recurse > nul 2>&1
powershell.exe -command "Remove-item '%WINDIR%\System32\sru\SRU*.*'" -Recurse > nul 2>&1
rd "%APPDATA%\Microsoft\Windows\Recent" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\ElevatedDiagnostics" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Microsoft\Windows\WebCache" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Temp" /s /q > nul 2>&1
rd "%PROGRAMDATA%\Microsoft\Diagnosis" /s /q > nul 2>&1
rd "%PROGRAMDATA%\Microsoft\Windows Defender\" /s /q > nul 2>&1
rd "%SYSTEMDRIVE%\$Recycle.bin" /s /q > nul 2>&1
rd "%USERPROFILE%\AppData\LocalLow\Microsoft\CryptnetUrlCache" /s /q > nul 2>&1
rd "%WINDIR%\DiagTrack" /s /q > nul 2>&1
rd "%WINDIR%\Installer" /s /q > nul 2>&1
rd "%WINDIR%\Logs" /s /q > nul 2>&1
del "%WINDIR%\Logs\waasmedic\*.etl" /s /q > nul 2>&1
rd "%WINDIR%\Prefetch" /s /q > nul 2>&1
rd "%WINDIR%\SoftwareDistribution" /s /q > nul 2>&1
rd "%WINDIR%\Temp" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Microsoft\Windows\Caches" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files" /s /q > nul 2>&1
rd "%WINDIR%\Offline Web Pages" /s /q > nul 2>&1
rd "%PROGRAMDATA%\Microsoft\Windows\WER" /s /q > nul 2>&1
del "%LOCALAPPDATA%\IconCache.db" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\cache" /s /q > nul 2>&1
rd "%WINDIR%\LiveKernelReports" /s /q > nul 2>&1
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase > nul 2>&1
Dism.exe /online /Cleanup-Image /StartComponentCleanup > nul 2>&1

echo Microsoft Office > nul 2>&1
rd "%APPDATA%\Microsoft\Office" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Microsoft\Office" /s /q > nul 2>&1

echo Internet Explorer > nul 2>&1
rd "%USERPROFILE%\AppData\LocalLow\Microsoft\Internet Explorer" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Internet Explorer\Recovery" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Microsoft\Internet Explorer" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\Microsoft\Windows\INetCache" /s /q > nul 2>&1

echo Nvidia > nul 2>&1
rd "%LOCALAPPDATA%\NVIDIA\DXCache" /s /q > nul 2>&1
rd "%LOCALAPPDATA%\NVIDIA\GLCache" /s /q > nul 2>&1
rd "%PROGRAMDATA%\NVIDIA Corporation" /s /q > nul 2>&1
rd "%PROGRAMDATA%\NVIDIA" /s /q > nul 2>&1
rd "%PROGRAMDATA%\NVIDIA Corporation\Installer2" /s /q > nul 2>&1

echo Intel > nul 2>&1
rd "%PROGRAMDATA%\Intel" /s /q > nul 2>&1
rd "%USERPROFILE%\AppData\LocalLow\Intel\ShaderCache" /s /q > nul 2>&1

echo Telegram > nul 2>&1
del "%APPDATA%\Telegram Desktop\log.txt" /s /q > nul 2>&1
powershell.exe -command "Remove-item '%APPDATA%\Telegram Desktop\log_*.txt'" -Recurse > nul 2>&1
rd "%APPDATA%\Telegram Desktop\tdata\dumps" /s /q > nul 2>&1
rd "%APPDATA%\Telegram Desktop\tdata\user_data" /s /q > nul 2>&1

echo Visual Studio Code > nul 2>&1
rd "%APPDATA%\Code\logs" /s /q > nul 2>&1
rd "%APPDATA%\Code\Cache" /s /q > nul 2>&1
rd "%APPDATA%\Code\GPUCache" /s /q > nul 2>&1
rd "%APPDATA%\Code\User\History" /s /q > nul 2>&1
rd "%APPDATA%\Code\CachedData" /s /q > nul 2>&1
rd "%APPDATA%\Code\Crashpad" /s /q > nul 2>&1
rd "%APPDATA%\Code\Code Cache" /s /q > nul 2>&1
del "%APPDATA%\Microsoft VS Code\*.log" /s /q > nul 2>&1

echo VLC media player > nul 2>&1
rd "%APPDATA%\vlc\crashdump" /s /q > nul 2>&1

echo Countdown > nul 2>&1
timeout 5 > nul 2>&1

echo Start process > nul 2>&1
rem Windows Explorer
start explorer.exe > nul 2>&1

echo Start services > nul 2>&1
rem Windows Update Center
net start wuauserv > nul 2>&1

echo Shutdown > nul 2>&1
exit