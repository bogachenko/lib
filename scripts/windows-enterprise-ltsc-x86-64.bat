@echo off

rem Getting root
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Windows 10 Enterprise LTSC build 19044.2075 x86_64
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

:: Copyright 2022 Bogachenko Vyacheslav
::
:: This script is provided "AS IS" without warranty of any kind, either expressed or implied.
:: Use it at your own risk! The author is not responsible for any claims for damage that may arise from the use of this script.

echo Stop Necessary Processes
rem Stop Windows Explorer
taskkill /f /im explorer.exe
rem Stop Windows Security Health Service
taskkill /f /im SecurityHealthService.exe > NUL 2>&1
taskkill /f /im SecurityHealthSystray.exe > NUL 2>&1
rem Stop Microsoft Compatibility Telemetry
taskkill /f /im compattelrunner.exe > NUL 2>&1
rem Stop SmartScreen
taskkill /f /im smartscreen.exe > NUL 2>&1

echo Task Scheduler Settings
rem Stop Microsoft Compatibility Appraiser Tasks
schtasks /change /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
schtasks /change /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
schtasks /change /tn "Microsoft\Windows\Application Experience\StartupAppTask" /disable
rem Stop Windows Defender Tasks
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Verification" /disable
rem Stop Windows Defender Exploit Guard Task
schtasks /change /tn "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /disable
rem Stop Collecting SQM Data Task
schtasks /change /tn "Microsoft\Windows\Autochk\Proxy" /disable
rem Stop Windows Disk Diagnostics Tasks
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable
rem Stop Software Quality Improvement Program Tasks
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable
rem Stop Disk Footprint Tasks
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /disable
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\StorageSense" /disable
rem Stop Power Efficiency Diagnostics System Task
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable
rem Stop Family Safety Tasks
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /disable
rem Stop System Performance Diagnostics Task
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable
rem Stop Backup Location Task
schtasks /change /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable
rem Stop Sqm Tasks
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /disable
rem Stop Network Information Collector Task
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable
rem Stop Automatic Scanning And Troubleshooting Tasks
schtasks /change /tn "\Microsoft\Windows\Diagnosis\Scheduled" /disable
schtasks /change /tn "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /disable
rem Stop Supporting Updating Search Indexes Task
schtasks /change /tn "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance" /disable
rem Stop Windows Diagnostic Infrastructure Resolution Host Task
schtasks /change /tn "\Microsoft\Windows\WDI\ResolutionHost" /disable
rem Stop Xbox Task
schtasks /change /tn "Microsoft\XblGameSave\XblGameSaveTask" /disable
rem Stop Auto Cleanup RetailDemo Offline Content Task
schtasks /change /tn "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /disable
rem Stop Error Reporting Task 
schtasks /change /tn "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
rem Location Notification Tasks
schtasks /change /tn "Microsoft\Windows\Location\Notifications" /disable
schtasks /change /tn "Microsoft\Windows\Location\WindowsActionDialog" /disable
rem Collecting And Sending Device Data Tasks
schtasks /change /tn "Microsoft\Windows\Device Information\Device" /disable
schtasks /change /tn "Microsoft\Windows\Device Information\Device User" /disable
rem Microsoft Office Task
schtasks /change /tn "Microsoft\Office\Office ClickToRun Service Monitor" /disable
schtasks /change /tn "Microsoft\Office\Office Performance Monitor" /disable

echo Stopping And Removing Tracking Services
rem Stop Diagnostics Tracking Service
sc config "DiagTrack" start=disabled
sc stop DiagTrack
sc delete DiagTrack
rem Stop Diagnostic Execution Service
sc config "diagsvc" start=disabled
sc stop diagsvc
sc delete diagsvc
rem Stop WAP-push Service
sc config "dmwappushservice" start=disabled
sc stop dmwappushservice
sc delete dmwappushservice
rem Stop Diagnostics Hub Standard Collector Service
sc config "diagnosticshub.standardcollector.service" start=disabled
sc stop diagnosticshub.standardcollector.service
sc delete diagnosticshub.standardcollector.service
rem Stop Gaming Services
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
rem Stop Store Demonstration Service
sc config "RetailDemo" start=disabled
sc stop RetailDemo
sc delete RetailDemo
rem Stop Windows Search Service
sc config "WSearch" start=disabled
sc stop WSearch
sc delete WSearch
rem Stop Windows Error Reporting Service
sc config "WerSvc" start=disabled
sc stop WerSvc
sc delete WerSvc
rem Stop Data Usage Service
sc config "DusmSvc" start=disabled
sc stop DusmSvc
sc delete DusmSvc
rem Stop SSDP Discovery Service
sc config "SSDPSRV" start=disabled
sc stop SSDPSRV
sc delete SSDPSRV
rem Stop Geolocation Service
sc config "lfsvc" start=disabled
sc stop lfsvc
sc delete lfsvc
rem Downloaded Maps Manager
sc config "MapsBroker" start=disabled
sc stop MapsBroker
sc delete MapsBroker
rem Delivery optimization
sc config "DoSvc" start=disabled
sc stop DoSvc
sc delete DoSvc

