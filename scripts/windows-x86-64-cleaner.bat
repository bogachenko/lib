@echo off

rem Getting root
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Windows Cleaner
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

:: Copyright 2022 Bogachenko Vyacheslav
::
:: This script is provided "AS IS" without warranty of any kind, either expressed or implied.
:: Use it at your own risk! The author is not responsible for any claims for damage that may arise from the use of this script.

rem Flush DNS Cache
ipconfig /flushdns

rem Firefox Browser
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\favicons.sqlite-shm" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\favicons.sqlite-wal" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\favicons.sqlite" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\formhistory.sqlite" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\places.sqlite" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\sessionCheckpoints.json" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\SiteSecurityServiceState.txt" /s /q
powershell.exe -command "Remove-item %ProgramData%\Mozilla-*" -Recurse
rd "%APPDATA%\Mozilla\Extensions" /s /q
rd "%APPDATA%\Mozilla\Firefox\Background Tasks Profiles" /s /q
rd "%APPDATA%\Mozilla\Firefox\Crash Reports" /s /q
rd "%APPDATA%\Mozilla\Firefox\Pending Pings" /s /q
rd "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\crashes" /s /q
rd "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\datareporting" /s /q
rd "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\minidumps" /s /q
rd "%APPDATA%\Mozilla\Firefox\Profiles\%USERNAME%\personality-provider" /s /q
rd "%APPDATA%\Mozilla\SystemExtensionsDev" /s /q
rd "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\%USERNAME%" /s /q
rd "%USERPROFILE%\AppData\LocalLow\Mozilla" /s /q

rem Adobe
rd "%USERPROFILE%\AppData\LocalLow\Adobe" /s /q

rem DirectX
rd "%LOCALAPPDATA%\D3DSCache" /s /q

rem Discord
rd "%APPDATA%\discord\Cache" /s /q
rd "%APPDATA%\discord\Code Cache" /s /q
rd "%APPDATA%\discord\GPUCache" /s /q

rem Spotify
del "%LOCALAPPDATA%\Spotify\Browser\*.log" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\Cache" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\databases" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\GPUCache" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\Service Worker" /s /q
rd "%LOCALAPPDATA%\Spotify\Data" /s /q
rd "%LOCALAPPDATA%\Spotify\Storage" /s /q

rem Steam
del "%PROGRAMFILES(x86)%\Steam\*.log" /s /q
rd "%LOCALAPPDATA%\Steam\htmlcache" /s /q
rd "%PROGRAMFILES(x86)%\Steam\dumps" /s /q
rd "%PROGRAMFILES(x86)%\Steam\logs" /s /q

rem Skype
rd "%APPDATA%\Microsoft\Skype for Desktop\GPUCache" /s /q

rem Opera Browser
del "%APPDATA%\Opera Software\Opera Stable\*.log" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Cookies-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Cookies" /s /q
del "%APPDATA%\Opera Software\Opera Stable\default_partner_content.json" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Extension Cookies-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Extension Cookies" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Favicons-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Favicons" /s /q
del "%APPDATA%\Opera Software\Opera Stable\History Provider Cache" /s /q
del "%APPDATA%\Opera Software\Opera Stable\History-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\History" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Media History-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Media History" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Network Action Predictor-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Network Action Predictor" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Network Persistent State.backup" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Network Persistent State" /s /q
del "%APPDATA%\Opera Software\Opera Stable\PartnerRules" /s /q
del "%APPDATA%\Opera Software\Opera Stable\QuotaManager-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\QuotaManager" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Reporting and NEL-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Reporting and NEL" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Shortcuts-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Shortcuts" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Visited Links" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Web Data-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Web Data" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\Crash Reports" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\databases" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\Extension Rules" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\Extension State" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\File System" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\GPUCache" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\GrShaderCache" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\IndexedDB" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\Jump List Icons" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\Jump List IconsOld" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\Local Storage" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\SafetyTips" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\Service Worker" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\Session Storage" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\Sessions" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\ShaderCache" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\shared_proto_db" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\StatsSessions" /s /q
rd "%LOCALAPPDATA%\Opera Software\Opera Stable" /s /q

rem Edge Browser
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\BrowserMetrics-*" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\CrashpadMetrics-active.pma" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Favicons-journal" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Favicons" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\heavy_ad_intervention_opt_out.db-journal" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\heavy_ad_intervention_opt_out.db" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\History Provider Cache" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\History-journal" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\History" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\load_statistics.db" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Network Action Predictor" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Shortcuts-journal" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Shortcuts" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Storage" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Top Sites" /s /q
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Visited Links" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\BrowserMetrics" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Collections" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\databases" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\EdgeCoupons" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\EdgePushStorageWithConnectTokenAndKey" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Extension Rules" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Extension State" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Feedback Reports" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\GPUCache" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\IndexedDB" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Local Storage" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\optimization_guide_hint_cache_store" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\optimization_guide_model_and_features_store" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Platform Notifications" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Safe Browsing Network" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Service Worker" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Session Storage" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Sessions" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\shared_proto_db" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Site Characteristics Database" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\VideoDecodeStats" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\GrShaderCache" /s /q
rd "%LOCALAPPDATA%\Microsoft\Edge\User Data\ShaderCache" /s /q

rem Chromium
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

rem AdGuard VPN
rd "%ProgramData%\AdguardVpn\Logs" /s /q

rem Overwolf
rd "%ProgramData%\Overwolf\Log" /s /q

rem Windows
del "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" /s /q
del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\*.*" /s /q
del "%WINDIR%\*.log" /s /q
del "%WINDIR%\Temp\" /s /q
powershell.exe -command "Remove-item %LOCALAPPDATA%\Microsoft\CLR_*" -Recurse
powershell.exe -command "Remove-item %WINDIR%\System32\sru\SRU*.*" -Recurse
rd "%APPDATA%\Microsoft\Windows\Recent" /s /q
rd "%LOCALAPPDATA%\ElevatedDiagnostics" /s /q
rd "%LOCALAPPDATA%\Microsoft\Windows\WebCache" /s /q
rd "%LOCALAPPDATA%\Temp" /s /q
rd "%ProgramData%\Microsoft\Diagnosis" /s /q
rd "%ProgramData%\Microsoft\Windows Defender" /s /q
rd "%SYSTEMDRIVE%\$Recycle.bin" /s /q
rd "%USERPROFILE%\AppData\LocalLow\\Microsoft\Internet Explorer" /s /q
rd "%USERPROFILE%\AppData\LocalLow\Microsoft\CryptnetUrlCache" /s /q
rd "%WINDIR%\DiagTrack" /s /q
rd "%WINDIR%\Installer\$PatchCache$\Managed" /s /q
rd "%WINDIR%\Logs" /s /q
rd "%WINDIR%\Prefetch" /s /q
rd "%WINDIR%\SoftwareDistribution" /s /q

rem Notepad++
del "%APPDATA%\notepad++\session.xml" /s /q

rem Nvidia
rd "%LOCALAPPDATA%\NVIDIA\DXCache" /s /q
rd "%LOCALAPPDATA%\NVIDIA\GLCache" /s /q

rem Telegram
del "%APPDATA%\Telegram Desktop\log.txt" /s /q
rd "%APPDATA%\\Telegram Desktop\tdata\dumps" /s /q
rd "%APPDATA%\Telegram Desktop\tdata\user_data" /s /q

rem Countdown
timeout 5