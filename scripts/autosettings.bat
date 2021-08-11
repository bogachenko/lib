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

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
Dism /online /Disable-Feature /FeatureName:"SearchEngine-Client-Package" /Remove /norestart
REG delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /V "DisableUAR" /T REG_DWORD /D 1 /F
reg delete "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /V "StudyId" /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /V "CEIPEnable" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /V "AllowTelemetry" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /V "MaxTelemetryAllowed" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V "AllowTelemetry" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V "DoNotShowFeedbackNotifications" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /V "AllowTelemetry" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\SQMClient\Windows" /V "CEIPEnable" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /V "Start" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /V "Start" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant" /V "Enabled" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Troubleshooter" /V "Enabled" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Inventory" /V "Enabled" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /V "Enabled" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /V "Enabled" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\PerfTrack" /V "Disabled" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /V "Disabled" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /V "DisableAutomaticTelemetryKeywordReporting" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /V "TelemetryServiceDisabled" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TestHooks" /V "DisableAsimovUpLoad" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /V "AITEnable" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /V "DisableInventory" /T REG_DWORD /D 1 /F
DEL /F /Q %ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl
REG ADD "HKLM\SOFTWARE\Classes\AppID\slui.exe" /V "NoGenTicket" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /V "AllowBuildPreview" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /V "EnableConfigFlighting" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /V "HideInsiderPage" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /V "AcceptedPrivacyPolicy" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization" /V "RestrictImplicitInkCollection" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization" /V "RestrictImplicitTextCollection" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /V "HarvestContacts" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V "AllowInputPersonalization" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V "RestrictImplicitInkCollection" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /V "RestrictImplicitTextCollection" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\InputPersonalization" /V "RestrictImplicitInkCollection" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\InputPersonalization" /V "RestrictImplicitTextCollection" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Input\TIPC" /V "Enabled" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /V "PreventHandwritingDataSharing" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /V "PreventHandwritingDataSharing" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /V "PreventHandwritingErrorReports" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /V "PreventHandwritingErrorReports" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /V "Enabled" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /V "Enabled" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /V "EnableWebContentEvaluation" /T REG_DWORD /D 0 /F
REG ADD "HKCU\Control Panel\International\User Profile" /V "HttpAcceptLanguageOptOut" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass" /V "BluetoothPolicy" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass" /V "UserAuthPolicy" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /V "NumberOfSIUFInPeriod" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /V "PeriodInNanoSeconds" /T REG_DWORD /D 0 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /V "Start" /T REG_DWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc" /V "Start" /T REG_DWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WpnService" /V "Start" /T REG_DWORD /D 4 /F
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wlidsvc" /V "Start" /T REG_DWORD /D 4 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MRT" /V "DontOfferThroughWUAU" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MRT" /V "DontReportInfectionInformation" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /V "EnableSmartScreen" /T REG_DWORD /D 0 /F
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /V "Disabled" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /V "Disabled" /T REG_DWORD /D 1 /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /V "DontSendAdditionalData" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /V "Disabled" /T REG_DWORD /D 1 /F
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /V "DontSendAdditionalData" /T REG_DWORD /D 1 /F
SCHTASKS /CHANGE /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Application Experience\StartupAppTask" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Autochk\Proxy" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Clip\License Validation" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Maps\MapsToastTask" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Maps\MapsUpdateTask" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\PI\Sqm-Tasks" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\SettingSync\BackgroundUpLoadTask" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Device Setup\Metadata Refresh" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DeviceDirectoryClient\HandleCommand" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DeviceDirectoryClient\HandleWnsCommand" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DeviceDirectoryClient\IntegrityCheck" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DeviceDirectoryClient\LocateCommandUserSession" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceAccountChange" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceLocationRightsChange" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePeriodic24" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePolicyChange" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceSettingChange" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DeviceDirectoryClient\RegisterUserDevice" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DiskFootprint\StorageSense" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Data Integrity Scan\Data Integrity Scan" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Data Integrity Scan\Data Integrity Scan for Crash Recovery" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Maintenance\WinSAT" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Shell\FamilySafetyMonitorToastTask" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Shell\FamilySafetyRefreshTask" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Location\Notifications" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Location\WindowsActionDialog" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\WDI\ResolutionHost" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\ApplicationData\appuriverifierinstall" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\ApplicationData\appuriverifierdaily" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Device Information\Device" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\XblGameSave\XblGameSaveTask" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\DUSM\dusmtask" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Management\Provisioning\Logon" /DISABLE
SCHTASKS /CHANGE /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /DISABLE
SCHTASKS /CHANGE /TN "CCleaner Update" /DISABLE
SCHTASKS /CHANGE /TN "MicrosoftEdgeUpdateTaskMachineCore" /DISABLE
SCHTASKS /CHANGE /TN "MicrosoftEdgeUpdateTaskMachineUA" /DISABLE
SCHTASKS /CHANGE /TN "Overwolf Updater Task" /DISABLE
