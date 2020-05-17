@ECHO OFF
TITLE bogachenko's Personal Filter Hosts
ECHO Hosts file update script
ECHO by bogachenko
ECHO Start %TIME% %DATE%
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%ERRORLEVEL%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%TEMP%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%TEMP%\getadmin.vbs"
    "%TEMP%\getadmin.vbs"
    exit /B
:gotAdmin
    if exist "%TEMP%\getadmin.vbs" ( del "%TEMP%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"


CD "%WINDIR%\System32\drivers\etc\"
POWERSHELL "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/bogachenko/filterlist/personal/hosts','hosts')"
CD "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
POWERSHELL "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/bogachenko/lib/master/scripts/hosts.bat','hosts.bat')"


ECHO STOP %TIME% %DATE%
SLEEP 2

EXIT