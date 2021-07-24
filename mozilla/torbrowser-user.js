// Mozilla User Preferences
// Author: Bogachenko Vyacheslav

// Warning in "about:config"
// Предупреждение в "about:config"
user_pref("browser.aboutConfig.showWarning", false);

// Opening the "Welcome" and "New Notes" tabs
// Открытие вкладок "Добро пожаловать" и "Новые заметки"
user_pref("browser.startup.homepage_override.mstone", "ignore");
user_pref("startup.homepage_welcome_url", "");
user_pref("startup.homepage_welcome_url.additional", "");
user_pref("startup.homepage_override_url", "");
user_pref("browser.messaging-system.whatsNewPanel.enabled", false);

// Start page
//		0 = Blank page
//		1 = Home page
//		2 = Last page visited
//		3 = Resume previous session
// Стартовая страница
//		0 = Пустая страница
//		1 = Домашняя страница
//		2 = Последняя посещенная страница
//		3 = Возобновить предыдущую сессию
user_pref("browser.startup.page", 0);

// Home page and new windows
// Домашняя страница и новые окна
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.startup.blankWindow", false);

// Новые вкладки
// New tabs
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtab.preload", false);

// Opening tabs and external applications in the background
//		TRUE = Open such tabs in the background
//		FALSE = Switch to openable tabs
// Открытие вкладок и внешних приложений в фоновом режиме
//		TRUE = Открывать такие вкладки в фоне
//		FALSE = Переключаться на открываемые вкладки
user_pref("browser.tabs.loadDivertedInBackground", true);

// Preloading autocomplete URLs (when you enter in the address bar)
// Предварительная загрузка URL-адресов автозаполнения (при вводе в адресную строку)
user_pref("browser.urlbar.speculativeConnect.enabled", false);

// Suggestion types in the address bar
// Типы предложений в адресной строке
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.bookmark", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.delay", 0);

// Automatic deletion of history when closing the browser
// Автоматическое удаление истории при закрытии браузера
user_pref("privacy.sanitize.sanitizeOnShutdown", true);

// Which data items should be automatically deleted when the browser is closed
// Какие элементы данных должны быть автоматически удалены при закрытии браузера
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown.sessions", true);
user_pref("privacy.clearOnShutdown.siteSettings", true);
user_pref("privacy.clearOnShutdown.openWindows", true);

// Browser cleanup wizard 
// [NOTE] This dialog window is invoked by hotkeys - Ctrl + Shift + Del.
// Мастер очистки браузера
// [ЗАМЕТКА] Это диалоговое окно вызывается горячими клавишами - Ctrl + Shift + Del.
user_pref("privacy.cpd.cache", true);
user_pref("privacy.cpd.cookies", true);
user_pref("privacy.cpd.downloads", true);
user_pref("privacy.cpd.formdata", true);
user_pref("privacy.cpd.history", true);
user_pref("privacy.cpd.offlineApps", true);
user_pref("privacy.cpd.passwords", false);
user_pref("privacy.cpd.sessions", true);
user_pref("privacy.cpd.siteSettings", true);
user_pref("privacy.cpd.openWindows", true);

// Time range to clear
//		0 = Everything
//		1 = Last hour
//		2 = Last two hours
//		3 = Last four hours
//		4 = Today
//		5 = Last five minutes
//		6 = Last twenty-four hours
// Диапазон времени для очистки
//		0 = Все
//		1 = Последний час
//		2 = Последние два часа
//		3 = Последние четыре часа
//		4 = Сегодня
//		5 = Последние пять минут
//		6 = Последние сутки
user_pref("privacy.sanitize.timeSpan", 0);

// Open bookmarks in a new tab
// Открытие закладок в новой вкладке
user_pref("browser.tabs.loadBookmarksInTabs", true);

// Opening bookmarks in background tabs
// Открытие закладок в фоновых вкладках
user_pref("browser.tabs.loadBookmarksInBackground", true);

// Maximum number of backup bookmarks
// Максимальное количество резервных закладок
user_pref("browser.bookmarks.max_backups", 3);

