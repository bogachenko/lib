@ECHO	off
:: Edge
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\GPUCache" /S /Q
:: IE
RD "%LOCALAPPDATA%\Microsoft\Windows\INetCache" /S /Q
:: Firefox
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\formhistory.sqlite" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\sessionCheckpoints.json" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite-shm" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite-wal" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\permissions.sqlite" /S /Q
RD "%ProgramData%\Mozilla\" /S /Q
RD "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\%username%\" /S /Q
RD "%APPDATA%\Mozilla\Extensions" /S /Q
RD "%APPDATA%\Mozilla\SystemExtensionsDev" /S /Q
RD "%APPDATA%\Mozilla\Firefox\Crash Reports" /S /Q
RD "%APPDATA%\Mozilla\Firefox\Pending Pings" /S /Q
RD "%APPDATA%\Mozilla\Firefox\Profiles\%username%\crashes" /S /Q
RD "%APPDATA%\Mozilla\Firefox\Profiles\%username%\minidumps" /S /Q
RD "%APPDATA%\Mozilla\Firefox\Profiles\%username%\datareporting" /S /Q
RD "%APPDATA%\Mozilla\Firefox\Profiles\%username%\sessionstore-backups" /S /Q
RD "%APPDATA%\Mozilla\Firefox\Profiles\%username%\shader-cache" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\shield-preference-experiments.json" /S /Q
:: Opera
RD "%LOCALAPPDATA%\Opera Software\Opera Stable\cache" /S /Q
RD "%LOCALAPPDATA%\Opera Software\Opera Stable\System Cache" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\GPUCache" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\ShaderCache\GPUCache" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\File System" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\Service Worker\CacheStorage" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Cookies-journal" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Extension Cookies-journal" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Cookies" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Extension Cookies" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Favicons-journal" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Favicons" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\History-journal" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\History" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Media History" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Media History-journal" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Network Action Predictor-journal" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Network Action Predictor" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Network Persistent State" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Network Persistent State.backup" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\QuotaManager" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\QuotaManager-journal" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Reporting and NEL-journal" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Reporting and NEL" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Shortcuts-journal" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Web Data-journal" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Shortcuts" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Web Data" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\Jump List Icons" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\Jump List IconsOld" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\*.log" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\default_partner_content.json" /S /Q
:: Windows
DEL "%WINDIR%\*.log" /S /Q
RD "%LOCALAPPDATA%\Microsoft\OneDrive\setup\logs" /S /Q
:: Steam
RD "%PROGRAMFILES(x86)%\Steam\Logs" /S /Q
RD "%PROGRAMFILES(x86)%\Steam\Dumps" /S /Q
DEL "%PROGRAMFILES(x86)%\Steam\*.log" /S /Q
:: DirectX
RD "%LOCALAPPDATA%\D3DSCache" /S /Q
:: Spotify
RD "%LOCALAPPDATA%\Spotify\Browser\Cache" /S /Q
RD "%LOCALAPPDATA%\Spotify\Data" /S /Q
RD "%LOCALAPPDATA%\Spotify\Storage" /S /Q
:: Ace Player
RD "%SYSTEMDRIVE%\_acestream_cache_" /S /Q
:: Overwolf
RD "%ProgramData%\Overwolf\Log" /S /Q