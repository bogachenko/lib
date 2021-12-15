@echo off

:: Windows 11 build 22000.318 x86_64
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

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

:: Windows Office Application
powershell.exe -command "Get-AppxPackage -allusers *officehub* | Remove-AppxPackage"

:: Microsoft Solitaire Collection Game
powershell.exe -command "Get-AppxPackage -allusers *solitairecollection* | Remove-AppxPackage"

:: Skype Application
powershell.exe -command "Get-AppxPackage -allusers *skypeapp* | Remove-AppxPackage"

:: People Application
powershell.exe -command "Get-AppxPackage -allusers *people_* | Remove-AppxPackage"

:: Cortana Application
powershell.exe -command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"