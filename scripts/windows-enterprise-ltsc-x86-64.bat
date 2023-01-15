@echo off

title Windows 10 Enterprise LTSC

rem Getting superuser rights
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Windows 10 Enterprise LTSC build 19044.2075 x86_64
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

:: Copyright 2022 Bogachenko Vyacheslav
::
:: This script is provided "AS IS" without warranty of any kind, either expressed or implied.
:: Use it at your own risk! The author is not responsible for any claims for damage that may arise from the use of this script.

echo Stop processes > nul 2>&1
rem Windows Explorer
taskkill /f > nul 2>&1 /im explorer.exe > nul 2>&1
rem Windows Security Health Service
taskkill /f > nul 2>&1 /im SecurityHealthService.exe > nul 2>&1
taskkill /f > nul 2>&1 /im SecurityHealthSystray.exe > nul 2>&1
rem Microsoft Compatibility Telemetry
taskkill /f > nul 2>&1 /im compattelrunner.exe > nul 2>&1
rem Microsoft SmartScreen
taskkill /f > nul 2>&1 /im smartscreen.exe > nul 2>&1

echo Windows Task Scheduler > nul 2>&1
rem Microsoft Compatibility Telemetry Tasks
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable > nul 2>&1
rem Windows Defender Tasks
schtasks /change /tn "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Windows Defender\Windows Defender Verification" /disable > nul 2>&1
rem Windows Exploit Guard Defender Task
schtasks /change /tn "\Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /disable > nul 2>&1
rem Disk Fingerprint Tasks
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\StorageSense" /disable > nul 2>&1
rem System Analysis and Diagnostics Task
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable > nul 2>&1
rem Family Safety Tasks
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /disable > nul 2>&1
rem System Performance Diagnostics Task
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable > nul 2>&1
rem File Usage Statistics Collection Task
schtasks /change /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable > nul 2>&1
rem Customer Experience Improvement Program Task
schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /disable > nul 2>&1
rem Network Information Collector Task
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable > nul 2>&1
rem Automatic Scanning And Troubleshooting Tasks
schtasks /change /tn "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Diagnosis\Scheduled" /disable > nul 2>&1
rem Updating Search Indexes Task
schtasks /change /tn "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance" /disable > nul 2>&1
rem Windows Diagnostic Infrastructure Resolution Host Task
schtasks /change /tn "\Microsoft\Windows\WDI\ResolutionHost" /disable > nul 2>&1
rem Xbox Tasks
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTask" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTaskLogon" /disable > nul 2>&1
rem RetailDemo Offline Content Automatic Cleanup Task
schtasks /change /tn "\Microsoft\Windows\RetailDemo\CleanupOfflineContent" /disable > nul 2>&1
rem Send Error Reporting Task
schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable > nul 2>&1
rem Location Notification Tasks
schtasks /change /tn "\Microsoft\Windows\Location\Notifications" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Location\WindowsActionDialog" /disable > nul 2>&1
rem Device Data Collection and Sending Tasks
schtasks /change /tn "\Microsoft\Windows\Device Information\Device" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Device Information\Device User" /disable > nul 2>&1
rem Microsoft Office Task
schtasks /change /tn "\Microsoft\Office\Office ClickToRun Service Monitor" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Office\Office Performance Monitor" /disable > nul 2>&1
rem Boot Optimization Task
schtasks /change /tn "\Microsoft\Windows\Sysmain\ResPriStaticDbSync" /disable > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /disable > nul 2>&1
rem Mobile Network Metadata Analysis Task
schtasks /change /tn "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /disable > nul 2>&1
rem Data Usage Subscription Management Task
schtasks /change /tn "\Microsoft\Windows\DUSM\dusmtask" /disable > nul 2>&1
rem Send Diagnostic Task
schtasks /change /tn "\Microsoft\Windows\Flighting\OneSettings\RefreshCache" /disable > nul 2>&1
rem Update Center Telemetry Task
schtasks /change /tn "\Microsoft\Windows\UNP\RunUpdateNotificationMgr" /disable > nul 2>&1
rem Adobe Acrobat Update Task
schtasks /change /tn "\Adobe Acrobat Update Task" /disable > nul 2>&1

