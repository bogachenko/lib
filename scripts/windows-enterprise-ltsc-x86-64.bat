@echo off
title Windows 10 Enterprise LTSC

rem Getting superuser rights
cd /d "%~dp0" && (
    if not "%1"=="am_admin" (
        echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 am_admin", "", "runas", 1 >> "%temp%\getadmin.vbs"
        "%temp%\getadmin.vbs"
        exit /B
    )
    del "%temp%\getadmin.vbs" >nul 2>&1
)

:: Windows 10 Enterprise LTSC build 19044.4412 x86_64
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
:: Last update: May 2024

echo Stopping the Windows Explorer process...
tasklist /fi "imagename eq explorer.exe" 2>nul | find /i "explorer.exe" && (
    taskkill /f /im explorer.exe
) || (
    echo The Windows Explorer process was not found.
)

echo Restoring the Downloads folder name
timeout /t 2 /nobreak >nul
set "DownloadsFolder=%USERPROFILE%\Downloads"
if not exist "%DownloadsFolder%" mkdir "%DownloadsFolder%"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\Users\%USERNAME%\Downloads" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Downloads" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Downloads" /f
attrib +r -s -h "%DownloadsFolder%" /s /d
timeout /t 1 /nobreak >nul

echo Windows Task Scheduler
rem Windows Defender Tasks
for %%T in (
    "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
    "Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
    "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
    "Microsoft\Windows\Windows Defender\Windows Defender Verification"
) do schtasks /change /tn "\%%~T" /disable
rem Diagnostics and troubleshooting tasks
for %%T in (
    "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
    "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner"
    "Microsoft\Windows\Diagnosis\Scheduled"
    "Microsoft\Windows\Shell\IndexerAutomaticMaintenance"
    "Microsoft\Windows\WDI\ResolutionHost"
    "Microsoft\Windows\Flighting\OneSettings\RefreshCache"
) do schtasks /change /tn "\%%~T" /disable
rem Customer Experience Improvement Program tasks
for %%T in (
    "Microsoft\Windows\Autochk\Proxy"
    "Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
    "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
    "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
    "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
    "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
    "Microsoft\Windows\PI\Sqm-Tasks"
) do schtasks /change /tn "\%%~T" /disable

rem Microsoft Compatibility Telemetry Tasks
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable
rem Windows Exploit Guard Defender Task
schtasks /change /tn "\Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /disable
rem Disk Fingerprint Tasks
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /disable
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\StorageSense" /disable
rem Family Safety Tasks
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /disable
rem System Performance Diagnostics Task
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable
rem File Usage Statistics Collection Task
schtasks /change /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable
rem Network Information Collector Task
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable
rem Xbox Tasks
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTask" /disable
rem RetailDemo Offline Content Automatic Cleanup Task
schtasks /change /tn "\Microsoft\Windows\RetailDemo\CleanupOfflineContent" /disable
rem Send Error Reporting Task
schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
rem Location Notification Tasks
schtasks /change /tn "\Microsoft\Windows\Location\Notifications" /disable
schtasks /change /tn "\Microsoft\Windows\Location\WindowsActionDialog" /disable
rem Device Data Collection and Sending Tasks
schtasks /change /tn "\Microsoft\Windows\Device Information\Device" /disable
schtasks /change /tn "\Microsoft\Windows\Device Information\Device User" /disable
rem Microsoft Office Tasks
schtasks /change /tn "\Microsoft\Office\Office ClickToRun Service Monitor" /disable
rem Boot Optimization Task
schtasks /change /tn "\Microsoft\Windows\Sysmain\ResPriStaticDbSync" /disable
schtasks /change /tn "\Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /disable
rem Mobile Network Metadata Analysis Task
schtasks /change /tn "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /disable
rem Data Usage Subscription Management Task
schtasks /change /tn "\Microsoft\Windows\DUSM\dusmtask" /disable
rem Update Center Telemetry Task
schtasks /change /tn "\Microsoft\Windows\UNP\RunUpdateNotificationMgr" /disable

