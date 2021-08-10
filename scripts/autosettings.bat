@echo off

:: Служба Функциональных возможностей для подключенных пользователей и телеметрия.
sc config "DiagTrack" start=disabled
sc stop DiagTrack
sc delete DiagTrack

:: Служба маршрутизации push-сообщений WAP.
sc config "dmwappushservice" start=disabled
sc stop dmwappushservice
sc delete dmwappushservice

:: Стандартная служба сборщика центра диагностики.
sc config "diagnosticshub.standardcollector.service" start=disabled
sc stop diagnosticshub.standardcollector.service
sc delete diagnosticshub.standardcollector.service

:: Служба сбора и публикации данных основных приложений для передачи этих данных в облако.
sc config "DcpSvc" start=disabled
sc stop DcpSvc
sc delete DcpSvc

:: Выполняет функции посредника для подключений, благодаря чему приложения Microsoft Store могут получать уведомления из Интернета.
sc config "NcbService" start=disabled
sc stop NcbService
sc delete NcbService

:: Эта служба синхронизирует данные сохранения игр для Xbox Live с поддержкой сохранения.
sc config "XblGameSave" start=disabled
sc stop XblGameSave
sc delete XblGameSave

:: Предоставляет службы аутентификации и авторизации для взаимодействия с Xbox Live.
sc config "XblAuthManager" start=disabled
sc stop XblAuthManager
sc delete XblAuthManager

:: Эта служба поддерживает API-интерфейс Windows.Networking.XboxLive.
sc config "XboxNetApiSvc" start=disabled
sc stop XboxNetApiSvc
sc delete XboxNetApiSvc

:: Служба платформы подключенных устройств.
sc config "CDPSvc" start=disabled
sc stop CDPSvc
sc delete CDPSvc

:: Служба Windows для доступа приложений к скачанным картам.
sc config "MapsBroker" start=disabled
sc stop MapsBroker
sc delete MapsBroker

:: Содержит объекты, используемые клиентами кошелька.
sc config "WalletService" start=disabled
sc stop WalletService
sc delete WalletService

:: Штатное средство записи действий в Windows.
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f

:: Программа улучшения качества программного обеспечения Windows.
Call :LGPO_FILE reg delete "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "StudyId" /f
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f

:: Диагностические данные.
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f

:: Дистанционного отслеживания приложений.
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f

:: Инвентаризация программ и файлов в системе.
Call :LGPO_FILE reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f