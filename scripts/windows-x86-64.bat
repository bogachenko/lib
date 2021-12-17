@echo off

:: Getting root
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Windows 11 build 22000.318 x86_64
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

echo Stop Windows Security Health Service
taskkill /f /im SecurityHealthService.exe > NUL 2>&1
taskkill /f /im SecurityHealthSystray.exe > NUL 2>&1

echo Stop And Uninstall OneDrive
taskkill /f /im OneDrive.exe > NUL 2>&1
taskkill /f /im OneDriveStandaloneUpdater.exe > NUL 2>&1
%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe /uninstall
rd "%USERPROFILE%\OneDrive" /Q /S > NUL 2>&1
rd "C:\OneDriveTemp" /Q /S > NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S > NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S > NUL 2>&1
powershell.exe -ex bypass -command "Get-ScheduledTask -TaskName *onedrive* | Disable-ScheduledTask
powershell.exe -command "rm C:\Windows\System32\Tasks\OneDrive*"
taskkill /f /im explorer.exe
start explorer.exe

echo Stop Microsoft Compatibility Telemetry
taskkill /f /im compattelrunner.exe > NUL 2>&1
schtasks /change /tn "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
schtasks /change /tn "Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
schtasks /change /tn "Microsoft\Windows\Application Experience\StartupAppTask" /disable

echo Stop Windows Defender
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Verification" /disable

echo Stop SmartScreen
taskkill /f /im smartscreen.exe > NUL 2>&1

echo Stop Windows Defender Exploit Guard
schtasks /change /tn "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /disable

echo Stop Windows Problem Reporting
schtasks /change /tn "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable

echo Stop Collecting SQM Data
schtasks /change /tn "Microsoft\Windows\Autochk\Proxy" /disable

echo Stop Windows Disk Diagnostics
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable

echo Stop Software Quality Improvement Program
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable

echo Stop Disk Footprint
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /disable
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\StorageSense" /disable

echo Stop Power Efficiency Diagnostics System
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable

echo Stop Family Safety
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" /disable

echo Stop System Performance Diagnostics
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable

echo Stop Backup Location
schtasks /change /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable

echo Stop Sqm Tasks
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /disable

echo Stop Network Information Collector
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable

echo Stop Microsoft Office Telemetry
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /disable
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /disable
schtasks /change /tn "\Microsoft\Office\Office ClickToRun Service Monitor" /disable

echo Stop Automatic Scanning And Troubleshooting
schtasks /change /tn "\Microsoft\Windows\Diagnosis\Scheduled" /disable
schtasks /change /tn "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /disable
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f

echo Stop Supporting Updating Search Indexes
schtasks /change /tn "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance" /disable

echo Stop Windows Diagnostic Infrastructure Resolution Host
schtasks /change /tn "\Microsoft\Windows\WDI\ResolutionHost" /disable

echo Stop Overwolf Auto-update
schtasks /change /tn "Overwolf Updater Task" /disable

echo Stop CCleaner Auto-update
schtasks /change /tn "CCleaner Update" /disable

echo Stop Diagnostics Tracking Service
sc config "DiagTrack" start=disabled
sc stop DiagTrack
sc delete DiagTrack
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f

echo Stop Diagnostic Execution Service
sc config "diagsvc" start=disabled
sc stop diagsvc
sc delete diagsvc

echo Stop WAP-push Service
sc config "dmwappushservice" start=disabled
sc stop dmwappushservice
sc delete dmwappushservice

echo Stop Diagnostics Hub Standard Collector Service
sc config "diagnosticshub.standardcollector.service" start=disabled
sc stop diagnosticshub.standardcollector.service
sc delete diagnosticshub.standardcollector.service

echo Stop Gaming Services
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
schtasks /change /tn "Microsoft\XblGameSave\XblGameSaveTask" /disable
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f

echo Stop Store Demonstration Service
sc config "RetailDemo" start=disabled
sc stop RetailDemo
sc delete RetailDemo

echo Stop Windows Search Service
sc config "WSearch" start=disabled
sc stop WSearch
sc delete WSearch

echo Stop Contact Data Service
sc config "PimIndexMaintenanceSvc" start=disabled
sc stop PimIndexMaintenanceSvc
sc delete PimIndexMaintenanceSvc

echo Stop Windows Error Reporting Service
sc config "WerSvc" start=disabled
sc stop WerSvc
sc delete WerSvc

