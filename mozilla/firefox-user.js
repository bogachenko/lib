// Config for Firefox by bogachenko

// Warning in "about:config"
// Предупреждение в "about:config"
user_pref("browser.aboutConfig.showWarning", false);

// Warning about closing multiple tabs
// Предупреждение о закрытии нескольких вкладок
user_pref("browser.tabs.warnOnClose", true);
user_pref("browser.tabs.warnOnCloseOtherTabs", true);

// Warning about opening a large number of tabs
// Предупреждение о открытии большого количества вкладок
user_pref("browser.tabs.warnOnOpen", true);

// Check if Firefox is your default browser
// Проверять, является ли Firefox вашим браузером по умолчанию
user_pref("browser.shell.checkDefaultBrowser", false);

// Opening pages "Welcome and what's new?"
// Открытие страниц "Добро пожаловать и что нового?"
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

// Homepage
// Домашняя страница
user_pref("browser.startup.homepage", "about:blank");

// New tab
//		TRUE = Top-sites
//		FALSE = Blank page
// Новая вкладкa
//		TRUE = Топ-сайтов
//		FALSE = Пустая страница
user_pref("browser.newtabpage.enabled", false);

// Preloading a new tab
// Предварительная загрузка новой вкладки
user_pref("browser.newtab.preload", false);

// Opening tabs and external applications in the background
//		TRUE = Open such tabs in the background
//		FALSE = Switch to openable tabs
// Открытие вкладок и внешних приложений в фоновом режиме
//		TRUE = Открывать такие вкладки в фоне
//		FALSE = Переключаться на открываемые вкладки
user_pref("browser.tabs.loadDivertedInBackground", true);

// Search suggestions
// The default search engine uses geolocation-related data (your real location, determined by IP address). This data is sent to the Mozilla and Google servers. In addition, Google collects and stores data about your search queries and preferences.
// Поисковые предложения
// Поисковый механизм по умолчанию использует данные, связанные с геолокацией (вашим реальным местонахождением, определяемым по IP-адресу). Эти данные отсылаются на серверы Mozilla и Google. Кроме того, Google собирает и хранит данные о ваших поисковых запросах и предпочтениях.
user_pref("browser.search.suggest.enabled", false);

// In "about:addons" remove the item "Get add-ons"
// [WARNING] Uses Google Analytics.
// В "about:addons" убрать пункт "Получить дополнения"
// [ВНИМАНИЕ] Использует Google Analytics.
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.webservice.discoverURL", "");

// Guessing the domain in the address bar
// Угадывание домена в адресной строке
user_pref("browser.fixup.alternate.enabled", false);
user_pref("browser.fixup.domainwhitelist.localhost", false);

// Number of steps "To previous page" and "To next page"
// [NOTE] Reduces memory consumption.
// [WARNING] If you change the value to "0", you can not use the "To previous page" button.
// Количество шагов "На предыдущую страницу" и "На следующую страницу"
// [ЗАМЕТКА] Уменьшает потребление памяти.
// [ВНИМАНИЕ] Если вы измените значение на "0", вы не сможете использовать кнопку "На предыдущую страницу".
user_pref("browser.sessionhistory.max_entries", 10);

// Preloading autocomplete URLs (when you enter in the address bar)
// Предварительная загрузка URL-адресов автозаполнения (при вводе в адресную строку)
user_pref("browser.urlbar.speculativeConnect.enabled", false);

// Suggestion types in the address bar
// Типы предложений в адресной строке
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.bookmark", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.delay", 0);

// Alternative search engines in the address bar
// Альтернативные поисковые системы в адресной строке
user_pref("browser.urlbar.oneOffSearches", false);

// Inline autocomplete
//		TRUE = Supplement the text typed in the address bar
//		FALSE = Show below
// Встроенное автозаполнение
//		TRUE = Дополнять текст, набранный в адресной строке
//		FALSE = Показывать ниже
// user_pref("browser.urlbar.autoFill", false);

// Remember the search history and form data
// Помнить историю поиска и данные формы
user_pref("browser.formfill.enable", false);

// Remember your browsing and download history
// Помните историю посещений и загрузок
user_pref("places.history.enabled", false);

// Automatic deletion of history when closing the browser
// Автоматическое удаление истории при закрытии браузера
user_pref("privacy.sanitize.sanitizeOnShutdown", true);

// What elements of the story should be automatically deleted when you close Firefox
// Какие элементы истории должны быть автоматически удалены при закрытии Firefox
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown.sessions", true);
user_pref("privacy.clearOnShutdown.siteSettings", true);