echo Time And Language Setting
rem Input Analysis
reg add "HKCU\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f
rem Autocorrect Misspelled Words
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableAutocorrection" /t REG_DWORD /d "0" /f
rem Highlight Misspelled Words
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableSpellchecking" /t REG_DWORD /d "0" /f
rem Show Text Suggestions When Typing On The Physical Keyboard
reg add "HKCU\Software\Microsoft\Input\Settings" /v "EnableHwkbTextPrediction" /t REG_DWORD /d "0" /f
rem Multilingual Text Suggestions
reg add "HKCU\Software\Microsoft\Input\Settings" /v "MultilingualEnabled" /t REG_DWORD /d "0" /f
rem Voice Typing
reg add "HKCU\Software\Microsoft\Input\Settings" /v "VoiceTypingEnabled" /t REG_DWORD /d "0" /f
rem Collecting And Transmitting The Texts You Type
reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f 

echo Games Settings
rem Xbox
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f

echo Bluetooth And Devices Settings
rem Show Me Suggestions For Using My Android Phone With Windows
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Mobility" /v "OptedIn" /t REG_DWORD /d "0" /f
rem Use Autoplay For All Media And Devices
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t REG_DWORD /d "1" /f 

echo Update And Security Settings
rem Delivery Optimization
reg add "HKU\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f
rem Real-time protection
reg delete "HKLM\Software\Policies\Microsoft\Windows Defender" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\MpEngine" /v "MpEnablePus" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v "DisableBlockAtFirstSeen" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v "SpynetReporting" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "SecurityHealth" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f
rem Logging
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f


echo Privacy Settings
rem Let apps show me personalized ads by using my advertising ID
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
rem Let websites show me locally relevant content by accessing my language list
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
rem Let Windows improve Start and search results by tracking app launches
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
rem Suggested content
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SlideshowEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f
rem Online speech recognition
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
rem Inking and typing personalization
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
rem Send optional dianostgic data
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
rem Tailored experiences
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
rem Feedback Frequency
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
rem Safe Search
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "SafeSearchMode" /t REG_DWORD /d "0" /f
rem Cloud content search
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsMSACloudSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsAADCloudSearchEnabled" /t REG_DWORD /d "0" /f
rem Search history on this device
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
rem Bing Search on Windows
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
rem Location access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
rem Camera access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f
rem Voice activation access
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationOnLockScreenEnabled" /t REG_DWORD /d "0" /f
rem Background apps access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d "2" /f
rem Account info access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
rem Contacts access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
rem Calendar access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
rem Phone calls access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
rem Call history access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
rem Task access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
rem Email access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
rem Messaging access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
rem Radio control access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
rem App diagnostic access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
rem Diagnostics Tracking Service
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f
rem Microsoft Diagnostics Center Standard Collector Services
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f
rem Windows Media Player statistics
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f
rem System Debugger
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_SZ /d "0" /f
rem Windows Error Reporting
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f

echo Windows Fine-Tuning
rem Show hidden files, folders and drives
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f
rem Show extensions for known file types
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
rem Launch folder windows in a separate process
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d "1" /f
rem Checkboxes for item selection
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d "1" /f
rem Task view
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f
rem Search icon on the taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
rem Transparency Effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f
rem Show recently opened items in Start, Jump Lists, and File Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
rem Size of the taskbar buttons
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "0" /f
rem Size of the desktop icons
reg add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "IconSize" /t REG_DWORD /d "32" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "Mode" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\Shell\Bags\1\Desktop" /v "LogicalViewMode" /t REG_DWORD /d "3" /f

rem Hibernation
powercfg /hibernate off

rem Fast startup
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f

rem Countdown
timeout 5

rem Reboot
shutdown /r /f /t 0