// "Backspace" button value
//		0 = Previous page
//		1 = Scroll page up
//		2 = Do nothing
// Значение кнопки "Backspace"
//		0 = Предыдущая страница
//		1 = Прокрутить страницу вверх
//		2 = Ничего не делать
user_pref("browser.backspace_action", 2);

// Telemetry
// This feature sends data about usage, browser performance, user interface features, memory and hardware configurations, as well as real IP to Mozilla servers. In addition, information may be collected about the sites visited.
// [WARNING] This is a serious source of leaks and user tracking, do not turn it on.
// Телеметрия
// Эта функция отправляет данные об использовании, производительности браузера, функциях пользовательского интерфейса, конфигурации памяти и оборудования, а также реальных IP-адресах на серверы Mozilla. Кроме того, может собираться информация о посещаемых сайтах.
// [ВНИМАНИЕ] Это серьезный источник утечек и слежения за пользователем, не включайте его.
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabledFirstSession", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);

// Promo for mobile phones
// Акция для мобильных телефонов
user_pref("identity.mobilepromo.android", "");
user_pref("identity.mobilepromo.ios", "");

// PingCentre telemetry
// Телеметрия ПингЦентра
user_pref("browser.ping-centre.telemetry", false);

// Recommended themes and extensions
// Рекомендованные темы и расширения
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("browser.discovery.containers.enabled", false);
user_pref("extensions.getAddons.showPane", false);

// Page preloading
// Предварительная загрузка страниц
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.http.speculative-parallel-limit", 0);

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

// Restore active session in case of browser crash
// Восстановления активной сессии в случае падения браузера
user_pref("browser.sessionstore.resume_from_crash", false);

// Interval between saving sessions
// Интервал между сохранением сеансов
user_pref("browser.sessionstore.interval", 30000);

// Restoring the browser after restarting the operating system
// Восстановление браузера после перезагрузки операционной системы
user_pref("toolkit.winRegisterApplicationRestart", false);

// Storage API
// [NOTE] Disables another way for sites to store their data on the users personal computer.
// API Хранилища
// [ЗАМЕТКА] Отключает еще один способ для сайтов хранить свои данные на персональном компьютере пользователя.
user_pref("dom.storageManager.enabled", false);

// Additional analytics sent to the web server
// [NOTE] HTTP-data leaking from UserAgent to the server, especially when leaving the page.
// Дополнительная аналитика, отправленная на веб-сервер
// [ЗАМЕТКА] HTTP-данные утекающих от UserAgent на сервер, особенно при покидании страницы.
user_pref("beacon.enabled", false);

// Collecting HTML video statistics
// Сбор HTML-видеостатистики
user_pref("media.video_stats.enabled", false);

// Types of content
// Типы содержимого
user_pref("gecko.handlerService.schemes.mailto.0.name", "");
user_pref("gecko.handlerService.schemes.mailto.0.uriTemplate", "");
user_pref("gecko.handlerService.schemes.mailto.1.name", "");
user_pref("gecko.handlerService.schemes.mailto.1.uriTemplate", "");
user_pref("gecko.handlerService.schemes.mailto.2.name", "");
user_pref("gecko.handlerService.schemes.mailto.2.uriTemplate", "");
user_pref("gecko.handlerService.schemes.mailto.3.name", "");
user_pref("gecko.handlerService.schemes.mailto.3.uriTemplate", "");

// Sending telemetry data and website address, about where and how the plugin failed
// Отправка телеметрических данных и адреса сайта, о том, где и как произошел сбой плагина
user_pref("dom.ipc.plugins.reportCrashURL", false);
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);

// Smooth scrolling
// [NOTE] Recommended for brake applications, hardware failures, and problems with the video card.
// Плавная прокрутка
// [ЗАМЕТКА] Рекомендовано при торможениях, аппаратных сбоях и проблемах с видеокартой.
user_pref("general.smoothScroll", false);

// Show the "Open with" dialog box in the download window
// Показ диалогового окна "Открыть при помощи" в окне загрузки
user_pref("browser.download.forbid_open_with", true);

// Install add-ons without signatures
// Установка дополнений без подписей
user_pref("xpinstall.signatures.required", false);

// Sketches of visited pages
// Эскизы посещенных страниц
user_pref("browser.pagethumbnails.capturing_disabled", true);

