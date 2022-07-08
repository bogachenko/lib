// Firefox Fennec User Preferences
// Author: Bogachenko Vyacheslav

// Новые вкладки
// New tabs
user_pref("browser.newtabpage.enabled", false);

// Remember the search history and form data
// Помнить историю поиска и данные формы
user_pref("browser.formfill.enable", false);

// Maximum number of backup bookmarks
// Максимальное количество резервных закладок
user_pref("browser.bookmarks.max_backups", 3);

// Защита от отслеживания
// Tracking protection
user_pref("privacy.trackingprotection.enabled", false);
user_pref("privacy.trackingprotection.annotate_channels", false);
user_pref("privacy.trackingprotection.cryptomining.enabled", false);
user_pref("privacy.trackingprotection.fingerprinting.enabled", false);
user_pref("privacy.trackingprotection.pbmode.enabled", false);

// Automatic deletion of history when closing the browser
// Автоматическое удаление истории при закрытии браузера
user_pref("privacy.sanitize.sanitizeOnShutdown", true);

// Automatically play sound in non-active tabs
//		TRUE = Do not play
//		FALSE = Play
// Автоматическое воспроизведение звука в неактивных вкладках
//		TRUE = Не воспроизводить
//		FALSE = Воспроизводить
user_pref("media.block-autoplay-until-in-foreground", true);

// Telemetry
// This feature sends data about usage, browser performance, user interface features, memory and hardware configurations, as well as real IP to Mozilla servers. In addition, information may be collected about the sites visited.
// [WARNING] This is a serious source of leaks and user tracking, do not turn it on.
// Телеметрия
// Эта функция отправляет данные об использовании, производительности браузера, функциях пользовательского интерфейса, конфигурации памяти и оборудования, а также реальных IP-адресах на серверы Mozilla. Кроме того, может собираться информация о посещаемых сайтах.
// [ВНИМАНИЕ] Это серьезный источник утечек и слежения за пользователем, не включайте его.
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
// user_pref("toolkit.coverage.endpoint.base", "");
// user_pref("toolkit.coverage.opt-out", true);
// user_pref("toolkit.telemetry.coverage.opt-out", true);

// Health report details
// [NOTE] This function collects advanced information about the health of the program and sends it to Mozilla servers, in particular: the number of crashes, information about slow loading. It includes data on equipment, operating system, version of this program, installed add-ons (number and type), intra-browser events, rendering, restoration of sessions, their duration, profile age, number of pages visited.
// Данные об отчета о здоровье
// [ЗАМЕТКА] Данная функция собирает расширенную информацию о работоспособности программы и отсылает ее на серверы Mozilla, в частности: количество падений, сведения о медленной загрузке. Она включает в себя данные об оборудовании, операционной системе, версии этой программы, установленных дополнениях (количество и тип), внутрибраузерных событиях, рендеринге, восстановлении сессий, их длительности, возрасте профиля, количестве посещенных страниц.
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// Crash reports
// [NOTE] This function sends information about program crashes to the Mozilla server, including technical information (memory status, etc.), time, and visited web links.
// Отчеты о сбоях
// [ЗАМЕТКА] Эта функция отсылает на сервер Mozilla сведения о сбоях программы, включая техническую информацию (состояние памяти и т.п.), время и посещаемые веб-ссылки.
user_pref("breakpad.reportURL", "");

// PingCentre telemetry
// Телеметрия ПингЦентра
// user_pref("browser.ping-centre.telemetry", false);

// Recommended themes and extensions
// Рекомендованные темы и расширения
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// Page preloading
// Предварительная загрузка страниц
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.http.speculative-parallel-limit", 0);

// Captive portal detection
// Обнаружение портала авторизации
user_pref("captivedetect.canonicalURL", "");
user_pref("captivedetect.canonicalContent", "");
user_pref("network.connectivity-service.IPv4.url", "");
user_pref("network.connectivity-service.IPv6.url", "");
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.connectivity-service.enabled", false);

// Cache API (Cache storage)
// [NOTE] It is a repository on the users computer where scripts can store information. It is part of the "Service workers" specification, but can be used without them.
// API Кэша (Хранилище кэша)
// [ЗАМЕТКА] Это хранилище на компьютере пользователя, куда скрипты могут складывать информацию. Оно является частью спецификации "Service workers", но может быть использовано и без них.
user_pref("dom.caches.enabled", false);

// Web notifications
// [NOTE] Data is sent to the site(s) not currently open in the browser.
// Веб-уведомления
// [ЗАМЕТКА] Данные отсылаются на сайт(ы) не открытые в данный момент в браузере.
user_pref("dom.webnotifications.enabled", false);
user_pref("dom.webnotifications.serviceworker.enabled", false);
user_pref("dom.webnotifications.requireuserinteraction", false);
user_pref("dom.push.enabled", false);
user_pref("dom.push.connection.enabled", false);

// Disk cache
// Кэш-диска
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.disk_cache_ssl", false);
user_pref("browser.cache.disk.smart_size.enabled", false);
user_pref("browser.cache.disk.capacity", 0);

// Offline cache
// Автономный кэш
user_pref("browser.cache.offline.enable", false);

// Storing extra session data
//		0 = Everywhere
//		1 = Unencrypted sites
//		2 = Nowhere
// Сохранение дополнительных данных сеанса
//		0 = Везде
//		1 = Незашифрованные сайты
//		2 = Нигде
user_pref("browser.sessionstore.privacy_level", 2);

// Restore active session in case of browser crash
// Восстановления активной сессии в случае падения браузера
user_pref("browser.sessionstore.resume_from_crash", false);