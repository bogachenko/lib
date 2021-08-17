@echo off

sc config "DiagTrack" start=disabled
sc stop DiagTrack
sc delete DiagTrack
sc config "dmwappushservice" start=disabled
sc stop dmwappushservice
sc delete dmwappushservice
sc config "diagnosticshub.standardcollector.service" start=disabled
sc stop diagnosticshub.standardcollector.service
sc delete diagnosticshub.standardcollector.service
sc config "DcpSvc" start=disabled
sc stop DcpSvc
sc delete DcpSvc
sc config "NcbService" start=disabled
sc stop NcbService
sc delete NcbService
sc config "XblGameSave" start=disabled
sc stop XblGameSave
sc delete XblGameSave
sc config "XblAuthManager" start=disabled
sc stop XblAuthManager
sc delete XblAuthManager
sc config "XboxNetApiSvc" start=disabled
sc stop XboxNetApiSvc
sc delete XboxNetApiSvc
sc config "CDPSvc" start=disabled
sc stop CDPSvc
sc delete CDPSvc
sc config "MapsBroker" start=disabled
sc stop MapsBroker
sc delete MapsBroker
sc config "WalletService" start=disabled
sc stop WalletService
sc delete WalletService
sc config "NvTelemetryContainer" start=disabled
sc stop NvTelemetryContainer
sc delete NvTelemetryContainer
sc config "WMPNetworkSvc" start=disabled
sc stop WMPNetworkSvc
sc delete WMPNetworkSvc
sc config "wcncsvc" start=disabled
sc stop wcncsvc
sc delete wcncsvc
sc config "SensrSvc" start=disabled
sc stop SensrSvc
sc delete SensrSvc
sc config "WbioSrvc" start=disabled
sc stop WbioSrvc
sc delete WbioSrvc
sc config "RetailDemo" start=disabled
sc stop RetailDemo
sc delete RetailDemo
sc config "SensorService" start=disabled
sc stop SensorService
sc delete SensorService
sc config "SensorDataService" start=disabled
sc stop SensorDataService
sc delete SensorDataService
sc config "WSearch" start=disabled
sc stop WSearch
sc delete WSearch

powershell.exe -command "Get-AppxPackage -allusers *officehub* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *skypeapp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *solitairecollection* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *onenote* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *people_* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *bingweather* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxapp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *zunevideo* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *zunemusic* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *feedbackhub* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *mixedreality* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *stickynotes* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *getstarted* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *gethelp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxidentityprovider* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxgamingoverlay* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxgameoverlay* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *windowscommunicationsapps* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *yourphone* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *windowsmaps* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *Windows.Wallet* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *WindowsCamera* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *WindowsSoundRecorder* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *Microsoft3DViewer* | Remove-AppxPackage"

taskkill /f /im OneDrive.exe > NUL 2>&1
%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe /uninstall
rd "%USERPROFILE%\OneDrive" /Q /S > NUL 2>&1
rd "C:\OneDriveTemp" /Q /S > NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S > NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S > NUL 2>&1
reg load HKLM\DEF %2
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "OneDriveSetup" /f
reg delete HKEY_LOCAL_MACHINE\DEF\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "OneDriveSetup" /f
reg delete HKEY_USERS\S-1-5-19\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "OneDriveSetup" /f
reg delete HKEY_USERS\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "OneDriveSetup" /f
reg unload HKLM\DEF