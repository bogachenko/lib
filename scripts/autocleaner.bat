@ECHO	off
:: Edge
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*"
del "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\GPUCache\*"
:: IE
del "%LOCALAPPDATA%\Microsoft\Windows\INetCache\*"
:: Firefox
del "%APPDATA%\Mozilla\Firefox\Profiles\*\formhistory.sqlite"
del "%APPDATA%\Mozilla\Firefox\Profiles\bogachenko\sessionCheckpoints.json"
del "%APPDATA%\Mozilla\Firefox\Profiles\bogachenko\sessionstore-backups\recovery.baklz4"
del "%APPDATA%\Mozilla\Firefox\Profiles\bogachenko\sessionstore-backups\recovery.jsonlz4"