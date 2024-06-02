@echo off
title Windows 10 Enterprise LTSC

echo GETTING SUPERUSER RIGHTS.
cd /d "%~dp0" && (
    if not "%1"=="am_admin" (
        echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 am_admin", "", "runas", 1 >> "%temp%\getadmin.vbs"
        "%temp%\getadmin.vbs"
        exit /b
    )
    del "%temp%\getadmin.vbs" >nul 2>&1
)

:: Windows 10 Enterprise LTSC build 19044.4412 x86_64
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>
:: License: MIT license
:: Last update: June 2024
:: Donate:
::          Bitcoin (BTC) - 3JfwK6ULJ1xY8xjpu6uzpBKLm4ghkdSBzG
::          Ethereum (ETH) - 0xb08eE5bC90C2fCAFE453b7d536f158215Cca979A
::          Tron (TRX) - THXmTuAbnMrUWFXPJn92YkWbEzjBDGAEXZ
::          Toncoin (TON) - UQDohNKO4GJj4VGDNwK2GYXtnvWbwgiECYB6V6aijfS2RY28
::          Dogecoin (DOGE) - DFuMmJb8DstHZQpqaCtQaeW5D6CVZHvqFa
::          Litecoin (LTC) - LfW2NSBZ3UwG7Sm9MWKLjEdVt45XVZ1je2
::          Binance Coin (BNB) uses the ETH address.
::          Tether (USDT) or USD Coin (USDC) uses ETH, TRX or TON addresses, depending on the type of chain chosen.

echo STOPPING THE WINDOWS EXPLORER PROCESS...
tasklist /fi "imagename eq explorer.exe" 2>nul | find /i "explorer.exe" && (
    taskkill /f /im explorer.exe
) || (
    echo The Windows Explorer process was not found.
)

echo CHECKING THE SETTINGS FOR THE LIST IN WINDOWS TASK SCHEDULER.
echo Windows Defender Tasks
echo Running a script to disable Windows Defender in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
    "Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
    "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
    "Microsoft\Windows\Windows Defender\Windows Defender Verification"
    "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Diagnostics and troubleshooting Tasks
echo Running a script to disable diagnostics in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
    "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner"
    "Microsoft\Windows\Diagnosis\Scheduled"
    "Microsoft\Windows\Shell\IndexerAutomaticMaintenance"
    "Microsoft\Windows\WDI\ResolutionHost"
    "Microsoft\Windows\Flighting\OneSettings\RefreshCache"
    "Microsoft\Windows\Maintenance\WinSAT"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Customer Experience Improvement Program Tasks
echo Running a script to disable Customer Experience Improvement in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\Autochk\Proxy"
    "Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
    "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
    "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
    "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
    "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
    "Microsoft\Windows\PI\Sqm-Tasks"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Microsoft Compatibility Telemetry Tasks
echo Running a script to disable telemetry in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
    "Microsoft\Windows\Application Experience\ProgramDataUpdater"
    "Microsoft\Windows\Application Experience\StartupAppTask"
    "Microsoft\Windows\UNP\RunUpdateNotificationMgr"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Disk Fingerprint Tasks
echo Running a script to disable the creation of digital fingerprints of the disk in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\DiskFootprint\Diagnostics"
    "Microsoft\Windows\DiskFootprint\StorageSense"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Family Safety Tasks
echo Running a script to disable Family Safety Mode in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\Shell\FamilySafetyMonitor"
    "Microsoft\Windows\Shell\FamilySafetyRefreshTask"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo File Usage Statistics Collection Task
echo Running a script to disable maintenance and management of backup using the File History feature in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\FileHistory\File History (maintenance mode)"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Network Information Collector Task
echo Running a script to disable network diagnostic tools and network information gathering in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\NetTrace\GatherNetworkInfo"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Xbox Tasks
echo Running a script to disable Xbox in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\XblGameSave\XblGameSaveTask"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo RetailDemo Offline Content Automatic Cleanup Task
echo Running a script to disable the automatic cleanup of content related to Retail Demo mode in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\RetailDemo\CleanupOfflineContent"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Send Error Reporting Task
echo Running a script to disable error reporting in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\Windows Error Reporting\QueueReporting"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Location Notification Tasks
echo Running a script to disable location notifications and the Windows action dialog in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\Location\Notifications"
    "Microsoft\Windows\Location\WindowsActionDialog"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Device Data Collection and Sending Tasks
