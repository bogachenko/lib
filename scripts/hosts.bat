@ECHO OFF
TITLE bogachenko's Personal Filter Hosts
ECHO Hosts file update script
POWERSHELL "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/bogachenko/filterlist/personal/hosts','hosts')"

exit