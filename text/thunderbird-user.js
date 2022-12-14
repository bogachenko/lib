// Thunderbird User Preferences
// Author: Bogachenko Vyacheslav

// Warning in "about:config"
// Предупреждение в "about:config"
user_pref("general.warnOnAboutConfig", false);

// Opening pages "Welcome and what's new?"
// Открытие страниц "Добро пожаловать и что нового?"
user_pref("mailnews.start_page.override_url", "");
user_pref("app.releaseNotesURL", "");
user_pref("mailnews.auto_config.addons_url", "");
user_pref("mailnews.auto_config_url", "");

// Start page
//		true = Enable
//		false = Disable
// Стартовая страница
//		true = Включить
//		false = Отключить
user_pref("mailnews.start_page.enabled", false);

// Homepage
// Домашняя страница
user_pref("mailnews.start_page.url", "about:blank");

// Opening tabs and external applications in the background
//		TRUE = Open such tabs in the background
//		FALSE = Switch to openable tabs
// Открытие вкладок и внешних приложений в фоновом режиме
//		TRUE = Открывать такие вкладки в фоне
//		FALSE = Переключаться на открываемые вкладки
user_pref("browser.tabs.loadDivertedInBackground", true);

// Search suggestions
// [NOTE] The default search engine uses geolocation-related data (your real location, determined by IP address).
// Поисковые предложения
// [ЗАМЕТКА] Поисковый механизм по умолчанию использует данные, связанные с геолокацией (вашим реальным местонахождением, определяемым по IP-адресу).
user_pref("browser.search.suggest.enabled", false);

// Remember the search history and form data
// Помнить историю поиска и данные формы
user_pref("browser.formfill.enable", false);

// Automatic deletion of history when closing the browser
// Автоматическое удаление истории при закрытии браузера
user_pref("privacy.sanitize.sanitizeOnShutdown", true);

// Which data items should be automatically deleted when the browser is closed
// Какие элементы данных должны быть автоматически удалены при закрытии браузера
user_pref("privacy.clearOnShutdown.cache", true);

// Master cleaner Thunderbird
// [NOTE] This dialog window is invoked by hotkeys - Ctrl + Shift + Del.
// Мастер очистки Thunderbird
// [ЗАМЕТКА] Это диалоговое окно вызывается горячими клавишами - Ctrl + Shift + Del.
user_pref("privacy.cpd.cache", true);
user_pref("privacy.cpd.cookies", true);
user_pref("privacy.cpd.history", true);

// Time range to clear
//		0 = Everything
//		1 = Last hour
//		2 = Last two hours
//		3 = Last four hours
//		4 = Today
// Диапазон времени для очистки
//		0 = Все
//		1 = Последний час
//		2 = Последние два часа
//		3 = Последние четыре часа
//		4 = Сегодня
user_pref("privacy.sanitize.timeSpan", 0);

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
user_pref("privacy.trackingprotection.enabled", false);

// Automatically play sound in non-active tabs
//		TRUE = Do not play
//		FALSE = Play
// Автоматическое воспроизведение звука в неактивных вкладках
//		TRUE = Не воспроизводить
//		FALSE = Воспроизводить
user_pref("media.block-autoplay-until-in-foreground", true);

// Telemetry
// This feature sends data about usage, mail client performance, user interface features, memory and hardware configurations, as well as real IP to Mozilla servers. In addition, information may be collected about the sites visited.
// [WARNING] This is a serious source of leaks and user tracking, do not turn it on.
// Телеметрия
// Эта функция отправляет данные об использовании, производительности почтового клиента, функциях пользовательского интерфейса, конфигурации памяти и оборудования, а также реальных IP-адресах на серверы Mozilla. Кроме того, может собираться информация о посещаемых сайтах.
// [ВНИМАНИЕ] Это серьезный источник утечек и слежения за пользователем, не включайте его.
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);

// Health report details
// [NOTE] This function collects advanced information about the health of the program and sends it to Mozilla servers, in particular: the number of crashes, information about slow loading. It includes data on equipment, operating system, version of this program, installed add-ons (number and type), intra-browser events, rendering, restoration of sessions, their duration, profile age, number of pages visited.
// Данные об отчета о здоровье
// [NOTE] Данная функция собирает расширенную информацию о работоспособности программы и отсылает ее на серверы Mozilla, в частности: количество падений, сведения о медленной загрузке. Она включает в себя данные об оборудовании, операционной системе, версии этой программы, установленных дополнениях (количество и тип), внутрибраузерных событиях, рендеринге, восстановлении сессий, их длительности, возрасте профиля, количестве посещенных страниц.
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// Crash reports
// [NOTE] This function sends information about program crashes to the Mozilla server, including technical information (memory status, etc.), time, and visited web links.
// Отчеты о сбоях
// [ЗАМЕТКА] Эта функция отсылает на сервер Mozilla сведения о сбоях программы, включая техническую информацию (состояние памяти и т.п.), время и посещаемые веб-ссылки.
user_pref("breakpad.reportURL", "");