echo Running a script to disable device information in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\Device Information\Device"
    "Microsoft\Windows\Device Information\Device User"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Microsoft Office Tasks
echo Running a script to disable the Office ClickToRun Service Monitor in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Office\Office ClickToRun Service Monitor"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Boot Optimization Task
echo Running a script to disable Sysmain tasks in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\Sysmain\ResPriStaticDbSync"
    "Microsoft\Windows\Sysmain\WsSwapAssessmentTask"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Mobile Network Metadata Analysis Task
echo Running a script to disable the Mobile Broadband Accounts task in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul
echo Data Usage Subscription Management Task
echo Running a script to disable the DUSM in the Task Scheduler.
timeout /t "3" /nobreak >nul
setlocal enabledelayedexpansion
for %%T in (
    "Microsoft\Windows\DUSM\dusmtask"
) do (
    schtasks /query /tn "%%~T" >nul 2>&1
    if !errorlevel! equ "0" (
        schtasks /query /tn "%%~T" /fo LIST /v | findstr /i "Disabled" >nul 2>&1
        if !errorlevel! equ "0" (
            echo Task %%~T is already disabled.
        ) else (
            echo Disabling task: %%~T
            schtasks /change /tn "%%~T" /disable
            if !errorlevel! equ "0" (
                echo Task %%~T successfully disabled.
            ) else (
                echo Failed to disable task %%~T.
            )
        )
    ) else (
        echo Task %%~T not found.
    )
)
endlocal
timeout /t "1" /nobreak >nul

echo CHECKING THE SETTINGS FOR THE LIST OF COMPONENTS IN WINDOWS OS.
echo Checking the status of Windows Media components
PowerShell -ExecutionPolicy Unrestricted -Command "(Get-WindowsOptionalFeature -Online -FeatureName 'MediaPlayback','WindowsMediaPlayer').State | Out-File -FilePath MediaComponentsState.txt -Encoding UTF8"
echo Checking the status of Internet Explorer 11 components
PowerShell -ExecutionPolicy Unrestricted -Command "(Get-WindowsCapability -Online -Name 'Browser.InternetExplorer*').State | Out-File -FilePath IEComponentsState.txt -Encoding UTF8"
echo Checking the status of the Steps Recorder components
PowerShell -ExecutionPolicy Unrestricted -Command "(Get-WindowsCapability -Online -Name 'App.StepsRecorder*').State | Out-File -FilePath StepsRecorderState.txt -Encoding UTF8"
echo Checking the status of Quick Assist components
PowerShell -ExecutionPolicy Unrestricted -Command "(Get-WindowsCapability -Online -Name 'App.Support.QuickAssist*').State | Out-File -FilePath QuickAssistState.txt -Encoding UTF8"
echo Checking the status of Hello Face components
PowerShell -ExecutionPolicy Unrestricted -Command "(Get-WindowsCapability -Online -Name 'Hello.Face*').State | Out-File -FilePath HelloFaceState.txt -Encoding UTF8"
echo Defining the components status file
set "MediaComponentsStateFile=MediaComponentsState.txt"
set "IEComponentsStateFile=IEComponentsState.txt"
set "StepsRecorderStateFile=StepsRecorderState.txt"
set "QuickAssistStateFile=QuickAssistState.txt"
set "HelloFaceStateFile=HelloFaceState.txt"
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
if %errorlevel% equ "0" (
    echo Windows Media Components disabled successfully.
) else (
    echo Failed to disable Windows Media Components.
)
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'Media.WindowsMediaPlayer*' | Remove-WindowsCapability -Online -NoRestart"
if %errorlevel% equ "0" (
    echo Windows Media Player capability removed successfully.
) else (
    echo Failed to remove Windows Media Player capability.
)
rem Internet Explorer 11 Components
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'Browser.InternetExplorer*' | Remove-WindowsCapability -Online -NoRestart"
if %errorlevel% equ "0" (
    echo Internet Explorer 11 Components removed successfully.
) else (
    echo Failed to remove Internet Explorer 11 Components.
)
rem Steps Recorder Components
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'App.StepsRecorder*' | Remove-WindowsCapability -Online -NoRestart"
if %errorlevel% equ "0" (
    echo Steps Recorder Components removed successfully.
) else (
    echo Failed to remove Steps Recorder Components.
)
rem Quick Assist Components
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'App.Support.QuickAssist*' | Remove-WindowsCapability -Online -NoRestart"
if %errorlevel% equ "0" (
    echo Quick Assist Components removed successfully.
) else (
    echo Failed to remove Quick Assist Components.
)
rem Hello Face Components
PowerShell -ExecutionPolicy Unrestricted -Command "Get-WindowsCapability -Online -Name 'Hello.Face*' | Remove-WindowsCapability -Online -NoRestart"
if %errorlevel% equ "0" (
    echo Hello Face Components removed successfully.
) else (
    echo Failed to remove Hello Face Components.
)
:EndScript
del "%MediaComponentsStateFile%"
del "%IEComponentsStateFile%"
del "%StepsRecorderStateFile%"
del "%QuickAssistStateFile%"
del "%HelloFaceStateFile%"

