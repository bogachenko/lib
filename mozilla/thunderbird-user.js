// Config for Thunderbird by bogachenko

// Warning in "about:config"
// Предупреждение в "about:config"
user_pref("general.warnOnAboutConfig", false);

// Warning in "about:networking"
// Предупреждение в "about:networking"
user_pref("network.warnOnAboutNetworking", false);

// Check if Thunderbird is your default email client
// Проверять, является ли Thunderbird вашим почтовым клиентом по умолчанию
user_pref("mail.shell.checkDefaultClient", false);

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

// Automatic check for updates for extensions
// Автоматическая проверка обновлений для расширений
user_pref("extensions.update.enabled", false);

// Geolocation accounting
// Thunderbird has built-in tools for transferring geodata (your location). This uses information obtained from the operating systems geolocation facilities, Wi-Fi networks, telephone and Internet operators, as well as a real IP address. In addition, the above data is sent to Google servers.
// Учет геолокации
// Thunderbird располагает встроенными средствами передачи геоданных (вашего местонахождения). При этом используются сведения, получаемые от геолокационных средств операционной системы, сетей Wi-Fi, телефонных и интернет-операторов, а также реальный IP-адрес. Кроме того, вышеперечисленные данные отсылаются на серверы Google.
user_pref("geo.enabled", false);

// GeoIP-based search results
// Результаты поиска на основе GeoIP
user_pref("browser.search.region", "US");
user_pref("browser.search.geoip.url", "");
user_pref("browser.search.geoip.timeout", 0);

// Browser geolocation (GeoIP) when working with search servers
// Геопозиционирования браузера (GeoIP) при работе с поисковыми серверами
user_pref("browser.search.geoSpecificDefaults", false);
user_pref("browser.search.geoSpecificDefaults.url", "");

// Allow Internet content to appear in messages
// Разрешить в сообщениях показ содержимого из Интернета
user_pref("mailnews.message_display.disable_remote_image", false);

// Automatic update of search engines
// Автоматическое обновление поисковых систем
user_pref("browser.search.update", false);

// Sending telemetry data and website address, about where and how the plugin failed
// Отправка телеметрических данных и адреса сайта, о том, где и как произошел сбой плагина
user_pref("dom.ipc.plugins.reportCrashURL", false);
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);

// In "about:addons" remove the item "Get add-ons"
// [WARNING] Uses Google Analytics.
// В "about:addons" убрать пункт "Получить дополнения"
// [ВНИМАНИЕ] Использует Google Analytics.
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.webservice.discoverURL", "");

// Recommended themes and extensions
// Рекомендованные темы и расширения
user_pref("lightweightThemes.recommendedThemes", "");
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// Telemetry
// This feature sends data about usage, mail client performance, user interface features, memory and hardware configurations, as well as real IP to Mozilla servers. In addition, information may be collected about the sites visited.
// [WARNING] This is a serious source of leaks and user tracking, do not turn it on.
// Телеметрия
// Эта функция отправляет данные об использовании, производительности почтового клиента, функциях пользовательского интерфейса, конфигурации памяти и оборудования, а также реальных IP-адресах на серверы Mozilla. Кроме того, может собираться информация о посещаемых сайтах.
// [ВНИМАНИЕ] Это серьезный источник утечек и слежения за пользователем, не включайте его.
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.server_owner", "");
user_pref("toolkit.telemetry.infoURL", "");
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.debugSlowSql", false);

// SSL Error reporting
// Отчеты об ошибках SSL
user_pref("security.ssl.errorReporting.automatic", false);
user_pref("security.ssl.errorReporting.enabled", false);
user_pref("security.ssl.errorReporting.url", "");

// Web content in file processes
// Веб-контент в файловых процессах
user_pref("browser.tabs.remote.allowLinkedWebInFileUriProcess", false);

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

// Exposure of system colors to CSS or canvas
// [NOTE] Might affect CSS in themes and extensions.
// Экспозиция системных цветов CSS или canvas
// [ЗАМЕТКА] Может повлиять на CSS у тем и расширениях.
user_pref("ui.use_standins_for_native_colors", true);

// Force punycode for internationalized domain names
// Принудительное использование Юникода для интернационализированных доменных имен
user_pref("network.IDN_show_punycode", true);

// File handle API
// [NOTE] Responsible for accessing lower-level file operations.
// API для обработки файлов
// [ЗАМЕТКА] Отвечает за доступ к более низкоуровневым файловым операциям.
user_pref("dom.fileHandle.enabled", false);

// Device storage API
// [NOTE] Responsible for access to the file system, this API allows the mail client to read and/or write to the users files.
// API хранилища устройств
// [ЗАМЕТКА] Отвечает за доступ к файловой системе, данный API позволяет почтовому клиенту самостоятельно читать и/или писать в файлах пользователя.
user_pref("device.storage.enabled", false);

