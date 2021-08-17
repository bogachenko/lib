@echo off

SC config "DiagTrack" start=disabled
SC stop DiagTrack
SC delete DiagTrack
SC config "dmwappushservice" start=disabled
SC stop dmwappushservice
SC delete dmwappushservice
SC config "diagnosticshub.standardcollector.service" start=disabled
SC stop diagnosticshub.standardcollector.service
SC delete diagnosticshub.standardcollector.service
SC config "DcpSvc" start=disabled
SC stop DcpSvc
SC delete DcpSvc
SC config "NcbService" start=disabled
SC stop NcbService
SC delete NcbService
SC config "XblGameSave" start=disabled
SC stop XblGameSave
SC delete XblGameSave
SC config "XblAuthManager" start=disabled
SC stop XblAuthManager
SC delete XblAuthManager
SC config "XboxNetApiSvc" start=disabled
SC stop XboxNetApiSvc
SC delete XboxNetApiSvc
SC config "CDPSvc" start=disabled
SC stop CDPSvc
SC delete CDPSvc
SC config "MapsBroker" start=disabled
SC stop MapsBroker
SC delete MapsBroker
SC config "WalletService" start=disabled
SC stop WalletService
SC delete WalletService
SC config "NvTelemetryContainer" start=disabled
SC stop NvTelemetryContainer
SC delete NvTelemetryContainer
SC config "WMPNetworkSvc" start=disabled
SC stop WMPNetworkSvc
SC delete WMPNetworkSvc
SC config "wcncsvc" start=disabled
SC stop wcncsvc
SC delete wcncsvc
SC config "SensrSvc" start=disabled
SC stop SensrSvc
SC delete SensrSvc
SC config "WbioSrvc" start=disabled
SC stop WbioSrvc
SC delete WbioSrvc
SC config "RetailDemo" start=disabled
SC stop RetailDemo
SC delete RetailDemo
SC config "SensorService" start=disabled
SC stop SensorService
SC delete SensorService
SC config "SensorDataService" start=disabled
SC stop SensorDataService
SC delete SensorDataService
SC config "WSearch" start=disabled
SC stop WSearch
SC delete WSearch

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