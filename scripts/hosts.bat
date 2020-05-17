@ECHO OFF
TITLE bogachenko's Personal Filter Hosts
ECHO Hosts file update script
POWERSHELL "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/bogachenko/filterlist/personal/hosts','%USERPROFILE%\AppData\Local\Temp\bogachenko\hosts')"
move /y %USERPROFILE%\AppData\Local\Temp\bogachenko\hosts %WINDIR%\System32\drivers\etc\
exit