// Master cleaner Firefox
// [NOTE] This dialog window is invoked by hotkeys - Ctrl + Shift + Del.
// Мастер очистки Firefox
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

// Activity stream expansion
// Расширение Activity stream
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.library.activity-stream.enabled", false);
user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.sectionOrder", "");
user_pref("browser.newtabpage.activity-stream.asrouter.providers.cfr", "");
user_pref("browser.newtabpage.activity-stream.asrouter.providers.cfr-fxa", "");
user_pref("browser.newtabpage.activity-stream.asrouter.providers.message-groups", "");
user_pref("browser.newtabpage.activity-stream.asrouter.providers.onboarding", "");
user_pref("browser.newtabpage.activity-stream.asrouter.providers.snippets", "");
user_pref("browser.newtabpage.activity-stream.asrouter.providers.whats-new-panel", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.config", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.enabled", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.endpointSpocsClear", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.endpoints", "");
user_pref("browser.newtabpage.activity-stream.feeds.aboutpreferences", false);
user_pref("browser.newtabpage.activity-stream.feeds.asrouterfeed", false);
user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false);
user_pref("browser.newtabpage.activity-stream.feeds.favicon", false);
user_pref("browser.newtabpage.activity-stream.feeds.newtabinit", false);
user_pref("browser.newtabpage.activity-stream.feeds.places", false);
user_pref("browser.newtabpage.activity-stream.feeds.prefs", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories.options", false);
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines", "");
user_pref("browser.newtabpage.activity-stream.pocketCta", "");
user_pref("browser.newtabpage.activity-stream.telemetry.structuredIngestion.endpoint", "");
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);
user_pref("browser.newtabpage.activity-stream.prerender", false);
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts", false);
user_pref("browser.newtabpage.activity-stream.improvesearch.noDefaultSearchTile", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.telemetry.ping.endpoint", "");
user_pref("browser.newtabpage.activity-stream.asrouter.useRemoteL10n", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.personalization.modelKeys", "");
user_pref("browser.newtabpage.activity-stream.feeds.recommendationproviderswitcher", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);

// Защита от отслеживания
// Tracking protection
user_pref("privacy.trackingprotection.enabled", false);
user_pref("privacy.trackingprotection.pbmode.enabled", false);
user_pref("privacy.trackingprotection.fingerprinting.enabled", false);
user_pref("privacy.trackingprotection.cryptomining.enabled", false);
user_pref("privacy.socialtracking.block_cookies.enabled", false);
user_pref("privacy.trackingprotection.socialtracking.enabled", false);
user_pref("privacy.trackingprotection.introURL", "");
user_pref("privacy.trackingprotection.annotate_channels", false);

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
user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);

// API for microphone and webcam interaction
// API для взаимодействия с микрофоном и веб-камерой
user_pref("media.navigator.enabled", false);
user_pref("media.navigator.video.enabled", false);

// Status of permissions for camera, microphone, location, notifications
//		0 = Ask
//		1 = Enable
//		2 = Block
// Состояние разрешений для камеры, микрофона, местоположения, уведомлений 
//		0 = Всегда спрашивать
//		1 = Разрешить
//		2 = Блокировать
user_pref("permissions.default.camera", 2);
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.geo", 2);
user_pref("permissions.default.microphone", 2);

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
user_pref("security.certerrors.recordEventTelemetry", false);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.previousBuildID", "");
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.server_owner", "");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabledFirstSession", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.debugSlowSql", false);
user_pref("toolkit.telemetry.ecosystemtelemetry.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry.structuredIngestion", false);
user_pref("browser.newtabpage.activity-stream.feeds.sections", false);
user_pref("browser.newtabpage.activity-stream.feeds.systemtick", false);
user_pref("browser.newtabpage.activity-stream.filterAdult", false);

// Health report details
// This function collects advanced information about the health of the program and sends it to Mozilla servers, in particular: the number of crashes, information about slow loading. It includes data on equipment, operating system, version of this program, installed add-ons (number and type), intra-browser events, rendering, restoration of sessions, their duration, profile age, number of pages visited.
// Данные об отчета о здоровье
// Данная функция собирает расширенную информацию о работоспособности программы и отсылает ее на серверы Mozilla, в частности: количество падений, сведения о медленной загрузке. Она включает в себя данные об оборудовании, операционной системе, версии этой программы, установленных дополнениях (количество и тип), внутрибраузерных событиях, рендеринге, восстановлении сессий, их длительности, возрасте профиля, количестве посещенных страниц.
user_pref("datareporting.healthreport.infoURL", "");
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// Crash reports
// [NOTE] This function sends information about program crashes to the Mozilla server, including technical information (memory status, etc.), time, and visited web links.
// Отчеты о сбоях
// [ЗАМЕТКА] Эта функция отсылает на сервер Mozilla сведения о сбоях программы, включая техническую информацию (состояние памяти и т.п.), время и посещаемые веб-ссылки.
user_pref("breakpad.reportURL", "");
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.tabs.crashReporting.email", "");
user_pref("browser.tabs.crashReporting.emailMe", false);
user_pref("browser.tabs.crashReporting.includeURL", false);
user_pref("browser.tabs.crashReporting.sendReport", false);

// Promo for mobile phones
// Акция для мобильных телефонов
user_pref("identity.mobilepromo.android", "");
user_pref("identity.mobilepromo.ios", "");

// PingCentre telemetry
// Телеметрия ПингЦентра
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.ping-centre.staging.endpoint", "");
user_pref("browser.ping-centre.production.endpoint", "");

// Geolocation accounting
// Firefox has built-in tools for transferring geodata (your location). This uses information obtained from the operating systems geolocation facilities, Wi-Fi networks, telephone and Internet operators, as well as a real IP address. In addition, the above data is sent to Google servers.
// Учет геолокации
// Firefox располагает встроенными средствами передачи геоданных (вашего местонахождения). При этом используются сведения, получаемые от геолокационных средств операционной системы, сетей Wi-Fi, телефонных и интернет-операторов, а также реальный IP-адрес. Кроме того, вышеперечисленные данные отсылаются на серверы Google.
user_pref("geo.enabled", false);
user_pref("geo.provider.ms-windows-location", false);
user_pref("geo.provider.use_corelocation", false);
user_pref("geo.provider.use_gpsd", false);
user_pref("geo.provider.network.url", "");

// GeoIP-based search results
// Результаты поиска на основе GeoIP
user_pref("browser.search.region", "US");
user_pref("browser.search.geoip.url", "");
user_pref("browser.search.geoip.timeout", 0);

// Browser geolocation (GeoIP) when working with search servers
// Геопозиционирования браузера (GeoIP) при работе с поисковыми серверами
user_pref("browser.search.geoSpecificDefaults", false);
user_pref("browser.search.geoSpecificDefaults.url", "");

// Recommended themes and extensions
// Рекомендованные темы и расширения
user_pref("lightweightThemes.recommendedThemes", "");
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// Add-on installation delay
// Задержка при установке дополнений
user_pref("security.dialog_enable_delay", 0);

// Activate the plugin by clicking
// Активация плагина по клику
user_pref("plugins.click_to_play", true);

// Flash plugin
//		0 = Off
//		1 = Ask
//		2 = On
// Flash плагин
//		0 = Выключить
//		1 = Спросить
//		2 = Включить
user_pref("plugin.state.flash", 0);

// Scanning Plugin ID (PLID) in directories defined in the Windows registry
// Сканирование Plugin ID (PLID) в каталогах, определенных в реестре Windows
user_pref("plugin.scan.plid.all", false);

// OpenH264 codec (Gecko Media Plugins)
// Кодек OpenH264 (Gecko Медиа Плагины)
user_pref("media.gmp-provider.enabled", false);
user_pref("media.gmp-gmpopenh264.enabled", false);
user_pref("media.gmp-manager.cert.checkAttributes", false);
user_pref("media.gmp.trial-create.enabled", false);
user_pref("media.gmp-widevinecdm.enabled", false);
user_pref("media.gmp-widevinecdm.visible", false);
user_pref("media.gmp-gmpopenh264.visible", false);
user_pref("media.gmp-manager.url", false);

// Digital rights management (DRM)
// Управление цифровыми правами (DRM)
user_pref("media.eme.enabled", false);

// Preload a page that the browser considers to be a logical next page
// Предварительная загрузка страницы, которую браузер считает логической следующей страницей
user_pref("network.prefetch-next", false);

// Pre-query DNS for all links on the active page
// [NOTE] For HTTP and HTTPS-protected pages. This feature allows the browser in the background to determine DNS for various web content in order to speed up subsequent downloads (for links, graphics, CSS, JavaScript, etc.).
// Предварительный запрос DNS для всех ссылок на активной странице
// [ЗАМЕТКА] Для HTTP и HTTPS-защищенных страниц. Эта функция позволяет браузеру в фоновом режиме определять DNS для различного веб-контента с целью ускорения последующей загрузки (для ссылок, графики, CSS, JavaScript и т.п.).
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);

