@echo off

set TempDirWIN="%WINDIR%\TEMP"

rem Firefox Browser
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite-shm" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite-wal" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\formhistory.sqlite" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\places.sqlite" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\sessionCheckpoints.json" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\SiteSecurityServiceState.txt" /s /q
rd "%APPDATA%\Mozilla\Extensions" /s /q
rd "%APPDATA%\Mozilla\Firefox\Crash Reports" /s /q
rd "%APPDATA%\Mozilla\Firefox\Pending Pings" /s /q
rd "%APPDATA%\Mozilla\Firefox\Profiles\%username%\crashes" /s /q
rd "%APPDATA%\Mozilla\Firefox\Profiles\%username%\datareporting" /s /q
rd "%APPDATA%\Mozilla\Firefox\Profiles\%username%\minidumps" /s /q
rd "%APPDATA%\Mozilla\Firefox\Profiles\%username%\personality-provider" /s /q
rd "%APPDATA%\Mozilla\SystemExtensionsDev" /s /q
rd "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\%username%" /s /q
rd "%ProgramData%\Mozilla" /s /q

rem MS Search
del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\*.*" /s /q

rem DirectX
rd "%LOCALAPPDATA%\D3DSCache" /s /q

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
rd "%PROGRAMFILES(x86)%\Steam\dumps" /s /q
rd "%PROGRAMFILES(x86)%\Steam\logs" /s /q

rem Opera Browser
del "%APPDATA%\Opera Software\Opera Stable\*.log" /s /q
del "%APPDATA%\Opera Software\Opera Stable\PartnerRules" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Visited Links" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Cookies" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Cookies-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\default_partner_content.json" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Extension Cookies" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Extension Cookies-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Favicons" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Favicons-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\History" /s /q
del "%APPDATA%\Opera Software\Opera Stable\History-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\History Provider Cache" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Media History" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Media History-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Network Action Predictor" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Network Action Predictor-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Network Persistent State" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Network Persistent State.backup" /s /q
del "%APPDATA%\Opera Software\Opera Stable\QuotaManager" /s /q
del "%APPDATA%\Opera Software\Opera Stable\QuotaManager-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Reporting and NEL" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Reporting and NEL-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Shortcuts" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Shortcuts-journal" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Visited Links" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Web Data" /s /q
del "%APPDATA%\Opera Software\Opera Stable\Web Data-journal" /s /q
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
rd "%APPDATA%\Opera Software\Opera Stable\Sessions" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\Session Storage" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\ShaderCache" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\shared_proto_db" /s /q
rd "%APPDATA%\Opera Software\Opera Stable\StatsSessions" /s /q
rd "%LOCALAPPDATA%\Opera Software\Opera Stable" /s /q

rem AdGuard VPN
rd "%ProgramData%\AdguardVpn\Logs" /s /q