@echo off

:: Getting root
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Windows 11 build 22000.318 x86_64
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
rem Stop OneDrive App
taskkill /f /im OneDrive.exe > NUL 2>&1
taskkill /f /im OneDriveStandaloneUpdater.exe > NUL 2>&1
rem Stop Microsoft Compatibility Telemetry
taskkill /f /im compattelrunner.exe > NUL 2>&1
rem Stop SmartScreen
taskkill /f /im smartscreen.exe > NUL 2>&1
rem Stopping the YourPhone app
taskkill /im YourPhone.exe /f > NUL 2>&1

echo Remove OneDrive App
%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe /uninstall
rd "%USERPROFILE%\OneDrive" /Q /S > NUL 2>&1
rd "C:\OneDriveTemp" /Q /S > NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S > NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S > NUL 2>&1
powershell.exe -ex bypass -command "Get-ScheduledTask -TaskName *onedrive* | Disable-ScheduledTask
powershell.exe -command "rm C:\Windows\System32\Tasks\OneDrive*"

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
rem Stop Microsoft Office Telemetry Tasks
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /disable
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /disable
schtasks /change /tn "\Microsoft\Office\Office ClickToRun Service Monitor" /disable
rem Stop Automatic Scanning And Troubleshooting Tasks
schtasks /change /tn "\Microsoft\Windows\Diagnosis\Scheduled" /disable
schtasks /change /tn "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /disable
rem Stop Supporting Updating Search Indexes Task
schtasks /change /tn "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance" /disable
rem Stop Windows Diagnostic Infrastructure Resolution Host Task
schtasks /change /tn "\Microsoft\Windows\WDI\ResolutionHost" /disable
rem Stop Overwolf Auto-update Task
schtasks /change /tn "Overwolf Updater Task" /disable
rem Stop CCleaner Auto-update Task
schtasks /change /tn "CCleaner Update" /disable
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
rem sc config "DoSvc" start=disabled
rem sc stop DoSvc
rem sc delete DoSvc

echo Remove Built-In Windows Metro Apps
rem Remove Windows Office App
powershell.exe -command "Get-AppxPackage -allusers *officehub* | Remove-AppxPackage"
rem Remove Microsoft Solitaire Collection Game
powershell.exe -command "Get-AppxPackage -allusers *solitairecollection* | Remove-AppxPackage"
rem Remove Cortana App
powershell.exe -command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"
winget uninstall "cortana"
rem Remove Microsoft Teams App
powershell.exe -command "Get-AppxPackage -allusers *microsoftteams* | Remove-AppxPackage"
rem Remove Bing News App
powershell.exe -command "Get-AppxPackage -allusers *bingnews* | Remove-AppxPackage"
rem Remove Bing Weather App
powershell.exe -command "Get-AppxPackage -allusers *bingweather* | Remove-AppxPackage"
rem Remove Xbox Apps
powershell.exe -command "Get-AppxPackage -allusers *xboxgamingoverlay* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxidentityprovider* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxspeechtotextoverlay* | Remove-AppxPackage" 
powershell.exe -command "Get-AppxPackage -allusers *xbox.tcui* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxapp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *gamingapp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *gamingservices* | Remove-AppxPackage"
winget uninstall "xbox game bar"
winget uninstall "xbox game bar plugin"
winget uninstall "xbox game speech window"
winget uninstall "xbox identity provider"
rem Remove YourPhone App
powershell.exe -command "Get-AppxPackage -allusers *yourphone* | Remove-AppxPackage"
winget uninstall "your phone"
rem Remove Power Automate App
powershell.exe -command "Get-AppxPackage -allusers *powerautomate* | Remove-AppxPackage"
rem Remove Windows Communications Apps
powershell.exe -command "Get-AppxPackage -allusers *windowscommunicationsapps* | Remove-AppxPackage"
rem Remove Get-Help App
powershell.exe -command "Get-AppxPackage -allusers *gethelp* | Remove-AppxPackage"
winget uninstall "get help"
rem Remove Get Started App
powershell.exe -command "Get-AppxPackage -allusers *getstarted* | Remove-AppxPackage"
rem Remove Microsoft To Do App
powershell.exe -command "Get-AppxPackage -allusers *todos* | Remove-AppxPackage"
rem Remove Microsoft Feedback Hub App
powershell.exe -command "Get-AppxPackage -allusers *windowsfeedbackhub* | Remove-AppxPackage"
rem Remove Maps App
powershell.exe -command "Get-AppxPackage -allusers *windowsmaps* | Remove-AppxPackage"
winget uninstall "windows maps"
rem Remove Groove Music App
powershell.exe -command "Get-AppxPackage -allusers *zunemusic* | Remove-AppxPackage"
rem Remove Microsoft Movies and TV App
powershell.exe -command "Get-AppxPackage -allusers *zunevideo* | Remove-AppxPackage"
rem Remove Camera App
powershell.exe -command "Get-AppxPackage -allusers *windowscamera* | Remove-AppxPackage"
rem Remove Sound Recorder App
powershell.exe -command "Get-AppxPackage -allusers *windowssoundrecorder* | Remove-AppxPackage"
rem Remove Microsoft People App
winget uninstall "microsoft people"
rem Force Removal of Built-In Windows Apps
set ProgramFiles=C:\Program Files
set TempDirWIN=%WINDIR%\TEMP
:stepone
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.549981C3F5F10_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.YourPhone_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.windowscommunicationsapps_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.BingNews_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.BingWeather_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.GamingApp_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.GetHelp_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.Getstarted_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.MicrosoftOfficeHub_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.MicrosoftSolitaireCollection_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.People_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.PowerAutomateDesktop_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.Todos_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.WindowsFeedbackHub_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.WindowsMaps_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.WindowsSoundRecorder_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.Xbox.TCUI_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.XboxGamingOverlay_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.XboxIdentityProvider_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.XboxSpeechToTextOverlay_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.ZuneMusic_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\*.ZuneVideo_*") DO (call :stepdelete "%%P")
FOR /D %%P IN ("%ProgramFiles%\WindowsApps\MicrosoftTeams_*") DO (call :stepdelete "%%P")
goto :steptwo
:stepdelete
echo "processing %1"
takeown /F %1 /R /D Y
icacls %1 /SETOWNER "administrators" /T /C /Q
icacls %1 /inheritance:r /grant:r Everyone:(F) /T /C /Q
attrib -R -S -H %1 /S /D
del /F /S /Q /A:RSHA %1\*.*
rmdir /S /Q %1
GOTO :eof
:steptwo
del /f /s /q %TempDirWIN%\*.*
for /d %%p in ("%TempDirWIN%\*.*") do rmdir "%p" /s /q
powershell.exe -command "Get-AppxPackage | Select Name, PackageFullName >"$env:TEMP\Apps_List.txt""

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
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f