// Sending ping
// Sending data about clicking on a link to the addresses specified in the "a" tag ("ping" attribute). HTML5 allows you to use this attribute for an element called ping. This function sends data by the URI defined in the hyperlink (if the user clicks on it). This allows you to track activity, user preferences and collect statistics about them.
// Отправка пинга
// Отправка данных о нажатии на ссылку адресам, указанным в тэге "a" (атрибут "ping"). HTML5 позволяет использовать этот атрибут для элемента под названием ping. Эта функция отсылает данные по URI, определенному в гиперссылке (если на нее нажимает пользователь). Это позволяет отслеживать активность, предпочтения пользователей и собирать статистику о них.
user_pref("browser.send_pings", false);
user_pref("browser.send_pings.max_per_link", 0);
user_pref("browser.send_pings.require_same_host", true);

// Captive portal detection
// Обнаружение портала авторизации
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.connectivity-service.enabled", false);

// Synchronization of preferences
// Синхронизация предпочтений
user_pref("services.sync.engine.addresses", false);
user_pref("services.sync.engine.addresses.available", false);
user_pref("services.sync.engine.creditcards", false);
user_pref("services.sync.engine.creditcards.available", false);
user_pref("services.sync.engine.history", false);
user_pref("services.sync.engine.prefs", false);
user_pref("services.sync.engine.tabs", false);

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
user_pref("dom.push.enabled", false);
user_pref("dom.push.connection.enabled", false);
user_pref("dom.push.serverURL", "");

