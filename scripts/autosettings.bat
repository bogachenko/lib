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
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "StudyId" /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Troubleshooter" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Inventory" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\PerfTrack" /v "Disabled" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "Disabled" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "DisableAutomaticTelemetryKeywordReporting" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "TelemetryServiceDisabled" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TestHooks" /v "DisableAsimovUpLoad" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
DEL /f /q %ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl
REG ADD "HKLM\SOFTWARE\Classes\AppID\slui.exe" /v "NoGenTicket" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /v "HideInsiderPage" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
SCHTASKS /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Clip\License Validation" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\SettingSync\BackupTask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable
Call :SetTaskInSystem "Microsoft\Windows\SettingSync\BackgroundUpLoadTask" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\Device Setup\Metadata Refresh" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\HandleCommand" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\HandleWnsCommand" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\IntegrityCheck" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\LocateCommandUserSession" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceAccountChange" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceConnectedToNetwork" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceLocationRightsChange" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePeriodic1" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePeriodic24" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePeriodic6" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\RegisterDevicePolicyChange" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceScreenOnOff" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\RegisterDeviceSettingChange" "/Disable"
Call :SetTaskInSystem "Microsoft\Windows\DeviceDirectoryClient\RegisterUserDevice" "/Disable"
SCHTASKS /Change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable
SCHTASKS /Change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable
SCHTASKS /Change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disable
SCHTASKS /Change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disable
SCHTASKS /Change /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" /Disable
REG ADD "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f
REG ADD "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass" /v "BluetoothPolicy" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass" /v "UserAuthPolicy" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d 0 /f
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
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v "Start" /t REG_DWORD /d 4 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc" /v "Start" /t REG_DWORD /d 4 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\WpnService" /v "Start" /t REG_DWORD /d 4 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\wlidsvc" /v "Start" /t REG_DWORD /d 4 /f
SCHTASKS /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Data Integrity Scan\Data Integrity Scan" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Data Integrity Scan\Data Integrity Scan for Crash Recovery" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitorToastTask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefreshTask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Location\Notifications" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Location\WindowsActionDialog" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\WDI\ResolutionHost" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\ApplicationData\appuriverifierinstall" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\ApplicationData\appuriverifierdaily" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Device Information\Device" /Disable
SCHTASKS /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable
SCHTASKS /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\DUSM\dusmtask" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\ErrorDetails\EnableErrorDetailsUpdate" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\ErrorDetails\ErrorDetailsUpdate" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\License Manager\TempSignedLicenseExchange" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Management\Provisioning\Logon" /Disable
SCHTASKS /Change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /Disable
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSync" /t REG_DWORD /d 2 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSyncUserOverride" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "EnableBackupForWin8Apps" /t REG_DWORD /d 0 /f