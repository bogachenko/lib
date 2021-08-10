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
sc config "XblAuthManager" start=disabled
sc config "XboxNetApiSvc" start=disabled
sc stop XblGameSave
sc delete XblGameSave
sc stop XblAuthManager
sc delete XblAuthManager
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

Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
Call :LGPO_FILE reg delete "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "StudyId" /f
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
del /f /q %ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
Call :LGPO_FILE reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
Call :TrustedInstaller "reg add ""HKLM\SOFTWARE\Classes\AppID\slui.exe"" /v ""NoGenTicket"" /t REG_DWORD /d 1 /f"
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d 0 /f
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /t REG_DWORD /d 0 /f
Call :LGPO_FILE reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableExperimentation" /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /v "HideInsiderPage" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Troubleshooter" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Inventory" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\PerfTrack" /v "Disabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "Disabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "DisableAutomaticTelemetryKeywordReporting" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "TelemetryServiceDisabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TestHooks" /v "DisableAsimovUpLoad" /t REG_DWORD /d 1 /f