// Disk cache
// Кэш-диска
user_pref("browser.cache.disk.capacity", 0);
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.disk.smart_size.enabled", false);
user_pref("browser.cache.disk.smart_size.first_run", false);
user_pref("browser.cache.frecency_experiment", -1);
user_pref("browser.cache.disk_cache_ssl", false);

// Fastback cache
//		0 = Disable
//		-1 = Auto
// Кэш Fastback
//		0 = Отключить
//		-1 = Автоматически
user_pref("browser.sessionhistory.max_total_viewers", 0);

// Forbids saving permissions manager settings
// Запрет сохранения настроек диспетчера разрешений
user_pref("permissions.memory_only", true);

// Session Recovery Service for windows and tabs
// Служба восстановления сеанса для окон и вкладок
user_pref("browser.sessionstore.max_tabs_undo", 10);
user_pref("browser.sessionstore.max_windows_undo", 10);

// Offline cache
// Автономный кэш
user_pref("browser.cache.offline.enable", false);
user_pref("browser.cache.offline.insecure.enable", false);

// Request to use the offline cache
// Запрос на использование автономного кеша
user_pref("offline-apps.allow_by_default", false);

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

// Interval between saving sessions
// Интервал между сохранением сеансов
user_pref("browser.sessionstore.interval", 60000);

// Firefox recovery after OS restart
// Восстановление Firefox после перезагрузки OS
user_pref("toolkit.winRegisterApplicationRestart", false);

// Cookies
// A Cookie is a piece of data (a small text file) sent by the server and stored in the browser. When the user reloads the same page, the browser sends the cookie back to the server and notifies it of the previous activity. Cookies store information such as passwords, logins, session data, credit card data, email addresses, and record various user activity and other statistics.
// [WARNING] Cookies are actively used by many web resources in the process of monitoring and tracking user activity. Theft and analysis of cookies is a potentially dangerous and serious attack, leading to global leaks of user data and use.
//		0 = Accept cookies and site data
//		1 = Block third-party cookies
//		2 = Block all cookies
//		3 = Block cookies from sites not visited
// Куки
// Cookie - фрагмент данных (небольшой текстовый файл), отправляемый сервером и сохраняющийся в браузере. Когда пользователь вновь загружает ту же самую страницу, браузер отсылает cookie назад на сервер и уведомляет его о предыдущей активности. Cookie хранят такую информацию, как пароли, логины, сеансовые данные, данные кредитных карт, электронные почтовые адреса и записывают различную пользовательскую активность и прочую статистику.
// [ВНИМАНИЕ] Cookie активно используются многими веб-ресурсами в процессе контроля и слежки за пользовательской активностью. Похищение и анализ cookie является потенциально опасной и серьезной атакой, приводящей к глобальным утечкам пользовательских данных и их использованию.
//		0 = Принимать куки и данные сайтов
//		1 = Блокировать стороннии куки
//		2 = Блокировать все куки
//		3 = Блокировать куки с не посещенных сайтов
user_pref("network.cookie.cookieBehavior", 0);