// Recommended themes and extensions
// Рекомендованные темы и расширения
user_pref("extensions.getAddons.showPane", false);
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

// Offline cache
// Автономный кэш
user_pref("browser.cache.offline.enable", false);

// Cookies
// [NOTE] A Cookie is a piece of data (a small text file) sent by the server and stored in the browser. When the user reloads the same page, the browser sends the cookie back to the server and notifies it of the previous activity. Cookies store information such as passwords, logins, session data, credit card data, email addresses, and record various user activity and other statistics.
// [WARNING] Cookies are actively used by many web resources in the process of monitoring and tracking user activity. Theft and analysis of cookies is a potentially dangerous and serious attack, leading to global leaks of user data and use.
//		0 = Accept cookies and site data
//		1 = Block third-party cookies
//		2 = Block all cookies
//		3 = Block cookies from sites not visited
// Куки
// [ЗАМЕТКА] Cookie - фрагмент данных (небольшой текстовый файл), отправляемый сервером и сохраняющийся в браузере. Когда пользователь вновь загружает ту же самую страницу, браузер отсылает cookie назад на сервер и уведомляет его о предыдущей активности. Cookie хранят такую информацию, как пароли, логины, сеансовые данные, данные кредитных карт, электронные почтовые адреса и записывают различную пользовательскую активность и прочую статистику.
// [ВНИМАНИЕ] Cookie активно используются многими веб-ресурсами в процессе контроля и слежки за пользовательской активностью. Похищение и анализ cookie является потенциально опасной и серьезной атакой, приводящей к глобальным утечкам пользовательских данных и их использованию.
//		0 = Принимать куки и данные сайтов
//		1 = Блокировать стороннии куки
//		2 = Блокировать все куки
//		3 = Блокировать куки с не посещенных сайтов
user_pref("network.cookie.cookieBehavior", 0);

// Сookie lifetime policy
//		0 = Keep them until they expire
//		2 = Keep them until you close the browser
// Политика жизни куки
//		0 = Сохранять их до истечения срока действия
//		2 = Сохранять их до закрытия браузера
user_pref("network.cookie.lifetimePolicy", 2);

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

// Sending telemetry data and website address, about where and how the plugin failed
// Отправка телеметрических данных и адреса сайта, о том, где и как произошел сбой плагина
user_pref("dom.ipc.plugins.reportCrashURL", false);
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);

// Autocomplete user name and password
// Aвтоматическое заполнение имени пользователя и пароля
user_pref("signon.autofillForms", false);
user_pref("signon.autofillForms.http", false);

// Smooth scrolling
// [NOTE] Recommended for brake applications, hardware failures, and problems with the video card.
// Плавная прокрутка
// [ЗАМЕТКА] Рекомендовано при торможениях, аппаратных сбоях и проблемах с видеокартой.
user_pref("general.smoothScroll", false);

// Path to save files
//		0 = Desktop
//		1 = Downloads
//		2 = Last used folder
// Путь для сохранения файлов
//		0 = Рабочий стол
//		1 = Загрузки
//		2 = Последняя используемая папка
user_pref("browser.download.folderList", 1);

// Adding downloads to the list of recent system documents
// Добавление загрузок в список последних документов системы
user_pref("browser.download.manager.addToRecentDocs", false);

// Show the "Open with" dialog box in the download window
// Показ диалогового окна "Открыть при помощи" в окне загрузки
user_pref("browser.download.forbid_open_with", true);

// Predictor
// [NOTE] This function creates the simplest connections to the server. When the cursor is over a certain link, the browser tries to predict the user's actions on the page in order to increase the performance and speed of content processing.
// Предсказатель
// [ЗАМЕТКА] Эта функция создает простейшие подключения к серверу. Когда курсор находится над определенной ссылкой, браузер пытается предсказать действия пользователя на странице, чтобы повысить производительность и скорость обработки контента.
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);