echo Components of Windows OS.
rem Checking the status of Windows Media components
PowerShell -ExecutionPolicy Unrestricted -Command "(Get-WindowsOptionalFeature -Online -FeatureName 'MediaPlayback','WindowsMediaPlayer').State | Out-File -FilePath MediaComponentsState.txt -Encoding UTF8"
rem Checking the status of Internet Explorer 11 components
PowerShell -ExecutionPolicy Unrestricted -Command "(Get-WindowsCapability -Online -Name 'Browser.InternetExplorer*').State | Out-File -FilePath IEComponentsState.txt -Encoding UTF8"
rem Checking the status of the Steps Recorder components
PowerShell -ExecutionPolicy Unrestricted -Command "(Get-WindowsCapability -Online -Name 'App.StepsRecorder*').State | Out-File -FilePath StepsRecorderState.txt -Encoding UTF8"
rem Checking the status of Quick Assist components
PowerShell -ExecutionPolicy Unrestricted -Command "(Get-WindowsCapability -Online -Name 'App.Support.QuickAssist*').State | Out-File -FilePath QuickAssistState.txt -Encoding UTF8"
rem Checking the status of Hello Face components
PowerShell -ExecutionPolicy Unrestricted -Command "(Get-WindowsCapability -Online -Name 'Hello.Face*').State | Out-File -FilePath HelloFaceState.txt -Encoding UTF8"
rem Defining the component status file
set "MediaComponentsStateFile=MediaComponentsState.txt"
set "IEComponentsStateFile=IEComponentsState.txt"
set "StepsRecorderStateFile=StepsRecorderState.txt"
set "QuickAssistStateFile=QuickAssistState.txt"
set "HelloFaceStateFile=HelloFaceState.txt"
rem Checking the status of each position before executing the code
findstr /C:"Enabled" "%MediaComponentsStateFile%" >nul || (
    echo Windows Media Components are not disabled.
    goto :ExecuteCode
)
findstr /C:"Disabled" "%IEComponentsStateFile%" >nul || (
    echo Internet Explorer 11 Components are not disabled.
    goto :ExecuteCode
)
findstr /C:"Disabled" "%StepsRecorderStateFile%" >nul || (
    echo Steps Recorder Components are not disabled.
    goto :ExecuteCode
)
findstr /C:"Disabled" "%QuickAssistStateFile%" >nul || (
    echo Quick Assist Components are not disabled.
    goto :ExecuteCode
)
findstr /C:"Disabled" "%HelloFaceStateFile%" >nul || (
    echo Hello Face Components are not disabled.
    goto :ExecuteCode
)
echo All components are already disabled.
goto :EndScript
:ExecuteCode
echo Disabling components...
rem Windows Media Components
PowerShell -ExecutionPolicy Unrestricted -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'MediaPlayback','WindowsMediaPlayer' -NoRestart"
if %errorlevel% equ 0 (
    echo Windows Media Components disabled successfully.
) else (
    echo Failed to disable Windows Media Components.
)
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'Media.WindowsMediaPlayer*' | Remove-WindowsCapability -Online -NoRestart"
if %errorlevel% equ 0 (
    echo Windows Media Player capability removed successfully.
) else (
    echo Failed to remove Windows Media Player capability.
)
rem Internet Explorer 11 Components
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'Browser.InternetExplorer*' | Remove-WindowsCapability -Online -NoRestart"
if %errorlevel% equ 0 (
    echo Internet Explorer 11 Components removed successfully.
) else (
    echo Failed to remove Internet Explorer 11 Components.
)
rem Steps Recorder Components
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'App.StepsRecorder*' | Remove-WindowsCapability -Online -NoRestart"
if %errorlevel% equ 0 (
    echo Steps Recorder Components removed successfully.
) else (
    echo Failed to remove Steps Recorder Components.
)
rem Quick Assist Components
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'App.Support.QuickAssist*' | Remove-WindowsCapability -Online -NoRestart"
if %errorlevel% equ 0 (
    echo Quick Assist Components removed successfully.
) else (
    echo Failed to remove Quick Assist Components.
)
rem Hello Face Components
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'Hello.Face*' | Remove-WindowsCapability -Online -NoRestart"
if %errorlevel% equ 0 (
    echo Hello Face Components removed successfully.
) else (
    echo Failed to remove Hello Face Components.
)
:EndScript
rem Deleting temporary component status files
del "%MediaComponentsStateFile%"
del "%IEComponentsStateFile%"
del "%StepsRecorderStateFile%"
del "%QuickAssistStateFile%"
del "%HelloFaceStateFile%"