// Third-party cookies are set for the session only
// Сторонние файлы куки устанавливаются только для сеанса
user_pref("network.cookie.thirdparty.sessionOnly", true);
user_pref("network.cookie.thirdparty.nonsecureSessionOnly", true);

// Сookie lifetime policy
//		0 = Save them before expiration
//		2 = Save them until close Firefox
// Политика жизни куки
//		0 = Сохранять их до истечения срока действия
//		2 = Сохранять их до закрытия Firefox
user_pref("network.cookie.lifetimePolicy", 2);

// Storage API
// [NOTE] Disables another way for sites to store their data on the users personal computer.
// API Хранилища
// [ЗАМЕТКА] Отключает еще один способ для сайтов хранить свои данные на персональном компьютере пользователя.
user_pref("dom.storageManager.enabled", false);

// Limit events that can trigger a pop-up
// Ограничения событий, которые могут вызвать всплывающее окно
user_pref("dom.popup_allowed_events", "click dblclick");

// Special services (accessibility support services)
// Специальные услуги (службы поддержки доступности)
user_pref("accessibility.force_disabled", 1);

// Additional analytics sent to the web server
// [NOTE] HTTP-data leaking from UserAgent to the server, especially when leaving the page.
// Дополнительная аналитика, отправленная на веб-сервер
// [ЗАМЕТКА] HTTP-данные утекающих от UserAgent на сервер, особенно при покидании страницы.
user_pref("beacon.enabled", false);

// Deleting temporary files opened by an external application
// Удаление временных файлов, открытые внешним приложением
user_pref("browser.helperApps.deleteTempFileOnExit", true);

// Web speech
// Веб-речь
user_pref("media.webspeech.synth.enabled", false);
user_pref("media.webspeech.recognition.enable", false);

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
user_pref("gecko.handlerService.schemes.webcal.0.name", "");
user_pref("gecko.handlerService.schemes.webcal.0.uriTemplate", "");
user_pref("gecko.handlerService.schemes.webcal.1.name", "");
user_pref("gecko.handlerService.schemes.webcal.1.uriTemplate", "");
user_pref("gecko.handlerService.schemes.webcal.2.name", "");
user_pref("gecko.handlerService.schemes.webcal.2.uriTemplate", "");
user_pref("gecko.handlerService.schemes.webcal.3.name", "");
user_pref("gecko.handlerService.schemes.webcal.3.uriTemplate", "");

// Sending telemetry data and website address, about where and how the plugin failed
// Отправка телеметрических данных и адреса сайта, о том, где и как произошел сбой плагина
user_pref("dom.ipc.plugins.reportCrashURL", false);
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);

// Autocomplete user name and password
// Aвтоматическое заполнение имени пользователя и пароля
user_pref("signon.autofillForms", false);
user_pref("signon.autofillForms.http", false);

// Show password notifications for hacked sites
// Показывать уведомления о паролях для взломанных сайтов
user_pref("signon.management.page.breach-alerts.enabled", false);

// Smooth scrolling
// [NOTE] Recommended for brake applications, hardware failures, and problems with the video card.
// Плавная прокрутка
// [ЗАМЕТКА] Рекомендовано при торможениях, аппаратных сбоях и проблемах с видеокартой.
user_pref("general.smoothScroll", false);

// Automatic update themes
// Автоматическое обновление тем
user_pref("lightweightThemes.update.enabled", false);

// Path to save files
//		0 = Desktop
//		1 = Downloads
//		2 = Last used folder
// [NOTE] On Android, when you select "Save to desktop", downloading will not work at all
// Путь для сохранения файлов
//		0 = Рабочий стол
//		1 = Загрузки
//		2 = Последняя используемая папка
// [ЗАМЕТКА] На Android при выборе "Сохранять на рабочий стол" загрузка вообще работать не будет
user_pref("browser.download.folderList", 1);

// Adding downloads to the list of recent system documents
// Добавление загрузок в список последних документов системы
user_pref("browser.download.manager.addToRecentDocs", false);

// Hiding MIME types
// Скрытие типов MIME
user_pref("browser.download.hide_plugins_without_extensions", false);

// Show the "Open with" dialog box in the download window
// Показ диалогового окна "Открыть при помощи" в окне загрузки
user_pref("browser.download.forbid_open_with", true);