// Showing search results
//		TRUE = To wrap lines
//		FALSE = Do not wrap lines
// Показ результатов поиска
//		TRUE = Переносить строки
//		FALSE = Не переносить строки
user_pref("view_source.wrap_long_lines", true);

// CSS :visited selectors
// [ЗАМЕТКА] Disables the use of styles with the: visited selector to visited links, which prevents the user from finding out what URLs the user has in the mail client history.
// CSS :visited селекторы
// [ЗАМЕТКА] Отключает применение к посещенным ссылкам стилей с селектором :visited, что предотвращает возможность выяснить, какие URL есть у пользователя в истории почтового клиента.
user_pref("layout.css.visited_links_enabled", false);

// Closing Thunderbird when closing the last tab
// Закрытие Thunderbird при закрытии последней вкладки
user_pref("mail.tabs.closeWindowWithLastTab", false);

// Preloading documents or resources specified via <link rel = "preload">
// Предзагрузка документов или ресурсов, указанных через <link rel="preload">
user_pref("network.preload", false);

// Memory cache
// [WARNING] Enabling caching into RAM can lead to the tracking of the email client by "digital fingerprints" created using the E-Tag!
// Кэш памяти
// [ВНИМАНИЕ] Разрешение кэширования в оперативную память может привести к отслеживанию почтового клиента по "цифровым отпечаткам", создаваемым при помощи E-Tag!
user_pref("browser.cache.memory.enable", false);
user_pref("browser.cache.memory.capacity", 0);

// Reporting API
// [NOTE] Stores reports and endpoints in a reporting cache, which are then queued and sent via the HTTP header "Report-To" to endpoints.
// API отчетов
// [ЗАМЕТКА] Сохраняет отчеты и конечные точки в кэше отчетов, которые затем помещаются в очередь и отправляются через заголовок HTTP "Report-To" к конечным точкам.
user_pref("dom.reporting.enabled", false);
user_pref("dom.reporting.featurePolicy.enabled", false);
user_pref("dom.reporting.header.enabled", false);
user_pref("dom.reporting.testing.enabled", false);

// Limited window.opener protection
// Ограниченная защита window.opener
user_pref("dom.targetBlankNoOpener.enabled", true);

// Web compatibility reporter
// Отправка отчетов о совместимости с интернетом
user_pref("extensions.webcompat-reporter.enabled", false);

// Logging
// Ведение журнала
user_pref("devtools.debugger.logging", false);
user_pref("devtools.onboarding.telemetry.logged", false);
user_pref("dom.indexedDB.logging.details", false);
user_pref("dom.indexedDB.logging.enabled", false);
user_pref("dom.indexedDB.logging.profiler-marks", false);
user_pref("dom.performance.enable_user_timing_logging", false);
user_pref("extensions.logging.enabled", false);
user_pref("gfx.logging.painted-pixel-count.enabled", false);
user_pref("gfx.logging.peak-texture-usage.enabled", false);
user_pref("gfx.logging.texture-usage.enabled", false);

// Black lists
// Черные списки
user_pref("extensions.blocklist.enabled", false);
user_pref("extensions.blocklist.url", "");

// First Party Isolation
user_pref("privacy.firstparty.isolate", true);

// Mixed content
// Смешанный контент
user_pref("security.mixed_content.block_active_content", true);
user_pref("security.mixed_content.block_display_content", true);
user_pref("security.mixed_content.block_object_subrequest", true);
user_pref("security.mixed_content.upgrade_display_content", true);

// WebVR
user_pref("dom.vr.enabled", false);

// WebGL
user_pref("webgl.disabled", true);
user_pref("webgl.enable-webgl2", false);
user_pref("webgl.disable-wgl", true);
user_pref("webgl.disable-angle", true);
user_pref("webgl.disable-DOM-blit-uploads", true);
user_pref("webgl.min_capability_mode", true);
user_pref("webgl.disable-extensions", true);
user_pref("webgl.disable-fail-if-major-performance-caveat", true);

// Gamepad control
// Управление геймпадом
user_pref("dom.gamepad.enabled", false);

