@ECHO	off

goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
    ) else (
        echo Failure: Current permissions inadequate.
    )

    pause >nul

:: Edge
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\GPUCache" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\GrShaderCache" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\ShaderCache" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Extension State" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\BrowserMetrics" /S /Q
DEL "%LOCALAPPDATA%\Microsoft\Edge\User Data\BrowserMetrics-spare.pma" /S /Q
DEL "%LOCALAPPDATA%\Microsoft\Edge\User Data\CrashpadMetrics-active.pma" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\databases" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Extension Rules" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Session Storage" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Sessions" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\shared_proto_db" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Local Storage" /S /Q
DEL "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\History Provider Cache" /S /Q
DEL "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Network Action Predictor" /S /Q
DEL "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Top Sites" /S /Q
DEL "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Visited Links" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\IndexedDB" /S /Q
:: IE
RD "%LOCALAPPDATA%\Microsoft\Windows\INetCache" /S /Q
DEL "%LOCALAPPDATA%\Microsoft\Internet Explorer\" /S /Q
:: Firefox
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\formhistory.sqlite" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\sessionCheckpoints.json" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite-shm" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite-wal" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%username%\permissions.sqlite" /S /Q
DEL "%ProgramData%\Mozilla\" /S /Q
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
RD "%APPDATA%\Opera Software\Opera Stable\ShaderCache" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\shared_proto_db" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\StatsSessions" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\File System" /S /Q
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
DEL "%APPDATA%\Opera Software\Opera Stable\History Provider Cache" /S /Q
DEL "%APPDATA%\Opera Software\Opera Stable\Visited Links" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\IndexedDB" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\Service Worker" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\databases" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\Crash Reports" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\Extension Rules" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\Extension State" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\Sessions" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\Session Storage" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\GrShaderCache" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\SafetyTips" /S /Q
RD "%APPDATA%\Opera Software\Opera Stable\Local Storage" /S /Q
:: Windows
DEL "%WINDIR%\*.log" /S /Q
RD "%LOCALAPPDATA%\Microsoft\OneDrive\setup\logs" /S /Q
DEL "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db" /S /Q
DEL "%LOCALAPPDATA%\CrashDumps\*.dmp" /S /Q
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
RD "%LOCALAPPDATA%\Spotify\Browser\GPUCache" /S /Q
RD "%LOCALAPPDATA%\Spotify\Browser\databases" /S /Q
RD "%LOCALAPPDATA%\Spotify\Browser\Service Worker" /S /Q
DEL "%LOCALAPPDATA%\Spotify\Browser\*.log" /S /Q
:: Ace Player
RD "%SYSTEMDRIVE%\_acestream_cache_" /S /Q
:: Overwolf
RD "%ProgramData%\Overwolf\Log" /S /Q
exit