// Predictor
// [NOTE] This function creates the simplest connections to the server. When the cursor is over a particular link, Firefox tries to anticipate the users actions on the page in order to increase the performance and speed of content processing on the page.
// Предсказатель
// [ЗАМЕТКА] Это функция создает простейшие соединения с сервером. Когда курсор находится над определенной ссылкой, Firefox пытается предугадать действия пользователя на странице с целью увеличения производительность и скорости обработки контента на странице.
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-hover-on-ssl", false);
user_pref("network.predictor.enable-prefetch", false);

// Displays all parts of the URL in the address bar
// Отображения всех части URL-адреса в строке адреса
user_pref("browser.urlbar.trimURLs", false);

// Display JavaScript in history URLs
// Отображение JavaScript в URLs истории
user_pref("browser.urlbar.filter.javascript", true);

// Maximum number of history results in the address bar
// Максимальное количество результатов истории в панеле адреса
user_pref("browser.urlbar.maxHistoricalSearchSuggestions", 0);

// WebExtension restrictions for specific Mozilla domains
// Ограничения WebExtension для определенных доменов Mozilla
user_pref("extensions.webextensions.restrictedDomains", "");

// Install add-ons without signatures and display a request to install add-ons in the browser
// Установка дополнений без подписей и вывод запроса на установку дополнений в браузер
// user_pref("xpinstall.whitelist.required", true);
user_pref("xpinstall.signatures.required", false);

// Fullscreen API
// [WARNING] Allows you to identify the browser by means of browser fingerprints.
// API Полного экрана
// [ВНИМАНИЕ] Позволяет идентифицировать браузер с помощью отпечатков пальцев браузера.
// user_pref("full-screen-api.enabled", false);
user_pref("full-screen-api.unprefix.enabled", false);
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);

// Animated gradient that runs through the tab after the page is fully loaded
// Анимированный градиент, который пробегает по вкладке после полной загрузки страницы
user_pref("toolkit.cosmeticAnimations.enabled", false);

// Spellchecking
//		0 = Do not check
//		1 = Check in multiline fields
//		2 = Check in all text fields
// Проверка орфографии
//		0 = Не проверять
//		1 = Проверка в многострочных полях
//		2 = Проверка во всех текстовых полях
user_pref("layout.spellcheckDefault", 2);

// Auto scroll
// Автоматическая прокрутка
user_pref("general.autoScroll", false);

// Reader view
// [NOTE] Load reduction.
// Просмотр для чтения
// [ЗАМЕТКА] Снижение нагрузки.
user_pref("reader.parse-on-load.enabled", false);

// Text reader function in Reader view
// Функция зачитывания текста в Reader view
user_pref("narrate.enabled", false);

// Displaying an empty window as early as possible with the subsequent filling
// Отображение пустого окна, как можно раньше с последующим заполнением
user_pref("browser.startup.blankWindow", false);

// WebGL debug info being available to websites
// Информация об отладке WebGL доступна для веб-сайтов
user_pref("webgl.enable-debug-renderer-info", false);

// Service Workers
// "Service workers" essentially act as proxy servers that sit between web apps, and the browser and network, are event driven, and can control the web page/site it is associated with, intercepting and modifying navigation and resource requests, and caching resources.
// [NOTE] This heavily loads the system resources and takes up most of the RAM.
// Service Workers
// "Service workers" по существу действуют как прокси-серверы, которые находятся между веб-приложениями, браузером и сетью, управляются событиями и могут управлять веб-страницей или сайтом, с которыми они связаны, перехватывать и изменять запросы навигации и ресурсов, а также кэшировать ресурсы.
// [ЗАМЕТКА] Это сильно нагружает ресурсы системы и занимает большую часть оперативной памяти.
user_pref("dom.serviceWorkers.enabled", false);

// Cookies for HTTP sites are set with the "secure" directive
// Файлы куки для сайтов HTTP устанавливаются с "защищенной" директивой
user_pref("network.cookie.leave-secure-alone", true);

// SameSite сookies
// Куки SameSite
user_pref("network.cookie.same-site.enabled", true);

// DOM (Document Object Model) Storage
// The DOM specifications of web applications define a mechanism that allows web pages to store their data on the client side in a special storage.
// [WARNING] This will break a lot of sites functionality and extensions. You are better off using an extension for more granular control.
// Хранилище DOM (Объектная Модель Документа)
// DOM-спецификации веб-приложений определяют механизм, разрешающий веб-страницам сохранять свои данные на клиентской стороне в специальном хранилище.
// [ВНИМАНИЕ] Отключение этого предпочтения сломает много функций и расширений сайтов. Вам лучше использовать расширение для более гранулированного контроля.
// user_pref("dom.storage.enabled", false);
user_pref("browser.engagement.recent_visited_origins.expiry", 0);
user_pref("dom.storage.testing", false);
user_pref("dom.storage_access.enabled", false);
user_pref("dom.storage_access.auto_grants", false);

