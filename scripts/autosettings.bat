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

powershell.exe -command "Get-AppxPackage *officehub* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *skypeapp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *solitairecollection* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *onenote* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *people* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *bingweather* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *xboxapp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *zunevideo* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *feedbackhub* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *mixedreality* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *stickynotes* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *getstarted* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage *gethelp* | Remove-AppxPackage"