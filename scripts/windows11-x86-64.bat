@echo off

:: Getting root
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Windows 11 build 22000.318 x86_64
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

:: Microsoft Compatibility Telemetry Process
taskkill /f /im compattelrunner.exe > NUL 2>&1
schtasks /change /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable

:: Windows Defender Process
taskkill /f /im smartscreen.exe > NUL 2>&1
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Verification" /disable

:: Windows Security Health Service Process
taskkill /f /im SecurityHealthService.exe > NUL 2>&1
taskkill /f /im SecurityHealthSystray.exe > NUL 2>&1

:: OneDrive Process
taskkill /f /im OneDrive.exe > NUL 2>&1
taskkill /f /im OneDriveStandaloneUpdater.exe > NUL 2>&1
%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe /uninstall
rd "%USERPROFILE%\OneDrive" /Q /S > NUL 2>&1
rd "C:\OneDriveTemp" /Q /S > NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S > NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S > NUL 2>&1
powershell.exe -ex bypass -command "Get-ScheduledTask -TaskName *onedrive* | Disable-ScheduledTask
taskkill /f /im explorer.exe
start explorer.exe

:: Overwolf Update Process
schtasks /change /tn "Overwolf Updater Task" /disable

:: Windows Defender Exploit Guard
schtasks /change /tn "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /disable

:: Diagnostic Policy Service
sc config "DiagTrack" start=disabled
sc stop DiagTrack
sc delete DiagTrack

:: Diagnostic Execution Service
sc config "diagsvc" start=disabled
sc stop diagsvc
sc delete diagsvc

:: WAP-push Service
sc config "dmwappushservice" start=disabled
sc stop dmwappushservice
sc delete dmwappushservice

:: Diagnostics Hub Standard Collector Service
sc config "diagnosticshub.standardcollector.service" start=disabled
sc stop diagnosticshub.standardcollector.service
sc delete diagnosticshub.standardcollector.service

:: Xbox Service
sc config "XblGameSave" start=disabled
sc stop XblGameSave
sc delete XblGameSave
sc config "XblAuthManager" start=disabled
sc stop XblAuthManager
sc delete XblAuthManager
sc config "XboxNetApiSvc" start=disabled
sc stop XboxNetApiSvc
sc delete XboxNetApiSvc
sc config "XboxGipSvc" start=disabled
sc stop XboxGipSvc
sc delete XboxGipSvc

:: Windows Downloaded Maps Manager Service
sc config "MapsBroker" start=disabled
sc stop MapsBroker
sc delete MapsBroker

:: Wallet Service
sc config "WalletService" start=disabled
sc stop WalletService
sc delete WalletService

:: Windows Media Player Network Sharing Service
sc config "WMPNetworkSvc" start=disabled
sc stop WMPNetworkSvc
sc delete WMPNetworkSvc

:: Windows Connect Now Service
sc config "wcncsvc" start=disabled
sc stop wcncsvc
sc delete wcncsvc

:: Sensor Monitoring Service
sc config "SensrSvc" start=disabled
sc stop SensrSvc
sc delete SensrSvc

:: Windows Biometric Service
sc config "WbioSrvc" start=disabled
sc stop WbioSrvc
sc delete WbioSrvc

:: Store Demonstration Service
sc config "RetailDemo" start=disabled
sc stop RetailDemo
sc delete RetailDemo

:: Sensor Service
sc config "SensorService" start=disabled
sc stop SensorService
sc delete SensorService

:: Sensor Data Service
sc config "SensorDataService" start=disabled
sc stop SensorDataService
sc delete SensorDataService

:: Windows Search Service
sc config "WSearch" start=disabled
sc stop WSearch
sc delete WSearch

:: Contact Data Service
sc config "PimIndexMaintenanceSvc" start=disabled
sc stop PimIndexMaintenanceSvc
sc delete PimIndexMaintenanceSvc

:: Windows Error Reporting Service
sc config "WerSvc" start=disabled
sc stop WerSvc
sc delete WerSvc