// Detection of connection/disconnection of media devices in the system
// Обнаружение подключения/отключения медиа-устройств в системе
user_pref("media.ondevicechange.enabled", false);

// Saving zoom for sites
// [WARNING] Allows you to identify the browser by means of browser fingerprints.
// Сохранение масштаба для сайтов
// [ВНИМАНИЕ] Позволяет идентифицировать браузер с помощью отпечатков пальцев браузера.
user_pref("browser.zoom.siteSpecific", false);

// Sites with autocomplete="off" attribute
// [NOTE] This function allows you to save the entered passwords in the password manager, even if the site owner has set the autocomplete attribute to "off".
// Сайты с атрибутом автозаполнение "off"
// [ЗАМЕТКА] Данная функция позволяет сохранять введенные пароли в менеджере паролей, даже если владелец сайта установил атрибуту автозаполнение значение "off".
user_pref("signon.storeWhenAutocompleteOff", true);

// Formless login capture for Password Manager
// Захват формы для входа в систему
user_pref("signon.formlessCapture.enabled", false);

// SSL session tracking
// [NOTE] Disables sending Session Tickets (TLS) and Session Identifiers (SSL) - unique identifiers used to speed up the re-establishment of an encrypted connection, which can also be used to track a user.
// Отслеживание сеансов SSL
// [ЗАМЕТКА] Отключает посылку Session Tickets (TLS) и Session Identifiers (SSL) - уникальных идентификаторов, применяемых для ускорения повторной установки шифрованного соединения, которые могут быть также использованы и для отслеживания пользователя.
user_pref("security.ssl.disable_session_identifiers", true);

// SSL Error reporting
// Отчеты об ошибках SSL
user_pref("security.ssl.errorReporting.automatic", false);
user_pref("security.ssl.errorReporting.enabled", false);
user_pref("security.ssl.errorReporting.url", "");

// Sketches of visited pages
// Эскизы посещенных страниц
user_pref("browser.pagethumbnails.capturing_disabled", true);

// Web content in file processes
// Веб-контент в файловых процессах
user_pref("browser.tabs.remote.allowLinkedWebInFileUriProcess", false);

// User interface tour (UITour)
// Тур по интерфейсу пользователя
user_pref("browser.uitour.enabled", false);
user_pref("browser.uitour.url", "");

// Web channel whitelist
// Белый список веб-каналов
user_pref("webchannel.allowObject.urlWhitelist", "");

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
// [NOTE] Responsible for access to the file system, this API allows the browser to read and/or write to the users files.
// API хранилища устройств
// [ЗАМЕТКА] Отвечает за доступ к файловой системе, данный API позволяет браузеру самостоятельно читать и/или писать в файлах пользователя.
user_pref("device.storage.enabled", false);

// Bookmark save format
//		TRUE = Save to HTML
//		FALSE = Save to SQLITE
// Формат сохранения закладок
//		TRUE = Сохранение в HTML
//		FALSE = Сохранение в SQLITE
user_pref("browser.bookmarks.autoExportHTML", false);

// Showing search results
//		TRUE = Open search result in current page
//		FALSE = Open search result in new page
// Показ результатов поиска
//		TRUE = Открывать результат поиска в текущей странице
//		FALSE = Открывать результат поиска на новой странице
user_pref("browser.search.openintab", true);

// Automatic selection of the entire line in the address bar
// Автоматическое выделение всей строки в поле адресной строки
user_pref("browser.urlbar.clickSelectsAll", true);

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

// Closing Firefox when closing the last tab
// Закрытие Firefox при закрытии последней вкладки
user_pref("browser.tabs.closeWindowWithLastTab", false);

// Private browsing mode
// Режим приватного просмотра
user_pref("browser.privatebrowsing.autostart", true);

// The time of inactivity of the user through which the browser will begin to save the session
// Время отсутствия активности пользователя, через который браузер начнет сохранять сессию
user_pref("browser.sessionstore.idleDelay", 720000);

// Preloading documents or resources specified via <link rel = "preload">
// Предзагрузка документов или ресурсов, указанных через <link rel="preload">
user_pref("network.preload", false);