echo CHECKING THE SETTINGS FOR THE LIST OF SERVICES IN WINDOWS OS.
rem Data Usage Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\DusmSvc" /v "Start" /t REG_DWORD /d "4" /f
rem SSDP Discovery Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d "4" /f
rem Geolocation Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\lfsvc" /v "Start" /t REG_DWORD /d "4" /f
rem Downloaded Maps Manager Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f
rem Delivery Optimization Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f
rem System Performance Improvement Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f
rem Broadcast DVR User Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d "4" /f
rem Windows Biometric Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\WbioSrvc" /v "Start" /t REG_DWORD /d "4" /f
rem Windows Insider Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\wisvc" /v "Start" /t REG_DWORD /d "4" /f
rem Store Demonstration Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\RetailDemo" /v "Start" /t REG_DWORD /d "4" /f
rem Windows Search Service
for %%H in (HKCU HKLM) do reg add "%%H\System\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f
rem Windows Defender
for %%H in (HKCU HKLM) do (
    for %%S in (
        SecurityHealthService
        wscsvc
    ) do reg add "%%H\System\CurrentControlSet\Services\%%S" /v "Start" /t REG_DWORD /d "4" /f
)
rem Diagnostics Tracking Service
for %%H in (HKCU HKLM) do (
    for %%S in (
        DiagTrack
        diagsvc
        dmwappushservice
        diagnosticshub.standardcollector.service
    ) do reg add "%%H\System\CurrentControlSet\Services\%%S" /v "Start" /t REG_DWORD /d "4" /f
)
rem Xbox Services
for %%H in (HKCU HKLM) do (
    for %%S in (
        XblAuthManager
        XblGameSave
        XboxGipSvc
        XboxNetApiSvc
    ) do reg add "%%H\System\CurrentControlSet\Services\%%S" /v "Start" /t REG_DWORD /d "4" /f
)
rem Windows Error Logging Services
for %%H in (HKCU HKLM) do (
    for %%S in (
        WerSvc
        wercplsupport
    ) do reg add "%%H\System\CurrentControlSet\Services\%%S" /v "Start" /t REG_DWORD /d "4" /f
)
rem Smart Card
for %%H in (HKCU HKLM) do (
    for %%S in (
        SCardSvr
        CertPropSvc
    ) do reg add "%%H\System\CurrentControlSet\Services\%%S" /v "Start" /t REG_DWORD /d "4" /f
)

