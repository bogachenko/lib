@echo off

rem Firefox Browser
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite-shm" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\favicons.sqlite-wal" /s /q
del "%APPDATA%\Mozilla\Firefox\Profiles\%username%\formhistory.sqlite" /s /q
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