echo Stopping Tracking Services
rem Diagnostics Tracking Service
reg add "HKLM\System\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f
rem Diagnostic Execution Service
reg add "HKLM\System\CurrentControlSet\Services\diagsvc" /v "Start" /t REG_DWORD /d "4" /f
rem WAP Push Message Routing Service
reg add "HKLM\System\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f
rem Standard Diagnostic Center Collector Service
reg add "HKLM\System\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f
rem Xbox Services
reg add "HKLM\System\CurrentControlSet\Services\XblAuthManager" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\XboxGipSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\XboxNetApiSvc" /v "Start" /t REG_DWORD /d "4" /f
rem Store Demonstration Service
reg add "HKLM\System\CurrentControlSet\Services\RetailDemo" /v "Start" /t REG_DWORD /d "4" /f
rem Windows Search Service
reg add "HKLM\System\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f
rem Windows Error Logging Services
reg add "HKLM\System\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\wercplsupport" /v "Start" /t REG_DWORD /d "4" /f
rem Data Usage Service
reg add "HKLM\System\CurrentControlSet\Services\DusmSvc" /v "Start" /t REG_DWORD /d "4" /f
rem SSDP Discovery Service
reg add "HKLM\System\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d "4" /f
rem Geolocation Service
reg add "HKLM\System\CurrentControlSet\Services\lfsvc" /v "Start" /t REG_DWORD /d "4" /f
rem Downloaded Maps Manager Service
reg add "HKLM\System\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f
rem Delivery Optimization Service
reg add "HKLM\System\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f
rem System Performance Improvement Service
reg add "HKLM\System\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f
rem Broadcast DVR User Service
reg add "HKLM\System\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d "4" /f
rem Windows Biometric Service
reg add "HKLM\System\CurrentControlSet\Services\WbioSrvc" /v "Start" /t REG_DWORD /d "4" /f
rem Windows Insider Service
reg add "HKLM\System\CurrentControlSet\Services\wisvc" /v "Start" /t REG_DWORD /d "4" /fч
rem Smart Card
reg add "HKLM\System\CurrentControlSet\Services\SCardSvr" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\CertPropSvc" /t REG_DWORD /d "4" /f
rem Chemtable Startup Checking
reg add "HKLM\System\CurrentControlSet\Services\Chemtable Startup Checking" /t REG_DWORD /d "4" /f

echo Time And Language Setting
rem Show Text Suggestions When Typing On The Physical Keyboard
reg add "HKCU\Software\Microsoft\Input\Settings" /v "EnableHwkbTextPrediction" /t REG_DWORD /d "0" /f
rem Multilingual Text Suggestions
reg add "HKCU\Software\Microsoft\Input\Settings" /v "MultilingualEnabled" /t REG_DWORD /d "0" /f
rem Voice Typing
reg add "HKCU\Software\Microsoft\Input\Settings" /v "VoiceTypingEnabled" /t REG_DWORD /d "0" /f
rem Collecting And Transmitting The Texts You Type
reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
rem Spelling And Correction Of Misspelled Words
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableAutocorrection" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableDoubleTapSpace" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnablePredictionSpaceInsertion" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableSpellchecking" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableTextPrediction" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Policies\Microsoft\Control Panel\International" /v "TurnOffAutocorrectMisspelledWords" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\Control Panel\International" /v "TurnOffHighlightMisspelledWords" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\Control Panel\International" /v "TurnOffOfferTextPredictions" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\TabletTip\1.7" /v "DisablePrediction" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\TabletTip\1.7" /v "DisablePrediction" /t REG_DWORD /d "1" /f
rem Improve Inking And Typing Recognition
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v "AllowLinguisticDataCollection" /t REG_DWORD /d "0" /f
rem Input Analysis
reg add "HKCU\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Input\Settings" /v "HarvestContacts" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Input\Settings" /v "LMDataLoggerEnabled" /t REG_DWORD /d "0" /f