echo Stopping Tracking Services > nul 2>&1
rem Diagnostics Tracking Service
reg add "HKLM\System\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Diagnostic Execution Service
reg add "HKLM\System\CurrentControlSet\Services\diagsvc" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem WAP Push Message Routing Service
reg add "HKLM\System\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Standard Diagnostic Center Collector Service
reg add "HKLM\System\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Xbox Services
reg add "HKLM\System\CurrentControlSet\Services\XblAuthManager" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\XboxGipSvc" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\XboxNetApiSvc" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Store Demonstration Service
reg add "HKLM\System\CurrentControlSet\Services\RetailDemo" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Windows Search Service
reg add "HKLM\System\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Windows Error Logging Service
reg add "HKLM\System\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\wercplsupport " /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Data Usage Service
reg add "HKLM\System\CurrentControlSet\Services\DusmSvc" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem SSDP Discovery Service
reg add "HKLM\System\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Geolocation Service
reg add "HKLM\System\CurrentControlSet\Services\lfsvc" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Downloaded Maps Manager Service
reg add "HKLM\System\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Delivery Optimization Service
reg add "HKLM\System\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem System Performance Improvement Service
reg add "HKLM\System\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Broadcast DVR User Service
reg add "HKLM\System\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
rem Windows Biometric Service
reg add "HKLM\System\CurrentControlSet\Services\WbioSrvc" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1

echo Time And Language Setting > nul 2>&1
rem Show Text Suggestions When Typing On The Physical Keyboard
reg add "HKCU\Software\Microsoft\Input\Settings" /v "EnableHwkbTextPrediction" /t REG_DWORD /d "0" /f > nul 2>&1
rem Multilingual Text Suggestions
reg add "HKCU\Software\Microsoft\Input\Settings" /v "MultilingualEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
rem Voice Typing
reg add "HKCU\Software\Microsoft\Input\Settings" /v "VoiceTypingEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
rem Collecting And Transmitting The Texts You Type
reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
rem Spelling And Correction Of Misspelled Words
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableAutocorrection" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableDoubleTapSpace" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnablePredictionSpaceInsertion" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableSpellchecking" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableTextPrediction" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Control Panel\International" /v "TurnOffAutocorrectMisspelledWords" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Control Panel\International" /v "TurnOffHighlightMisspelledWords" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Control Panel\International" /v "TurnOffOfferTextPredictions" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\TabletTip\1.7" /v "DisablePrediction" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\TabletTip\1.7" /v "DisablePrediction" /t REG_DWORD /d "1" /f > nul 2>&1
rem Improve Inking And Typing Recognition
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v "AllowLinguisticDataCollection" /t REG_DWORD /d "0" /f > nul 2>&1
rem Input Analysis
reg add "HKCU\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Input\Settings" /v "HarvestContacts" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Input\Settings" /v "LMDataLoggerEnabled" /t REG_DWORD /d "0" /f > nul 2>&1

echo Games Settings > nul 2>&1
rem Xbox
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f > nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\GameUX" /v "DownloadGameInfo" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\GameUX" /v "GameUpdateOptions" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\GameUX" /v "ListRecentlyPlayed" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\WOW6432Nade\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f > nul 2>&1

echo Bluetooth And Devices Settings > nul 2>&1
rem Suggestions For Using My Android Phone With Windows
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Mobility" /v "OptedIn" /t REG_DWORD /d "0" /f > nul 2>&1
rem Autoplay for all media and devices
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t REG_DWORD /d "1" /f > nul 2>&1

echo Update And Security Settings > nul 2>&1
rem Delivery Optimization
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DoDownLoadMode" /t REG_DWORD /d "0" /f > nul 2>&1
rem Windows Defender
powershell.exe -command "Set-MpPreference -DisableRealtimeMonitoring 1"
powershell.exe -command "Set-MpPreference -DisableScanningMappedNetworkDrivesForFullScan 1"
powershell.exe -command "Set-MpPreference -DisableScanningNetworkFiles 1"
powershell.exe -command "Set-MpPreference -PUAProtection 0"
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoNTSecurity" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" /v "DisallowExploitProtectionOverride" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" /v "UILockdown" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Family options" /v "UILockdown" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection" /v "UILockdown" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\MpEngine" /v "MpEnablePus" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v "DisableBlockAtFirstSeen" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v "SpynetReporting" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f > nul 2>&1
reg delete "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f > nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "SecurityHealth" /f > nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f > nul 2>&1
reg delete "HKLM\Software\Policies\Microsoft\Windows Defender" /f > nul 2>&1
reg delete "HKLM\Software\Policies\Microsoft\Windows\System" /v "ShellSmartScreenLevel" /f > nul 2>&1

