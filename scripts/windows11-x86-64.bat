@echo off

:: Windows 11 Build 22000.318 x86_64
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