:: Data Usage Service
sc config "DusmSvc" start=disabled
sc stop DusmSvc
sc delete DusmSvc

:: Windows License Manager Service
sc config "LicenseManager" start=disabled
sc stop LicenseManager
sc delete LicenseManager

:: Diagnostic Host Service
sc config "WdiServiceHost" start=disabled
sc stop WdiServiceHost
sc delete WdiServiceHost

:: Diagnostic Host System Service
sc config "WdiSystemHost" start=disabled
sc stop WdiSystemHost
sc delete WdiSystemHost

:: SSDP Discovery Service
sc config "SSDPSRV" start=disabled
sc stop SSDPSRV
sc delete SSDPSRV

:: Geolocation Service
sc config "lfsvc" start=disabled
sc stop lfsvc
sc delete lfsvc

:: ActiveX Installer
sc config "AxInstSV" start=disabled
sc stop AxInstSV
sc delete AxInstSV

:: AllJoyn Router Service
sc config "AJRouter" start=disabled
sc stop AJRouter
sc delete AJRouter

:: App Readiness
sc config "AppReadiness" start=disabled
sc stop AppReadiness
sc delete AppReadiness

:: Internet Connection Sharing
sc config "SharedAccess" start=disabled
sc stop SharedAccess
sc delete SharedAccess

:: SMS Router Service 
sc config "SmsRouter" start=disabled
sc stop SmsRouter
sc delete SmsRouter

:: Certificate Distribution Service
sc config "CertPropSvc" start=disabled
sc stop CertPropSvc
sc delete CertPropSvc

:: Windows Event Collector Service
sc config "Wecsvc" start=disabled
sc stop Wecsvc
sc delete Wecsvc

:: Smart-Card Service
sc config "SCardSvr" start=disabled
sc stop SCardSvr
sc delete SCardSvr

:: Windows Office App
powershell.exe -command "Get-AppxPackage -allusers *officehub* | Remove-AppxPackage"

:: Microsoft Solitaire Collection Game
powershell.exe -command "Get-AppxPackage -allusers *solitairecollection* | Remove-AppxPackage"

:: People App
powershell.exe -command "Get-AppxPackage -allusers *people* | Remove-AppxPackage"

:: Cortana App
powershell.exe -command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"

:: Microsoft Teams App
powershell.exe -command "Get-AppxPackage -allusers *microsoftteams* | Remove-AppxPackage"

:: Bing News App
powershell.exe -command "Get-AppxPackage -allusers *bingnews* | Remove-AppxPackage"

:: Bing Weather App
powershell.exe -command "Get-AppxPackage -allusers *bingweather* | Remove-AppxPackage"

:: Xbox App
powershell.exe -command "Get-AppxPackage -allusers *xboxgamingoverlay* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxidentityprovider* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxspeechtotextoverlay* | Remove-AppxPackage" 
powershell.exe -command "Get-AppxPackage -allusers *xbox.tcui* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxapp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *gamingapp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *gamingservices* | Remove-AppxPackage"

:: YourPhone App
powershell.exe -command "Get-AppxPackage -allusers *yourphone* | Remove-AppxPackage"

:: Power Automate App
powershell.exe -command "Get-AppxPackage -allusers *powerautomate* | Remove-AppxPackage"

:: Windows Communications Apps
powershell.exe -command "Get-AppxPackage -allusers *windowscommunicationsapps* | Remove-AppxPackage"

:: Get-Help App
powershell.exe -command "Get-AppxPackage -allusers *gethelp* | Remove-AppxPackage"

:: Get Started App
powershell.exe -command "Get-AppxPackage -allusers *getstarted* | Remove-AppxPackage"

:: Microsoft To Do App
powershell.exe -command "Get-AppxPackage -allusers *todos* | Remove-AppxPackage"

:: Microsoft Feedback Hub App
powershell.exe -command "Get-AppxPackage -allusers *windowsfeedbackhub* | Remove-AppxPackage"

:: Hold on console
pause