echo Stop Data Usage Service
sc config "DusmSvc" start=disabled
sc stop DusmSvc
sc delete DusmSvc

echo Stop SSDP Discovery Service
sc config "SSDPSRV" start=disabled
sc stop SSDPSRV
sc delete SSDPSRV

echo Stop Geolocation Service
sc config "lfsvc" start=disabled
sc stop lfsvc
sc delete lfsvc

echo Remove Windows Office App
powershell.exe -command "Get-AppxPackage -allusers *officehub* | Remove-AppxPackage"

echo Remove Microsoft Solitaire Collection Game
powershell.exe -command "Get-AppxPackage -allusers *solitairecollection* | Remove-AppxPackage"

echo Remove People App
powershell.exe -command "Get-AppxPackage -allusers *people* | Remove-AppxPackage"

echo Remove Cortana App
powershell.exe -command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"

echo Remove Microsoft Teams App
powershell.exe -command "Get-AppxPackage -allusers *microsoftteams* | Remove-AppxPackage"

echo Remove Bing News App
powershell.exe -command "Get-AppxPackage -allusers *bingnews* | Remove-AppxPackage"

echo Remove Bing Weather App
powershell.exe -command "Get-AppxPackage -allusers *bingweather* | Remove-AppxPackage"

echo Remove Xbox Apps
powershell.exe -command "Get-AppxPackage -allusers *xboxgamingoverlay* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxidentityprovider* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxspeechtotextoverlay* | Remove-AppxPackage" 
powershell.exe -command "Get-AppxPackage -allusers *xbox.tcui* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *xboxapp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *gamingapp* | Remove-AppxPackage"
powershell.exe -command "Get-AppxPackage -allusers *gamingservices* | Remove-AppxPackage"

echo Remove YourPhone App
powershell.exe -command "Get-AppxPackage -allusers *yourphone* | Remove-AppxPackage"

echo Remove Power Automate App
powershell.exe -command "Get-AppxPackage -allusers *powerautomate* | Remove-AppxPackage"

echo Remove Windows Communications Apps
powershell.exe -command "Get-AppxPackage -allusers *windowscommunicationsapps* | Remove-AppxPackage"

echo Remove Get-Help App
powershell.exe -command "Get-AppxPackage -allusers *gethelp* | Remove-AppxPackage"

echo Remove Get Started App
powershell.exe -command "Get-AppxPackage -allusers *getstarted* | Remove-AppxPackage"

echo Remove Microsoft To Do App
powershell.exe -command "Get-AppxPackage -allusers *todos* | Remove-AppxPackage"

echo Remove Microsoft Feedback Hub App
powershell.exe -command "Get-AppxPackage -allusers *windowsfeedbackhub* | Remove-AppxPackage"

echo Remove Maps App
powershell.exe -command "Get-AppxPackage -allusers *windowsmaps* | Remove-AppxPackage"

echo Remove Groove Music App
powershell.exe -command "Get-AppxPackage -allusers *zunemusic* | Remove-AppxPackage"

echo Remove Microsoft Movies and TV App
powershell.exe -command "Get-AppxPackage -allusers *zunevideo* | Remove-AppxPackage"

echo Remove Camera App
powershell.exe -command "Get-AppxPackage -allusers *windowscamera* | Remove-AppxPackage"

echo Remove Sound Recorder App
powershell.exe -command "Get-AppxPackage -allusers *windowssoundrecorder* | Remove-AppxPackage"

rem The list of all Windows applications will be saved here: 'C:\Users\%USER%\AppData\Local\Temp'
powershell.exe -command "Get-AppxPackage | Select Name, PackageFullName >"$env:TEMP\Apps_List.txt""

echo Configuring Privacy And Security Options In Windows Settings
rem Let apps show me personalized ads by using my advertising ID
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\AdvertisingInfo" /v "Value" /t REG_DWORD /d "0" /f
rem Let websites show me locally relevant content by accessing my language list
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
rem Let Windows improve Start and search results by tracking app launches
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
rem Show me suggested content in the Settings app
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f
rem Online speech recognition
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
rem Inking and typing personalization
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\ImproveInkingAndTyping" /v "Value" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v "Value" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
rem Send optional dianostgic data
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d "0" /f
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

echo Rebooting the system
shutdown /r
