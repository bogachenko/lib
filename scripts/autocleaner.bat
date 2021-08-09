@ECHO	off
:: Edge
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\GPUCache" /S /Q
:: IE
RD "%LOCALAPPDATA%\Microsoft\Windows\INetCache" /S /Q
:: Firefox
set user=bogachenko
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%user%\formhistory.sqlite" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%user%\sessionCheckpoints.json" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%user%\sessionstore-backups\recovery.baklz4" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\%user%\sessionstore-backups\recovery.jsonlz4" /S /Q
RD "%ProgramData%\Mozilla"
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
RD "%LOCALAPPDATA%\Spotify\Spotify\Data" /S /Q
RD "%LOCALAPPDATA%\Spotify\Spotify\Storage" /S /Q
:: Ace Player
RD "%SYSTEMDRIVE%\_acestream_cache_" /S /Q
:: Overwolf
RD "%ProgramData%\Overwolf\Log" /S /Q