// Module LaterRun
// [NOTE] Displaying new users with various help information when "N" starts up the browser.
// Модуль LaterRun
// [ЗАМЕТКА] Показ новых пользователей различной справочной информация при "N" запуске браузера.
user_pref("browser.laterrun.enabled", false);

// Memory cache
// [WARNING] Allowing caching to RAM can lead to browser tracking using "digital fingerprints" created using the E-Tag!
// Кэш памяти
// [ВНИМАНИЕ] Разрешение кэширования в оперативную память может привести к отслеживанию браузера по "цифровым отпечаткам", создаваемым при помощи E-Tag!
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

// Adding sites from Alexa Top 500 to the address bar Autocomplete list
// Добавление сайтов из Alexa Top 500 в список автозаполнения адресной строки
user_pref("browser.urlbar.usepreloadedtopurls.enabled", false);

// Limited window.opener protection
// Ограниченная защита window.opener
user_pref("dom.targetBlankNoOpener.enabled", true);

// Pocket extension
// Proprietary application Pocket (formerly known as Read It Later) allows you to save links to texts in the cloud storage for further reading, storing data about user activity and synchronizing them between all devices subscribed to the service. This can de-anonymize users and reveal their preferences.
// [NOTE] Pocket is a third-party (now owned by Mozilla) cloud service, which operates on the principle of "Save for later use".
// Расширение Pocket
// Проприетарное приложение Pocket (ранее известное как Read It Later) позволяет сохранять ссылки на тексты в облачном хранилище для их дальнейшего прочтения, храня таким образом данные о пользовательской активности и синхронизируя их между всеми устройствами, подписанным на услуги сервиса. Это может деанонимизировать пользователей и раскрыть их предпочтения.
// [ЗАМЕТКА] Pocket является сторонним (теперь принадлежит Mozilla) облачным сервисом, который работает по принципу "Сохранить для последующего использования".
user_pref("extensions.pocket.enabled", false);

// Extension Screenshots
// Расширение Скриншоты
user_pref("extensions.screenshots.disabled", true);
user_pref("extensions.screenshots.upload-disabled", true);

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
user_pref("security.sandbox.logging.enabled", false);
user_pref("browser.ping-centre.log", false);

// Black lists
// Черные списки
user_pref("extensions.blocklist.enabled", false);
user_pref("extensions.blocklist.url", "");

// First Party Isolation
user_pref("privacy.firstparty.isolate", true);

// GIO
user_pref("network.gio.supported-protocols", "");

// Mixed content
// Смешанный контент
user_pref("security.mixed_content.block_active_content", true);
user_pref("security.mixed_content.block_display_content", true);
user_pref("security.mixed_content.block_object_subrequest", true);

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

// Shield
// Щит
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("app.normandy.first_run", false);

// Updating system add-ons
// Обновление системных дополнений
user_pref("extensions.systemAddon.update.enabled", false);
user_pref("extensions.systemAddon.update.url", "");

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

// Content blocking
// Блокировка контента
user_pref("browser.contentblocking.category", "custom");
user_pref("browser.contentblocking.cfr-milestone.enabled", false);
user_pref("browser.contentblocking.control-center.ui.showBlockedLabels", false);
user_pref("browser.contentblocking.cryptomining.preferences.ui.enabled", false);
user_pref("browser.contentblocking.database.enabled", false);
user_pref("browser.contentblocking.fingerprinting.preferences.ui.enabled", false);
user_pref("browser.contentblocking.report.lockwise.enabled", false);
user_pref("browser.contentblocking.report.monitor.enabled", false);
user_pref("browser.contentblocking.report.cookie.url", "");
user_pref("browser.contentblocking.report.cryptominer.url", "");
user_pref("browser.contentblocking.report.fingerprinter.url", "");
user_pref("browser.contentblocking.report.lockwise.how_it_works.url", "");
user_pref("browser.contentblocking.report.lockwise.url", "");
user_pref("browser.contentblocking.report.monitor.how_it_works.url", "");
user_pref("browser.contentblocking.report.monitor.sign_in_url", "");
user_pref("browser.contentblocking.report.monitor.url", "");
user_pref("browser.contentblocking.report.proxy_extension.url", "");
user_pref("browser.contentblocking.report.social.url", "");
user_pref("browser.contentblocking.report.tracker.url", "");
user_pref("browser.contentblocking.reportBreakage.url", "");

// Делегирование разрешений
// Permission delegation
user_pref("permissions.delegation.enabled", false);