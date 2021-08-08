@ECHO	off
:: Edge
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" /S /Q
RD "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\GPUCache" /S /Q
:: IE
RD "%LOCALAPPDATA%\Microsoft\Windows\INetCache" /S /Q
:: Firefox
DEL "%APPDATA%\Mozilla\Firefox\Profiles\bogachenko\formhistory.sqlite" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\bogachenko\sessionCheckpoints.json" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\bogachenko\sessionstore-backups\recovery.baklz4" /S /Q
DEL "%APPDATA%\Mozilla\Firefox\Profiles\bogachenko\sessionstore-backups\recovery.jsonlz4" /S /Q
:: Windows
DEL "%WINDIR%\*.log" /S /Q
RD "%LOCALAPPDATA%\Microsoft\OneDrive\setup\logs" /S /Q
:: Steam
RD "%PROGRAMFILES(x86)%\Steam\Logs" /S /Q
RD "%PROGRAMFILES(x86)%\Steam\Dumps" /S /Q
DEL "%PROGRAMFILES(x86)%\Steam\*.log" /S /Q
:: DirectX
RD "%LOCALAPPDATA%\D3DSCache" /S /Q