echo CHECKING THE SETTINGS FOR TIME AND LANGUAGE IN WINDOWS OS.
rem Improve Inking And Typing Recognition
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v "AllowLinguisticDataCollection" /t REG_DWORD /d "0" /f
rem Input Analysis
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Input\Settings" /v "HarvestContacts" /t REG_DWORD /d "0" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Input\Settings" /v "LMDataLoggerEnabled" /t REG_DWORD /d "0" /f
rem Show Text Suggestions When Typing On The Physical Keyboard
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Input\Settings" /v "EnableHwkbTextPrediction" /t REG_DWORD /d "0" /f
rem Multilingual Text Suggestions
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Input\Settings" /v "MultilingualEnabled" /t REG_DWORD /d "0" /f
rem Voice Typing
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Input\Settings" /v "VoiceTypingEnabled" /t REG_DWORD /d "0" /f
rem Collecting And Transmitting The Texts You Type
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
rem Spelling And Correction Of Misspelled Words
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\TabletTip\1.7" /v "DisablePrediction" /t REG_DWORD /d "1" /f
for %%H in (HKCU HKLM) do (
    for %%S in (
        "EnableAutocorrection"
        "EnableDoubleTapSpace"
        "EnablePredictionSpaceInsertion"
        "EnableSpellchecking"
        "EnableTextPrediction"
    ) do reg add "%%H\Software\Microsoft\TabletTip\1.7" /v %%~S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
        "TurnOffAutocorrectMisspelledWords"
        "TurnOffHighlightMisspelledWords"
        "TurnOffOfferTextPredictions"
    ) do reg add "%%H\Software\Policies\Microsoft\Control Panel\International" /v %%~S /t REG_DWORD /d "1" /f
)

echo CHECKING THE SETTINGS FOR GAMES IN WINDOWS OS.
rem Xbox
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f
for %%H in (HKCU HKLM) do (
    for %%S in (
        "GameDVR_FSEBehavior"
        "GameDVR_FSEBehaviorMode"
        "GameDVR_Enabled"
    ) do reg add "%%H\System\GameConfigStore" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "AllowAutoGameMode"
    "AutoGameModeEnabled"
    "ShowStartupPanel"
    "UseNexusForGameBarEnabled"
    ) do reg add "%%H\Software\Microsoft\GameBar" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "AppCaptureEnabled"
    "AudioCaptureEnabled"
    "CursorCaptureEnabled"
    "HistoricalCaptureEnabled"
    ) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "DownloadGameInfo"
    "GameUpdateOptions"
    "ListRecentlyPlayed"
    ) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v %%S /t REG_DWORD /d "0" /f
)

echo CHECKING THE SETTINGS FOR MEDIA AND BLUETOOTH IN WINDOWS OS.
rem Suggestions For Using My Android Phone With Windows
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Mobility" /v "OptedIn" /t REG_DWORD /d "0" /f
rem Autoplay for all media and devices
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t REG_DWORD /d "1" /f

echo CHECKING THE SETTINGS FOR UPDATES AND SECURITY IN WINDOWS OS.
rem Delivery Optimization
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DoDownLoadMode" /t REG_DWORD /d "0" /f
rem Enabling font providers
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableFontProviders" /t REG_DWORD /d "1" /f
rem Windows Defender
reg delete "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "SecurityHealth" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows Defender" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows\System" /v "ShellSmartScreenLevel" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoNTSecurity" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "PUADetection" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Family options" /v "UILockdown" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection" /v "UILockdown" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\MpEngine" /v "MpEnablePus" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v "DisableBlockAtFirstSeen" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
for %%S in (
    "DisableBehaviorMonitoring"
    "DisableIOAVProtection"
    "DisableOnAccessProtection"
    "DisableRealtimeMonitoring"
    "DisableRoutinelyTakingAction"
    "DisableScanOnRealtimeEnable"
) do reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v %%~S /t REG_DWORD /d "1" /f
for %%S in (
    "DisableScanningMappedNetworkDrivesForFullScan"
    "DisableScanningNetworkFiles"
    "DisableAntiSpyware"
    "DisableAntiVirus"
) do reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v %%~S /t REG_DWORD /d "1" /f
for %%S in (
    "DisallowExploitProtectionOverride"
    "UILockdown"
) do reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" /v %%~S /t REG_DWORD /d "1" /f
for %%S in (
    "SpynetReporting"
    "SubmitSamplesConsent"
) do reg add "HKLM\Software\Policies\Microsoft\Windows Defender\SpyNet" /v %%~S /t REG_DWORD /d "1" /f