// User interface tour (UITour)
// Тур по интерфейсу пользователя
user_pref("browser.uitour.enabled", false);

// Web channel whitelist
// Белый список веб-каналов
user_pref("webchannel.allowObject.urlWhitelist", "");

// Maximum number of pop-ups
// Максимальное количество всплывающих окон
user_pref("dom.popup_maximum", 3);

// Setting default permissions (resource://app/defaults/permissions) in the Permission Manager
// Установка по умолчанию разрешений (resource://app/defaults/permissions) в Менеджере Разрешений
user_pref("permissions.manager.defaultsUrl", "");

// Force punycode for internationalized domain names
// Принудительное использование Юникода для интернационализированных доменных имен
user_pref("network.IDN_show_punycode", true);

// File handle API
// [NOTE] Responsible for accessing lower-level file operations.
// API для обработки файлов
// [ЗАМЕТКА] Отвечает за доступ к более низкоуровневым файловым операциям.
user_pref("dom.fileHandle.enabled", false);

// Showing search results
//		TRUE = Open search result in new page
//		FALSE = Open search result in current page
// Показ результатов поиска
//		TRUE = Открывать результат поиска на новой странице
//		FALSE = Открывать результат поиска в текущей странице
user_pref("browser.search.openintab", true);

// Showing search results
//		TRUE = To wrap lines
//		FALSE = Do not wrap lines
// Показ результатов поиска
//		TRUE = Переносить строки
//		FALSE = Не переносить строки
user_pref("view_source.wrap_long_lines", true);

// CSS :visited selectors
// [ЗАМЕТКА] Disables the use of styles with the: visited selector to visited links, which prevents the user from finding out what URLs the user has in the browser history.
// CSS :visited селекторы
// [ЗАМЕТКА] Отключает применение к посещенным ссылкам стилей с селектором :visited, что предотвращает возможность выяснить, какие URL есть у пользователя в истории браузера.
user_pref("layout.css.visited_links_enabled", false);

// Closing the browser when closing the last tab
// Закрытие браузера при закрытии последней вкладки
user_pref("browser.tabs.closeWindowWithLastTab", false);

// Module LaterRun
// [NOTE] Displaying new users with various help information when "N" starts up the browser.
// Модуль LaterRun
// [ЗАМЕТКА] Показ новых пользователей различной справочной информация при "N" запуске браузера.
user_pref("browser.laterrun.enabled", false);

// Extension Form Autofill
// Расширение Form Autofill
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.available", "off");
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.formautofill.heuristics.enabled", false);
user_pref("extensions.formautofill.section.enabled", false);

// Black lists
// Черные списки
user_pref("extensions.blocklist.enabled", false);

// Gamepad control
// Управление геймпадом
user_pref("dom.gamepad.enabled", false);

// Shield
// Щит
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.first_run", false);

// Safe browsing
// Безопасный просмотр
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.safebrowsing.allowOverride", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.blockedURIs.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.block_dangerous", false);
user_pref("browser.safebrowsing.downloads.remote.block_dangerous_host", false);
user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);
user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);

// Content blocking
// Блокировка контента
user_pref("browser.contentblocking.category", "custom");
user_pref("browser.contentblocking.cfr-milestone.enabled", false);
user_pref("browser.contentblocking.cryptomining.preferences.ui.enabled", false);
user_pref("browser.contentblocking.database.enabled", false);
user_pref("browser.contentblocking.fingerprinting.preferences.ui.enabled", false);
user_pref("browser.contentblocking.report.lockwise.enabled", false);
user_pref("browser.contentblocking.report.monitor.enabled", false);

// Display all parts of a URL in the address bar
// Отображение все частей URL-адреса в адресной строке
user_pref("browser.urlbar.trimURLs", false);

// Reader View
user_pref("reader.parse-on-load.enabled", false);


// Permission settings for sites
//		0 = Always ask
//		0 = Allow
//		0 = Block
// Настройки разрешения для сайтов
//		0 = Всегда спрашивать
//		0 = Разрешать
//		0 = Блокировать
user_pref("permissions.default.geo", 2);
user_pref("permissions.default.camera", 2);
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.microphone", 2);
