@ECHO OFF
TITLE bogachenko's Personal Filter Hosts
ECHO Hosts file update script
ECHO by bogachenko
ECHO Start %TIME% %DATE%
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
echo Checking for a connection.
ping -n 2 127.0.0.1 | find "TTL=" > nul
 if %ERRORLEVEL%==1 (
 echo I can not find your internet. Please check the connection.
 ) else (
 echo Internet is fine. Now I will start updating the hosts file.
CD "%WINDIR%\System32\drivers\etc\"
POWERSHELL "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/bogachenko/filterlist/personal/hosts','hosts')"
CD "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
POWERSHELL "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/bogachenko/lib/master/scripts/hosts.bat','hosts.bat')"
)
ECHO STOP %TIME% %DATE%
SLEEP 1

EXIT