// Updating system add-ons
// Обновление системных дополнений
user_pref("extensions.systemAddon.update.enabled", false);

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
user_pref("browser.safebrowsing.downloads.remote.url", "");
user_pref("browser.safebrowsing.provider.google.advisoryURL", "");
user_pref("browser.safebrowsing.provider.google.gethashURL", "");
user_pref("browser.safebrowsing.provider.google.lists", "");
user_pref("browser.safebrowsing.provider.google.reportMalwareMistakeURL", "");
user_pref("browser.safebrowsing.provider.google.reportPhishMistakeURL", "");
user_pref("browser.safebrowsing.provider.google.reportURL", "");
user_pref("browser.safebrowsing.provider.google.updateURL", "");
user_pref("browser.safebrowsing.provider.google4.advisoryURL", "");
user_pref("browser.safebrowsing.provider.google4.dataSharingURL", "");
user_pref("browser.safebrowsing.provider.google4.gethashURL", "");
user_pref("browser.safebrowsing.provider.google4.lists", "");
user_pref("browser.safebrowsing.provider.google4.reportMalwareMistakeURL", "");
user_pref("browser.safebrowsing.provider.google4.reportPhishMistakeURL", "");
user_pref("browser.safebrowsing.provider.google4.reportURL", "");
user_pref("browser.safebrowsing.provider.google4.updateURL", "");
user_pref("browser.safebrowsing.provider.mozilla.gethashURL", "");
user_pref("browser.safebrowsing.provider.mozilla.lists", "");
user_pref("browser.safebrowsing.provider.mozilla.lists.base", "");
user_pref("browser.safebrowsing.provider.mozilla.lists.content", "");
user_pref("browser.safebrowsing.provider.mozilla.updateURL", "");
user_pref("browser.safebrowsing.reportPhishURL", "");

// WebRTC (Web Real-Time Communication)
// Peer-to-peer data transfer and WebRTC that lets you know your real IP. WebRTC provides voice communication, video chats, P2P file sharing between browser applications without the use of third-party add-ons.
// WebRTC (Веб Связь в Реальном Времени)
// Пиринговая передача данных и WebRTC, который позволяет узнать ваш реальный IP. WebRTC обеспечивает голосовое общение, видео чаты, обмен файлами по технологии P2P между браузерными приложениями без использования сторонних дополнений.
user_pref("media.peerconnection.dtmf.enabled", false);
user_pref("media.peerconnection.enabled", false);
user_pref("media.peerconnection.ice.tcp", false);
user_pref("media.peerconnection.identity.enabled", false);
user_pref("media.peerconnection.simulcast", false);
user_pref("media.peerconnection.video.vp9_enabled", false);
user_pref("media.peerconnection.turn.disable", true);
user_pref("media.peerconnection.use_document_iceservers", false);
user_pref("media.peerconnection.video.enabled", false);
user_pref("media.peerconnection.ice.default_address_only", true);
user_pref("media.peerconnection.ice.no_host", true);

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

// Master cleaner Thunderbird
// [NOTE] This dialog window is invoked by hotkeys - Ctrl + Shift + Del.
// Мастер очистки Thunderbird
// [ЗАМЕТКА] Это диалоговое окно вызывается горячими клавишами - Ctrl + Shift + Del.
user_pref("privacy.cpd.cache", true);
user_pref("privacy.cpd.cookies", true);
user_pref("privacy.cpd.history", true);

// Remember your browsing and download history
// Помните историю посещений и загрузок
user_pref("places.history.enabled", false);

// Remember the search history and form data
// Помнить историю поиска и данные формы
user_pref("browser.formfill.enable", false);

// Crash reports
// [NOTE] This function sends information about program crashes to the Mozilla server, including technical information (memory status, etc.), time, and visited web links.
// Отчеты о сбоях
// [ЗАМЕТКА] Эта функция отсылает на сервер Mozilla сведения о сбоях программы, включая техническую информацию (состояние памяти и т.п.), время и посещаемые веб-ссылки.
user_pref("breakpad.reportURL", "");

// Add-on installation delay
// Задержка при установке дополнений
user_pref("security.dialog_enable_delay", 0);

// Health report details
// This function collects advanced information about the health of the program and sends it to Mozilla servers, in particular: the number of crashes, information about slow loading. It includes data on equipment, operating system, version of this program, installed add-ons (number and type), intra-browser events, rendering, restoration of sessions, their duration, profile age, number of pages visited.
// Данные об отчета о здоровье
// Данная функция собирает расширенную информацию о работоспособности программы и отсылает ее на серверы Mozilla, в частности: количество падений, сведения о медленной загрузке. Она включает в себя данные об оборудовании, операционной системе, версии этой программы, установленных дополнениях (количество и тип), внутрибраузерных событиях, рендеринге, восстановлении сессий, их длительности, возрасте профиля, количестве посещенных страниц.
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// API for microphone and webcam interaction
// API для взаимодействия с микрофоном и веб-камерой
user_pref("media.navigator.enabled", false);
user_pref("media.navigator.video.enabled", false);

// Automatically play sound in non-active tabs
//		TRUE = Do not play
//		FALSE = Play
// Автоматическое воспроизведение звука в неактивных вкладках
//		TRUE = Не воспроизводить
//		FALSE = Воспроизводить
user_pref("media.block-autoplay-until-in-foreground", true);