echo Games Settings
rem Xbox
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
reg add "HKLM\Software\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\GameUX" /v "DownloadGameInfo" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\GameUX" /v "GameUpdateOptions" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\GameUX" /v "ListRecentlyPlayed" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\WOW6432Nade\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f

echo Bluetooth And Devices Settings
rem Suggestions For Using My Android Phone With Windows
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Mobility" /v "OptedIn" /t REG_DWORD /d "0" /f
rem Autoplay for all media and devices
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t REG_DWORD /d "1" /f

echo Update And Security Settings
rem Delivery Optimization
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DoDownLoadMode" /t REG_DWORD /d "0" /f
rem Windows Defender
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableScanningMappedNetworkDrivesForFullScan /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableScanningNetworkFiles /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v PUADetection /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoNTSecurity" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" /v "DisallowExploitProtectionOverride" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" /v "UILockdown" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Family options" /v "UILockdown" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection" /v "UILockdown" /t REG_DWORD /d "1" /f
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
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f
reg delete "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "SecurityHealth" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows Defender" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows\System" /v "ShellSmartScreenLevel" /f

echo Privacy Settings
rem Windows PowerShell Telemetry
setx POWERSHELL_TELEMETRY_OPTOUT 1
rem DOTNET cli Telemetry
setx DOTNET_CLI_TELEMETRY_OPTOUT 1
rem Windows Tips
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d "1" /f
rem Wi-Fi sense
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d "0" /f
rem Windows Sensors
reg add "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t REG_DWORD /d "1" /f
rem Windows Biometrics
reg add "HKLM\Software\Policies\Microsoft\Biometrics\Credential Provider" /v "Enabled" /t "REG_DWORD" /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d "0" /f
rem Let Apps Show Me Personalized Ads By Using My Advertising ID
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /t REG_SZ /d "null" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /t REG_SZ /d "null" /f
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /t REG_SZ /d "null" /f
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
rem Let Websites Show Me Locally Relevant Content By Accessing My Language List
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
rem Let Windows Improve Start And Search Results By Tracking App Launches
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
rem Activity Feed
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f
rem Suggested Content
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
rem Online Speech Recognition
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\Privacy\AllowInputPersonalization" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d "0" /f
rem Inking And Typing Personalization
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f
rem Send Optional Dianostgic Data
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /d "0" /t REG_DWORD /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotification" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableDiagnosticDataViewer" /t REG_DWORD /d "1" /f
rem Telemetry
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\TelemetryController" /v "RunsBlocked" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableExperimentation" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\System\AllowTelemetry" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f
::reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "DisableWerReporting" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\RemovalTools\MpGears" /v "HeartbeatTrackingIndex" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\RemovalTools\MpGears" /v "SpyNetReportingLocation" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Troubleshooter" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Inventory" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting   DoReport" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WDI\{C295FBBA-FD47-46ac-8BEE-B1715EC634E5}" /v "DownloadToolsEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WDI\{C295FBBA-FD47-46ac-8BEE-B1715EC634E5}" /v "ScenarioExecutionEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v "DisableQueryRemoteServer" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d "2" /f
reg add "HKLM\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d "2" /f
reg add "HKCU\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t REG_DWORD /d "1" /f
rem Tailored Experiences
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
rem Feedback Frequency
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
reg delete "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
rem Windows Search
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsAADCloudSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsMSACloudSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "SafeSearchMode" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\Search\AllowCloudSearch" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CanCortanaBeEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaInAmbientMode" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "HistoryViewEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationOn" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationDefaultOn" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "VoiceShortcut" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "VoiceActivationEnableAboveLockscreen" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OOBE" /v "DisableVoice" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AlwaysUseAutoLangDetection" /t REG_DWORD /d "0" /f
rem Location access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\System\AllowLocation" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
rem Voice activation access
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationOnLockScreenEnabled" /t REG_DWORD /d "0" /f
rem Background apps access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d "2" /f
rem Account info access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
rem Contacts access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
rem Calendar access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
rem Phone calls access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
rem Call history access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
rem Task access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
rem Email access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
rem Messaging access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
rem Radio control access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
rem App diagnostic access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
rem Microsoft Diagnostics Standard Collector
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ConnectivityNoNetworkTime" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "DiagTrackAuthorization" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "DisableAutomaticTelemetryKeywordReporting" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "TelemetryServiceDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "UploadPermissionReceived" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey" /v "EnableEventTranscript" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TestHooks" /v "DisableAsimovUpLoad" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TraceManager" /v "MiniTraceSlotEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\PerfTrack" /v "Disabled" /t REG_DWORD /d "1" /f
rem Logging
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f
rem System Debugger
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_SZ /d "0" /f
rem Windows Error Reports
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "AutoApproveOSDumps" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "BypassDataThrottling" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "MachineID" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultConsent" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "NewUserDefaultConsent" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\WMR" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "AutoApproveOSDumps" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "BypassDataThrottling" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t "REG_DWORD" /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultOverrideBehavior" /t REG_DWORD /d "1" /f
rem Windows Customer Experience Improvement Program
reg add "HKLM\Software\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
rem Windows Insider Program
reg add "HKLM\Software\Microsoft\WindowsSelfHost\UI\Visibility" /v "HideInsiderPage" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d "0" /f
rem Developer Mode
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowDevelopmentWithoutDevLicense" /t REG_DWORD /d "1" /f
rem FindMyDevice
reg add "HKLM\Software\Policies\Microsoft\FindMyDevice" /v "AllowFindMyDevice" /t REG_DWORD /d "0" /f
rem Sync of Settings
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSync" /t REG_DWORD /d "2" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSyncUserOverride" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "EnableBackupForWin8Apps" /t REG_DWORD /d "0" /f