echo CHECKING THE SETTINGS FOR PRIVACY IN WINDOWS OS.
rem Windows PowerShell Telemetry
setx POWERSHELL_TELEMETRY_OPTOUT 1
rem DOTNET cli Telemetry
setx DOTNET_CLI_TELEMETRY_OPTOUT 1
rem Windows Tips
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d "1" /f
rem Wi-Fi sense
for %%S in (
    "AllowWiFiHotSpotReporting"
    "AllowAutoConnectToWiFiSenseHotspots"
) do reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi" /v %%~S /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d "0" /f
rem Windows Sensors
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t REG_DWORD /d "1" /f
rem Windows Location
for %%H in (HKCU HKLM) do (
    for %%S in (
    "DisableLocationScripting"
    "DisableLocation"
    "DisableWindowsLocationProvider"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\LocationAndSensors" /v %%S /t REG_DWORD /d "1" /f
)
rem Windows Biometrics
reg add "HKLM\Software\Policies\Microsoft\Biometrics\Credential Provider" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Biometrics" /v "Enabled" /t REG_DWORD /d "0" /f
rem Let Apps Show Me Personalized Ads By Using My Advertising ID
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /t REG_SZ /d "null" /f
rem Let Websites Show Me Locally Relevant Content By Accessing My Language List
for %%H in (HKCU HKLM) do reg add "%%H\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
rem Let Windows Improve Start And Search Results By Tracking App Launches
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
rem Activity Feed
for %%S in (
    "PublishUserActivities"
    "EnableActivityFeed"
    "UploadUserActivities"
) do reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v %%~S /t REG_DWORD /d "0" /f
rem Suggested Content
for %%H in (HKCU HKLM) do (
    for %%S in (
    "SystemPaneSuggestionsEnabled"
    "SoftLandingEnabled"
    "SlideshowEnabled"
    "SilentInstalledAppsEnabled"
    "RotatingLockScreenOverlayEnabled"
    "RotatingLockScreenEnabled"
    "PreInstalledAppsEverEnabled"
    "PreInstalledAppsEnabled"
    "OemPreInstalledAppsEnabled"
    "ContentDeliveryAllowed"
    ) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v %%S /t REG_DWORD /d "0" /f
)
rem Online Speech Recognition
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\Privacy\AllowInputPersonalization" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d "0" /f
rem Inking And Typing Personalization
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f
rem Send Optional Dianostgic Data
for %%H in (HKCU HKLM) do (
    for %%S in (
    "AllowTelemetry"
    "MaxTelemetryAllowed"
    ) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "AllowTelemetry"
    "AllowDeviceNameInTelemetry"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\DataCollection" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "DoNotShowFeedbackNotification"
    "DisableDiagnosticDataViewer"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\DataCollection" /v %%S /t REG_DWORD /d "1" /f
)
rem Telemetry
::reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "DisableWerReporting" /t REG_DWORD /d "1" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d "2" /f
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Messenger\Client" /v "PreventRun" /t REG_DWORD /d "1" /f
set "regPath=HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience"
for %%i in (
    "Program-Compatibility-Assistant"
    "Program-Compatibility-Troubleshooter"
    "Program-Inventory"
    "Program-Telemetry"
    "Diagtrack-Listener"
    "SetupPlatformTel"
    "Steps-Recorder"
) do (
    reg add "%regPath%\%%~i" /v "Enabled" /t REG_DWORD /d "0" /f
)
set "regPath=HKLM\SOFTWARE\Microsoft\PolicyManager\default\System"
for %%i in (
    "AllowTelemetry"
    "AllowLocation"
    "AllowDesktopAnalyticsProcessing"
    "AllowDeviceNameInDiagnosticData"
    "AllowExperimentation"
    "AllowCommercialDataPipeline"
) do (
    reg add "%regPath%\%%~i" /v "value" /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "EnableExperimentation"
    "EnableConfigFlighting"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\PreviewBuilds" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "DownloadToolsEnabled"
    "ScenarioExecutionEnabled"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\WDI\{C295FBBA-FD47-46ac-8BEE-B1715EC634E5}" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "DownloadToolsEnabled"
    "ScenarioExecutionEnabled"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "HeartbeatTrackingIndex"
    "SpyNetReportingLocation"
    ) do reg add "%%H\Software\Microsoft\RemovalTools\MpGears" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "DontOfferThroughWUAU"
    "DontReportInfectionInformation"
    ) do reg add "%%H\Software\Policies\Microsoft\MRT" /v %%S /t REG_DWORD /d "1" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "DisableUAR"
    "DisableInventory"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\AppCompat" /v %%S /t REG_DWORD /d "1" /f
)
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\TelemetryController" /v "RunsBlocked" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v "DisableQueryRemoteServer" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t REG_DWORD /d "1" /f
rem Tailored Experiences
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
rem Feedback Frequency
reg delete "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /f
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
rem Windows Search
for %%H in (HKCU HKLM) do (
    for %%S in (
    "BackgroundAppGlobalToggle"
    "VoiceShortcut"
    "CortanaInAmbientMode"
    "HistoryViewEnabled"
    "DeviceHistoryEnabled"
    "CortanaConsent"
    "CanCortanaBeEnabled"
    "CortanaEnabled"
    "BingSearchEnabled"
    ) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Search" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "SafeSearchMode"
    "IsMSACloudSearchEnabled"
    "IsDeviceSearchHistoryEnabled"
    "IsAADCloudSearchEnabled"
    ) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "ConnectedSearchUseWeb"
    "AllowCortana"
    "AllowCortanaAboveLock"
    "ConnectedSearchUseWebOverMeteredConnections"
    "AlwaysUseAutoLangDetection"
    "AllowSearchToUseLocation"
    "AllowCloudSearch"
    "BingSearchEnabled"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\Windows Search" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "VoiceActivationOn"
    "VoiceActivationDefaultOn"
    "VoiceActivationEnableAboveLockscreen"
    ) do reg add "%%H\Software\Microsoft\Speech_OneCore\Preferences" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "ConnectedSearchPrivacy"
    "ConnectedSearchSafeSearch"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\Windows Search" /v %%S /t REG_DWORD /d "3" /f
)
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OOBE" /v "DisableVoice" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\Search\AllowCloudSearch" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
rem Location access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\System\AllowLocation" /v "value" /t REG_DWORD /d "0" /f
rem Voice activation access
for %%H in (HKCU HKLM) do (
    for %%S in (
    "AgentActivationEnabled"
    "AgentActivationOnLockScreenEnabled"
    ) do reg add "%%H\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v %%S /t REG_DWORD /d "0" /f
)
rem Background apps access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d "2" /f
rem Account info access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
rem Contacts access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
rem Calendar access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
rem Phone calls access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
rem Call history access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f
rem Task access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
rem Email access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
rem Messaging access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
rem Radio control access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
rem App diagnostic access
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
rem Microsoft Diagnostics Standard Collector
for %%H in (HKCU HKLM) do (
    for %%S in (
    "ShowedToastAtLevel"
    "ConnectivityNoNetworkTime"
    "DisableAutomaticTelemetryKeywordReporting"
    "Disabled"
    "TelemetryServiceDisabled"
    ) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v %%S /t REG_DWORD /d "1" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "DiagTrackAuthorization"
    "UploadPermissionReceived"
    ) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v %%S /t REG_DWORD /d "0" /f
)
set "regPath=HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack"
reg add "%regPath%\EventTranscriptKey" /v "EnableEventTranscript" /t REG_DWORD /d "0" /f
reg add "%regPath%\TraceManager" /v "MiniTraceSlotEnabled" /t REG_DWORD /d "0" /f
reg add "%regPath%\TestHooks" /v "DisableAsimovUpLoad" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\PerfTrack" /v "Disabled" /t REG_DWORD /d "1" /f
rem Logging
set "regPath=HKLM\System\CurrentControlSet\Control\WMI\Autologger"
for %%i in (
    "AutoLogger-Diagtrack-Listener"
    "DefenderApiLogger"
    "DefenderAuditLogger"
    "DiagLog"
    "Diagtrack-Listener"
    "SetupPlatformTel"
    "WiFiSession"
) do (
    reg add "%regPath%\%%~i" /v "Start" /t REG_DWORD /d "0" /f
)
rem System Debugger
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_SZ /d "0" /f
rem Windows Error Reports
for %%H in (HKCU HKLM) do (
    for %%S in (
    "Disabled"
    "LoggingDisabled"
    "DontSendAdditionalData"
    "DontShowUI"
    ) do reg add "%%H\Software\Microsoft\Windows\Windows Error Reporting" /v %%S /t REG_DWORD /d "1" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "AutoApproveOSDumps"
    "BypassDataThrottling"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v %%S /t REG_DWORD /d "0" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "Disabled"
    "DontSendAdditionalData"
    "LoggingDisabled"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v %%S /t REG_DWORD /d "1" /f
)
for %%H in (HKCU HKLM) do (
    for %%S in (
    "DefaultConsent"
    "NewUserDefaultConsent"
    "DefaultOverrideBehavior"
    ) do reg add "%%H\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v %%S /t REG_DWORD /d "1" /f
)
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "MachineID" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\WMR" /v "Disabled" /t REG_DWORD /d "1" /f
rem Windows Customer Experience Improvement Program
reg add "HKLM\Software\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
rem Windows Insider Program
reg add "HKLM\Software\Microsoft\WindowsSelfHost\UI\Visibility" /v "HideInsiderPage" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowBuildPreview" /v "value" /t REG_DWORD /d "0" /f
rem Developer Mode
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowDevelopmentWithoutDevLicense" /t REG_DWORD /d "1" /f
rem FindMyDevice
reg add "HKLM\Software\Policies\Microsoft\FindMyDevice" /v "AllowFindMyDevice" /t REG_DWORD /d "0" /f
rem Sync of Settings
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSync" /t REG_DWORD /d "2" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSyncUserOverride" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "EnableBackupForWin8Apps" /t REG_DWORD /d "0" /f