echo Bluetooth And Devices Settings
rem Show Me Suggestions For Using My Android Phone With Windows
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Mobility" /v "OptedIn" /t REG_DWORD /d "0" /f
rem Use Autoplay For All Media And Devices
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t REG_DWORD /d "1" /f 

echo Update And Security Settings
rem Delivery Optimization
reg add "HKU\S-1-5-20\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f
rem SmartScreen PUA In Microsoft Edge
reg add "HKCU\Software\Microsoft\Edge\SmartScreenPuaEnabled" /ve /t REG_DWORD /d "0" /f
rem SmartScreen Filter In Microsoft Edge
reg add "HKCU\Software\Microsoft\Edge\SmartScreenEnabled" /ve /t REG_DWORD /d "0" /f

echo Privacy Settings
rem Let apps show me personalized ads by using my advertising ID
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\AdvertisingInfo" /v "Value" /t REG_DWORD /d "0" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /f
rem Let websites show me locally relevant content by accessing my language list
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
rem Let Windows improve Start and search results by tracking app launches
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
rem Suggested content
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\CreativeEvents" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Health" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Renderers" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-88000326Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SlideshowEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f
rem Online speech recognition
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
rem Inking and typing personalization
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\ImproveInkingAndTyping" /v "Value" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v "Value" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
rem Send optional dianostgic data
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f 
rem Tailored experiences
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
rem Feedback Frequency
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
rem Safe Search
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "SafeSearchMode" /t REG_DWORD /d "0" /f
rem Cloud content search (Microsoft account)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsMSACloudSearchEnabled" /t REG_DWORD /d "0" /f
rem Cloud content search (Work or School account)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsAADCloudSearchEnabled" /t REG_DWORD /d "0" /f
rem Search history on this device
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d "0" /f
rem Location services
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your location
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
rem Camera access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f
rem Let Apps access your camera
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f
rem Microphone access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your microphone
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access voice activation services
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationEnabled" /t REG_DWORD /d "0" /f
rem Let apps use voice activation when device is locked
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationOnLockScreenEnabled" /t REG_DWORD /d "0" /f
rem Notifications access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your notifications
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f
rem Account info access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your account info
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
rem Contacts access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your contacts
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
rem Calendar access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your calendar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
rem Phone calls access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps make phone calls
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
rem Call history access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your call history
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
rem Task access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your tasks
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
rem Email access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your email
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
rem Messaging access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps read or send messages
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
rem Radio control access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps control device radios
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
rem Communicate with unpaired devices
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f
rem App diagnostic access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access diagnostic info about your other apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
rem Documents library access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your documents library
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f
rem Downloads folders access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\downloadsFolder" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your downloads folder
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\downloadsFolder" /v "Value" /t REG_SZ /d "Deny" /f
rem Pictures library access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your pictures library
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Deny" /f
rem Videos library access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your videos library
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f
rem File system access
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f
rem Let apps access your file system
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f
rem Diagnostics Tracking Service
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f
rem Microsoft Diagnostics Center Standard Collector Services
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f
rem Windows Media Player statistics
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f
rem Update Apps Automatically
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "4" /f
rem System Debugger (Dr. Watson)
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