echo Windows Fine-Tuning
rem Windows Maps
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d "0" /f
rem Online Tips
reg add "HKLM\Software\Microsoft\PolicyManager\default\Settings\AllowOnlineTips" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d "0" /f
rem Hidden Explorer Elements
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f
rem File Name Extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
rem Separate process for Windows folders
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d "1" /f
rem Item Selection checkboxes
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d "1" /f
rem Task View
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f
rem Search Icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
rem Transparency Effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f
rem Recently Opened Items
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
rem Taskbar Buttons Size
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "1" /f
rem Desktop Icons Size
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "IconSize" /t REG_DWORD /d "32" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "Mode" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "LogicalViewMode" /t REG_DWORD /d "3" /f
rem Sign-in Screen Background Image
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "DisableLogonBackgroundImage" /t REG_DWORD /d "1" /f
rem History Of Recently Opened Documents
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d "0" /f
rem List Of Frequently Used Programs
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMFUprogramsList" /t REG_DWORD /d "0" /f
rem Sign-in Welcome Screen
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWelcomeScreen" /t REG_DWORD /d "0" /f
rem Recently Added Applications
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "HideRecentlyAddedApps" /t REG_DWORD /d "1" /f
rem OneDrive Advertising
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "1" /f
rem Thumbnail Caching In Hidden Files
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d "1" /f
rem Colors Of Elements In Window Titles
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "0" /f
rem Active Help
reg add "HKCU\Software\Classes\AppID\{8cec58ae-07a1-11d9-b15e-000d56bfe6ee}" /v "RunAs" /t REG_SZ /d "" /f
reg add "HKCU\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoExplicitFeedback" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoImplicitFeedback" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Assistance\Client\1.0" /v " NoActiveHelp" /t REG_DWORD /d "1" /f
reg delete "HKCU\Software\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}" /f
rem Publication Wizard
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t REG_DWORD /d "1" /f
rem Search Companion Files Update
reg add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v "DisableContentFileUpdates" /t REG_DWORD /d "1" /f
rem Background Image Quality
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "100" /f
rem Cleaning The Context Menu
reg add "HKLM\Software\Classes\batfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\cmdfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\Drive\shell\change-passphrase" /v "LegacyDisable" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\Drive\shell\change-pin" /v "LegacyDisable" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\Drive\shell\encrypt-bde" /v "LegacyDisable" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\Drive\shell\encrypt-bde-elev" /v "LegacyDisable" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\Drive\shell\manage-bde" /v "LegacyDisable" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\Drive\shell\resume-bde" /v "LegacyDisable" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\Drive\shell\resume-bde-elev" /v "LegacyDisable" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\Drive\shell\unlock-bde" /v "LegacyDisable" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.3ds\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.3mf\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.3mf\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.bmp\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.dae\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.dxf\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.fbx\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.gif\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.glb\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.jfif\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.jpeg\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.jpe\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.jpg\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.obj\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.obj\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.ply\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.ply\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.png\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.stl\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.stl\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.tiff\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.tif\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKLM\Software\Classes\SystemFileAssociations\.wrl\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg delete "HKLM\Software\Classes\.bmp\ShellNew" /f
reg delete "HKLM\Software\Classes\.contact\ShellNew" /f
reg delete "HKLM\Software\Classes\.rtf\ShellNew" /f
reg delete "HKLM\Software\Classes\.zip\CompressedFolder\ShellNew" /f
rem Opening "My Computer" in Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f
rem People icon on taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "HidePeopleBar" /t REG_DWORD /d "1" /f
rem Unnecessary Items In Windows Settings
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "SettingsPageVisibility" /t REG_SZ /d "hide:gaming-broadcasting;gaming-gamebar;gaming-gamedvr;gaming-gamemode;gaming-trueplay;gaming-xboxnetworking;windowsdefender;mobile-devices;mobile-devices-addphone;mobile-devices-addphone-direct" /f
rem Windows Spotlight
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t "REG_DWORD" /d "1" /f
rem Microsoft Consumer Experiences
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t "REG_DWORD" /d "1" /f
rem Lock the Taskbar
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LockTaskbar" /t "REG_DWORD" /d "1" /f
rem Clearing the pagefile.sys page file when shutting down Windows
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown" /v "ClearPageFileAtShutdown" /t "REG_DWORD" /d "1" /f