echo CHECKING OTHER SETTINGS IN WINDOWS OS.
rem Requiring a password when resuming from sleep or hibernation mode
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Windows\System\Power" /v "PromptPasswordOnResume" /t REG_DWORD /d "1" /f
rem Changing mouse pointers
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Windows\Personalization" /v "NoChangingMousePointers" /t REG_DWORD /d "1" /f

rem Windows Maps
for %%H in (HKCU HKLM) do (
    for %%S in (
    "AllowUntriggeredNetworkTrafficOnSettingsPage"
    "AutoDownloadAndUpdateMapData"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\Maps" /v %%S /t REG_DWORD /d "0" /f
)
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
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f
rem Taskbar Buttons Size
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "1" /f
rem Desktop Icons Size
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "IconSize" /t REG_DWORD /d "32" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "Mode" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "LogicalViewMode" /t REG_DWORD /d "3" /f
rem Sign-in Screen Background Image
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "DisableLogonBackgroundImage" /t REG_DWORD /d "1" /f
rem Blocking desktop wallpaper changes
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v "NoChangingWallPaper" /t REG_DWORD /d "1" /f
rem History Of Recently Opened Documents
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /t REG_DWORD /d "0" /f
rem List Of Frequently Used Programs
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuMFUprogramsList" /t REG_DWORD /d "0" /f
rem Sign-in Welcome Screen
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWelcomeScreen" /t REG_DWORD /d "0" /f
rem Recently Added Applications
for %%H in (HKCU HKLM) do reg add "%%H\Software\Policies\Microsoft\Windows\Explorer" /v "HideRecentlyAddedApps" /t REG_DWORD /d "1" /f
rem OneDrive Advertising
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "1" /f
rem Thumbnail Caching In Hidden Files
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d "1" /f
rem Colors Of Elements In Window Titles
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "0" /f
rem Active Help
reg delete "HKCU\Software\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}" /f
reg add "HKCU\Software\Classes\AppID\{8cec58ae-07a1-11d9-b15e-000d56bfe6ee}" /v "RunAs" /t REG_SZ /d "" /f
for %%H in (HKCU HKLM) do (
    for %%S in (
    "NoImplicitFeedback"
    "NoExplicitFeedback"
    "NoOnlineAssist"
    "NoActiveHelp"
    ) do reg add "%%H\Software\Policies\Microsoft\Assistance\Client\1.0" /v %%S /t REG_DWORD /d "1" /f
)
rem Publication Wizard
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t REG_DWORD /d "1" /f
rem Search Companion Files Update
reg add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v "DisableContentFileUpdates" /t REG_DWORD /d "1" /f
rem Background Image Quality
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "100" /f
rem Cleaning The Context Menu
reg delete "HKLM\Software\Classes\.zip\CompressedFolder\ShellNew" /f
for %%i in (.bmp .contact .rtf) do (
    reg delete "HKLM\Software\Classes\%%i\ShellNew" /f
)
set "regPath=HKLM\Software\Classes\SystemFileAssociations"
for %%i in (.3ds .3mf .bmp .dae .dxf .fbx .gif .glb .jfif .jpeg .jpe .jpg .obj .ply .png .stl .tiff .tif .wrl) do (
    reg add "%regPath%\%%i\Shell\3D Edit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
    reg add "%regPath%\%%i\Shell\3D Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
)
set "regPath=HKLM\Software\Classes\Drive\shell"
for %%i in (change-passphrase change-pin encrypt-bde encrypt-bde-elev manage-bde resume-bde resume-bde-elev unlock-bde) do (
    reg add "%regPath%\%%i" /v "LegacyDisable" /t REG_SZ /d "" /f
)
for %%i in (batfile cmdfile) do (
    reg add "HKLM\Software\Classes\%%i\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
)
rem Opening "My Computer" in Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f
rem People icon on taskbar
for %%H in (HKCU HKLM) do reg add "%%H\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "HidePeopleBar" /t REG_DWORD /d "1" /f
rem Unnecessary Items In Windows Settings
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "SettingsPageVisibility" /t REG_SZ /d "hide:gaming-broadcasting;gaming-gamebar;gaming-gamedvr;gaming-gamemode;gaming-trueplay;gaming-xboxnetworking;windowsdefender;mobile-devices;mobile-devices-addphone;mobile-devices-addphone-direct" /f
rem Windows Spotlight
for %%H in (HKCU HKLM) do (
    for %%S in (
    "DisableWindowsSpotlightWindowsWelcomeExperience"
    "DisableSpotlightCollectionOnDesktop"
    "DisableThirdPartySuggestions"
    "DisableTailoredExperiencesWithDiagnosticData"
    "DisableWindowsSpotlightOnSettings"
    "DisableWindowsSpotlightOnActionCenter"
    "DisableWindowsSpotlightFeatures"
    ) do reg add "%%H\Software\Policies\Microsoft\Windows\CloudContent" /v %%S /t REG_DWORD /d "1" /f
)
rem Microsoft Consumer Experiences
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
rem Lock the Taskbar
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "LockTaskbar" /t REG_DWORD /d "1" /f
rem Clearing the pagefile.sys page file when shutting down Windows
reg add "HKLM\SystemCurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "1" /f
rem Restoring the "Downloads" folder name.
timeout /t "2" /nobreak >nul
set "DownloadsFolder=%USERPROFILE%\Downloads"
if not exist "%DownloadsFolder%" mkdir "%DownloadsFolder%"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_SZ /d "C:\Users\%USERNAME%\Downloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Downloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Downloads" /f
attrib +r -s -h "%DownloadsFolder%" /s /d
timeout /t "1" /nobreak >nul

rem Sleep Settings
powercfg -x standby-timeout-dc "0"
powercfg -x standby-timeout-ac "0"

echo CHECKING THE SETTINGS FOR FIREWALL IN WINDOWS OS.
echo Running a script to disable the default Windows Firewall.
netsh advfirewall set allprofiles state off

echo CHECKING SETTINGS FOR ACTIVATION IN WINDOWS OS.
setlocal
echo Checking the activation status...
rem Query the registry for ProductId and RegisteredOwner
set regPath="HKLM\Software\Microsoft\Windows NT\CurrentVersion"
for %%V in ("ProductId" "RegisteredOwner") do (
    reg query %regPath% /v %%V >nul 2>&1
    if %errorlevel% neq "0" (
        echo Your copy of Windows is NOT activated.
        goto activate
    )
)
echo Your copy of Windows is activated.
goto end
:activate
echo Checking for Internet connection...
ping -n "1" "1.1.1.1" >nul
if errorlevel "1" (
    echo There is no internet connection.
    shutdown /r /f /t "0"
    exit /b
) else (
    echo There is an Internet connection.
)
echo Starting Windows activation process...
start /b "" cmd /c "slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul 2>&1" && (
    echo Activation was completed successfully.
) || (
    echo An error occurred during activation.
)
start /b "" cmd /c "slmgr /skms kms.digiboy.ir >nul 2>&1" && (
    echo A new KMS key has been installed.
) || (
    echo Error installing the KMS key.
)
start /b "" cmd /c "slmgr /ato >nul 2>&1" && (
    echo Windows activation was successful.
) || (
    echo An error occurred when activating Windows.
)
timeout /t "1" /nobreak >nul
:end
endlocal
timeout /t "3" /nobreak >nul

echo Reboot the system.
shutdown /r /f /t "0"