// WebExtension restrictions for specific Mozilla domains
// Ограничения WebExtension для определенных доменов Mozilla
user_pref("extensions.webextensions.restrictedDomains", "");

// Install add-ons without signatures
// Установка дополнений без подписей
user_pref("xpinstall.signatures.required", false);

// Service Workers
// [NOTE] "Service workers" essentially act as proxy servers that sit between web apps, and the browser and network, are event driven, and can control the web page/site it is associated with, intercepting and modifying navigation and resource requests, and caching resources. This heavily loads the system resources and takes up most of the RAM.
// Service Workers
// [ЗАМЕТКА] "Service workers" по существу действуют как прокси-серверы, которые находятся между веб-приложениями, браузером и сетью, управляются событиями и могут управлять веб-страницей или сайтом, с которыми они связаны, перехватывать и изменять запросы навигации и ресурсов, а также кэшировать ресурсы. Это сильно нагружает ресурсы системы и занимает большую часть оперативной памяти.
user_pref("dom.serviceWorkers.enabled", false);

// User interface tour (UITour)
// Тур по интерфейсу пользователя
user_pref("mail.instrumentation.postUrl", "");
user_pref("mail.instrumentation.askUser", false);
user_pref("mail.instrumentation.userOptedIn", false);

// Block pop-ups
// Блокировать всплывающие окна
user_pref("dom.disable_open_during_load", true);
user_pref("dom.block_multiple_popups", true);

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

// Device storage API
// [NOTE] Responsible for access to the file system, this API allows the browser to read and/or write to the users files.
// API хранилища устройств
// [ЗАМЕТКА] Отвечает за доступ к файловой системе, данный API позволяет браузеру самостоятельно читать и/или писать в файлах пользователя.
user_pref("device.storage.enabled", false);

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

// Closing the mail client when closing the last tab
// Закрытие почтового клиента при закрытии последней вкладки
user_pref("mail.tabs.closeWindowWithLastTab", false);

// Preloading documents or resources specified via <link rel = "preload">
// Предзагрузка документов или ресурсов, указанных через <link rel="preload">
user_pref("network.preload", false);

// Web compatibility reporter
// Отправка отчетов о совместимости с интернетом
user_pref("extensions.webcompat-reporter.enabled", false);

// Black lists
// Черные списки
user_pref("extensions.blocklist.enabled", false);

// Virtual reality
// Виртуальная реальность
user_pref("dom.vr.enabled", false);

// Gamepad control
// Управление геймпадом
user_pref("dom.gamepad.enabled", false);

// Shaking the screen
// Встряхивание экрана
user_pref("dom.vibrator.enabled", false);

// Battery status tracking
// Отслеживание состояния батареи
user_pref("dom.battery.enabled", false);

// Safe browsing
// Безопасный просмотр
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("mail.phishing.detection.enabled", false);
user_pref("browser.safebrowsing.allowOverride", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.blockedURIs.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.block_dangerous", false);
user_pref("browser.safebrowsing.downloads.remote.block_dangerous_host", false);
user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);
user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);

// Исследования
// Studies
user_pref("app.shield.optoutstudies.enabled", false);

// Predicting the domains of the url in the address bar
// Предугадывание доменов URL-адреса в адресной строке
user_pref("browser.fixup.alternate.enabled", false);

// Reader View
user_pref("reader.parse-on-load.enabled", false);

// Geolocation
// Геолокация
user_pref("geo.enabled", false);

// Search region
// Регион поиска
user_pref("browser.search.region", "US");
user_pref("geo.provider.network.url", "");
user_pref("geo.provider.ms-windows-location", false);
user_pref("geo.provider.use_gpsd", false);
user_pref("browser.region.network.url", "");
user_pref("browser.region.update.enabled", false);
user_pref("browser.search.geoip.url", "");
user_pref("browser.search.geoip.timeout", 0);
user_pref("browser.search.geoSpecificDefaults", false);
user_pref("browser.search.geoSpecificDefaults.url", "");

// Allow Internet content to appear in messages
// Разрешить в сообщениях показ содержимого из Интернета
user_pref("mailnews.message_display.disable_remote_image", false);

// Chat styles
//      mail/bubbles/dark/papersheets/simple = Themes
// Стили чата
//      mail/bubbles/dark/papersheets/simple = Темы
user_pref("messenger.options.messagesStyle.theme", "simple");

// Notification of a new message on the taskbar
// Уведомление о новом сообщение на панели задач
user_pref("messenger.options.getAttentionOnNewMessages", true); 