echo Edge Fine-Tuning
rem Preload of the new tab page for faster rendering
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "NewTabPagePrerenderEnabled" /t REG_DWORD /d "0" /f
rem Microsoft News content on the new tab page
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d "0" /f
rem The default top sites from the new tab page
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d "1" /f
rem Quick links on the new tab page
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "NewTabPageQuickLinksEnabled" /t REG_DWORD /d "0" /f
rem The type of background allowed for the layout of the new tab page
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "NewTabPageAllowedBackgroundTypes" /t REG_DWORD /d "3" /f
rem Show share button
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "ConfigureShare" /t REG_DWORD /d "1" /f
rem Show Collections button
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "EdgeCollectionsEnabled" /t REG_DWORD /d "0" /f
rem Show home button
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "ShowHomeButton" /t REG_DWORD /d "1" /f
rem Show feedback button
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /t REG_DWORD /d "0" /f
rem Show tab actions menu
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "VerticalTabsAllowed" /t REG_DWORD /d "0" /f
rem Tracking prevention
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "TrackingPrevention" /t REG_DWORD /d "0" /f
rem Resolution of navigation errors using a web service
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "ResolveNavigationErrorsUseWebService" /t REG_DWORD /d "0" /f
rem Search suggestions
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "SearchSuggestEnabled" /t REG_DWORD /d "0" /f
rem Suggest similar pages when a webpage cannot be found
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d "0" /f
rem Send required and optional diagnostic data about browser usage
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d "0" /f
rem Personalization of ads, Microsoft Edge, search, news and other Microsoft services by sending browsing history, favorites and collections, usage and other browsing data to Microsoft
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "0" /f
rem Recommendations and promotional notifications from Microsoft Edge
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "ShowRecommendationsEnabled" /t REG_DWORD /d "0" /f
rem Visual search 
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "VisualSearchEnabled" /t REG_DWORD /d "0" /f
rem Enable Microsoft Search in Bing suggestions in the address bar
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "AddressBarMicrosoftSearchInBingProviderEnabled" /t REG_DWORD /d "0" /f
rem Search on new tabs uses search box or address bar
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "NewTabPageSearchBox" /t REG_SZ /d "redirect" /f
rem Full-tab promotional content
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "PromotionalTabsEnabled" /t REG_DWORD /d "0" /f
rem Choose whether users can receive customized background images and text, suggestions, notifications, and tips for Microsoft services
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d "0" /f
rem Typosquatting сhecker
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "TyposquattingCheckerEnabled" /t REG_DWORD /d "0" /f
rem Ask where to save downloaded files
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "PromptForDownloadLocation" /t REG_DWORD /d "1" /f
rem Ads on Bing search results
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "BingAdsSuppression" /t REG_DWORD /d "1" /f

echo Windows Fine-Tuning
rem Show hidden files, folders and drives
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f
rem Show extensions for known file types
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f
rem Launch folder windows in a separate process
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d "1" /f
rem Show Sync Provider Notifications in Windows Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
rem Checkboxes for item selection
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AutoCheckSelect" /t REG_DWORD /d "1" /f
rem Task view
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f
rem Search icon on the taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
rem Chat icon on the taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d "0" /f
rem Widgets icon on the taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d "0" /f
rem Taskbar Alignment
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "0" /f
rem Transparency Effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f
rem Show recently opened items in Start, Jump Lists, and File Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
rem Look For An App In The Store option
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d "1" /f
rem This PC Desktop Icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
rem User's Files Desktop Icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
rem Control Panel Desktop Icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d "0" /f

rem Reboot
shutdown /r /f /t 0