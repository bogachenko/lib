@echo off

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

rem Spotify
rd "%LOCALAPPDATA%\Spotify\Browser\Cache" /s /q
rd "%LOCALAPPDATA%\Spotify\Data" /s /q
rd "%LOCALAPPDATA%\Spotify\Storage" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\GPUCache" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\databases" /s /q
rd "%LOCALAPPDATA%\Spotify\Browser\Service Worker" /s /q
del "%LOCALAPPDATA%\Spotify\Browser\*.log" /s /q

rem Steam
RD "%PROGRAMFILES(x86)%\Steam\logs" /s /q
RD "%PROGRAMFILES(x86)%\Steam\dumps" /s /q
DEL "%PROGRAMFILES(x86)%\Steam\*.log" /s /q