rem Hibernation
powercfg /hibernate off

rem Sleep Settings
powercfg -x standby-timeout-dc 0
powercfg -x standby-timeout-ac 0

rem Fast Startup
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f

rem Boot Optimization
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\AutoLogger\ReadyBoot" /v "Start" /t REG_DWORD /d "0" /f

rem Firewall
netsh advfirewall set allprofiles state off
set KEY_NAME="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MpsSvc"
set VALUE_NAME=Start
set VALUE_DATA=4
reg.exe add %KEY_NAME% /v %VALUE_NAME% /t REG_DWORD /d %VALUE_DATA% /f
if %ERRORLEVEL% EQU 0 (
    echo The value of the Start parameter for the Windows Firewall service has been successfully changed.
) else (
    echo An error occurred when changing the value of the Start parameter for the Windows Firewall service.
)
timeout 5

echo Windows Activation
rem Checking Internet connection.
ping -n 1 "1.1.1.1" >nul
if errorlevel 1 (
    echo There is no internet connection.
    exit /b
) else (
    echo There is an Internet connection.
)
rem Process of activating Windows OS.
start /B "" cmd /c "slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul 2>&1" && (
    echo Activation was completed successfully.
) || (
    echo An error occurred during activation.
)
start /B "" cmd /c "slmgr /skms kms.digiboy.ir >nul 2>&1" && (
    echo A new KMS key has been installed.
) || (
    echo Error installing the KMS key.
)
start /B "" cmd /c "slmgr /ato >nul 2>&1" && (
    echo Windows activation was successful.
) || (
    echo An error occurred when activating Windows.
)
timeout 5

echo Reboot the system.
shutdown /r /f /t 0