echo Privacy Settings > nul 2>&1
rem Windows Tips
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d "1" /f > nul 2>&1
rem Windows Biometrics
reg add "HKLM\Software\Policies\Microsoft\Biometrics\Credential Provider" /v "Enabled" /t "REG_DWORD" /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
rem Let Apps Show Me Personalized Ads By Using My Advertising ID
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /t REG_SZ /d "null" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /t REG_SZ /d "null" /f > nul 2>&1
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /t REG_SZ /d "null" /f > nul 2>&1
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
rem Let Websites Show Me Locally Relevant Content By Accessing My Language List
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\Settings\AllowLanguage" /v "value" /t REG_DWORD /d "0" /f > nul 2>&1
rem Let Windows Improve Start And Search Results By Tracking App Launches
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f > nul 2>&1
rem Activity Feed
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f > nul 2>&1
rem Suggested Content
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SlideshowEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f > nul 2>&1
rem Online Speech Recognition
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\Privacy\AllowInputPersonalization" /v "value" /t REG_DWORD /d "0" /f > nul 2>&1
rem Inking And Typing Personalization
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f > nul 2>&1
rem Send Optional Dianostgic Data
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /d "0" /t REG_DWORD /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotification" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableDiagnosticDataViewer" /t REG_DWORD /d "1" /f > nul 2>&1
rem Telemetry
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\TelemetryController" /v "RunsBlocked" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\System\AllowTelemetry" /v "value" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f > nul 2>&1
::reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "DisableWerReporting" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\RemovalTools\MpGears" /v "HeartbeatTrackingIndex" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\RemovalTools\MpGears" /v "SpyNetReportingLocation" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Troubleshooter" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Inventory" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /v "Enabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting   DoReport" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WDI\{C295FBBA-FD47-46ac-8BEE-B1715EC634E5}" /v "DownloadToolsEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WDI\{C295FBBA-FD47-46ac-8BEE-B1715EC634E5}" /v "ScenarioExecutionEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v "DisableQueryRemoteServer" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d "2" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d "2" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t REG_DWORD /d "1" /f > nul 2>&1
rem Tailored Experiences
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
rem Feedback Frequency
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f > nul 2>&1
rem Windows Search
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsAADCloudSearchEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsMSACloudSearchEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "SafeSearchMode" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\Search\AllowCloudSearch" /v "value" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaInAmbientMode" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "HistoryViewEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationOn" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationDefaultOn" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "VoiceShortcut" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationEnableAboveLockscreen" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OOBE" /v "DisableVoice" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AlwaysUseAutoLangDetection" /t REG_DWORD /d "0" /f > nul 2>&1
rem Location access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\System\AllowLocation" /v "value" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem Voice activation access
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationOnLockScreenEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
rem Background apps access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d "2" /f > nul 2>&1
rem Account info access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem Contacts access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem Calendar access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem Phone calls access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem Call history access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem Task access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem Email access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem Messaging access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem Radio control access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem App diagnostic access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f > nul 2>&1
rem Microsoft Diagnostics Standard Collector
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ConnectivityNoNetworkTime" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "DiagTrackAuthorization" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "DisableAutomaticTelemetryKeywordReporting" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "Disabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "TelemetryServiceDisabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "UploadPermissionReceived" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey" /v "EnableEventTranscript" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TestHooks" /v "DisableAsimovUpLoad" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TraceManager" /v "MiniTraceSlotEnabled" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\PerfTrack" /v "Disabled" /t REG_DWORD /d "1" /f > nul 2>&1
rem Logging
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1
rem Windows Media Player Collecting Statistics
reg add "HKCU\Software\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f > nul 2>&1
rem System Debugger
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_SZ /d "0" /f > nul 2>&1
rem Windows Error Reports
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "AutoApproveOSDumps" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "BypassDataThrottling" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "MachineID" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultConsent" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "NewUserDefaultConsent" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\WMR" /v "Disabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "AutoApproveOSDumps" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "BypassDataThrottling" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t "REG_DWORD" /d "1" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultOverrideBehavior" /t REG_DWORD /d "1" /f > nul 2>&1
rem Windows Customer Experience Improvement Program
reg add "HKLM\Software\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f > nul 2>&1
rem Windows Insider Program
reg add "HKLM\Software\Microsoft\WindowsSelfHost\UI\Visibility" /v "HideInsiderPage" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d "0" /f > nul 2>&1
rem Developer Mode
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowDevelopmentWithoutDevLicense" /t REG_DWORD /d "1" /f > nul 2>&1
rem FindMyDevice
reg add "HKLM\Software\Policies\Microsoft\FindMyDevice" /v "AllowFindMyDevice" /t REG_DWORD /d "0" /f > nul 2>&1
rem Sync of Settings
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSync" /t REG_DWORD /d "2" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSyncUserOverride" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "EnableBackupForWin8Apps" /t REG_DWORD /d "0" /f > nul 2>&1

