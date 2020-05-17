@ECHO OFF
TITLE bogachenko's Personal Filter Hosts
ECHO Hosts file update script
ECHO by bogachenko
ECHO Start %TIME% %DATE%
echo Checking for a connection.
ping -n 2 127.0.0.1 | find "TTL=" > nul
 if %ERRORLEVEL%==1 (
 echo I can not find your internet. Please check the connection.
 ) else (
 echo Internet is fine. Now I will start updating the hosts file.
CD "%WINDIR%\System32\drivers\etc\"
POWERSHELL "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/bogachenko/filterlist/personal/hosts','hosts')"
)
ECHO STOP %TIME% %DATE%
SLEEP 3

EXIT