echo Windows Fine-Tuning > nul 2>&1
rem Online Tips
reg add "HKLM\Software\Microsoft\PolicyManager\default\Settings\AllowOnlineTips" /v "value" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d "0" /f > nul 2>&1
rem Hidden Explorer Elements
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f > nul 2>&1
rem File Name Extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f > nul 2>&1
rem Separate process for Windows folders
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d "1" /f > nul 2>&1
rem Item Selection checkboxes
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d "1" /f > nul 2>&1
rem Task View
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f > nul 2>&1
rem Search Icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f > nul 2>&1
rem Transparency Effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f > nul 2>&1
rem Recently Opened Items
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f > nul 2>&1
rem Taskbar Buttons Size
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "1" /f > nul 2>&1
rem Desktop Icons Size
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "IconSize" /t REG_DWORD /d "32" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "Mode" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "LogicalViewMode" /t REG_DWORD /d "3" /f > nul 2>&1
rem Sign-in Screen Background Image
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "DisableLogonBackgroundImage" /t REG_DWORD /d "1" /f > nul 2>&1
rem History Of Recently Opened Documents
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d "0" /f > nul 2>&1
rem List Of Frequently Used Programs
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMFUprogramsList" /t REG_DWORD /d "0" /f > nul 2>&1
rem Sign-in Welcome Screen
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWelcomeScreen" /t REG_DWORD /d "0" /f > nul 2>&1
rem Recently Added Applications
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "HideRecentlyAddedApps" /t REG_DWORD /d "1" /f > nul 2>&1
rem OneDrive Advertising
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "1" /f > nul 2>&1
rem Thumbnail Caching In Hidden Files
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d "1" /f > nul 2>&1
rem Colors Of Elements In Window Titles
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "0" /f > nul 2>&1
rem Active Help
reg add "HKCU\Software\Classes\AppID\{8cec58ae-07a1-11d9-b15e-000d56bfe6ee}" /v "RunAs" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoExplicitFeedback" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoImplicitFeedback" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Assistance\Client\1.0" /v " NoActiveHelp" /t REG_DWORD /d "1" /f > nul 2>&1
reg delete "HKCU\Software\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}" /f > nul 2>&1
rem Publication Wizard
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t REG_DWORD /d "1" /f > nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t REG_DWORD /d "1" /f > nul 2>&1
rem Search Companion Files Update
reg add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v "DisableContentFileUpdates" /t REG_DWORD /d "1" /f > nul 2>&1
rem Background Image Quality
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "100" /f > nul 2>&1
rem Cleaning The Context Menu
reg add "HKLM\Software\Classes\batfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\cmdfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\Drive\shell\change-passphrase" /v "LegacyDisable" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\Drive\shell\change-pin" /v "LegacyDisable" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\Drive\shell\encrypt-bde" /v "LegacyDisable" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\Drive\shell\encrypt-bde-elev" /v "LegacyDisable" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\Drive\shell\manage-bde" /v "LegacyDisable" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\Drive\shell\resume-bde" /v "LegacyDisable" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\Drive\shell\resume-bde-elev" /v "LegacyDisable" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\Drive\shell\unlock-bde" /v "LegacyDisable" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.3ds\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.3mf\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.3mf\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.bmp\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.dae\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.dxf\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.fbx\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.gif\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.glb\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.jfif\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.jpeg\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.jpe\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.jpg\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.obj\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.obj\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.ply\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.ply\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.png\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.stl\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.stl\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.tiff\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.tif\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg add "HKLM\Software\Classes\SystemFileAssociations\.wrl\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f > nul 2>&1
reg delete "HKLM\Software\Classes\.bmp\ShellNew" /f > nul 2>&1
reg delete "HKLM\Software\Classes\.contact\ShellNew" /f > nul 2>&1
reg delete "HKLM\Software\Classes\.rtf\ShellNew" /f > nul 2>&1
reg delete "HKLM\Software\Classes\.zip\CompressedFolder\ShellNew" /f > nul 2>&1
rem Opening "My Computer" in Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f > nul 2>&1
rem People icon on taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "HidePeopleBar" /t REG_DWORD /d "1" /f > nul 2>&1
rem Unnecessary Items In Windows Settings
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "SettingsPageVisibility" /t REG_SZ /d "hide:gaming-broadcasting;gaming-gamebar;gaming-gamedvr;gaming-gamemode;gaming-trueplay;gaming-xboxnetworking;windowsdefender;mobile-devices;mobile-devices-addphone;mobile-devices-addphone-direct" /f > nul 2>&1
rem Windows Spotlight
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t "REG_DWORD" /d "1" /f > nul 2>&1
rem Microsoft Consumer Experiences
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t "REG_DWORD" /d "1" /f > nul 2>&1

rem Hibernation
powercfg /hibernate off

rem Fast Startup
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f > nul 2>&1

rem Boot Optimization
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f > nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\WMI\AutoLogger\ReadyBoot" /v "Start" /t REG_DWORD /d "0" /f > nul 2>&1

rem Windows Activation
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX > nul 2>&1
slmgr /skms kms.digiboy.ir > nul 2>&1
slmgr /ato > nul 2>&1

rem Countdown
timeout 5 > nul 2>&1

rem Reboot
shutdown /r /f /t 0
