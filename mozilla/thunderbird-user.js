// Config for Thunderbird by bogachenko

// Warning in "about:config"
// Предупреждение в "about:config"
user_pref("general.warnOnAboutConfig", false);

// Warning in "about:networking"
// Предупреждение в "about:networking"
user_pref("network.warnOnAboutNetworking", false);

// Check if Thunderbird is your default browser
// Проверять, является ли Thunderbird вашим браузером по умолчанию
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

// Use the application language over the language of your operating system in the regional settings
// Использовать язык приложения поверх языка вашей операционной системы в региональных настройках
user_pref("intl.regional_prefs.use_os_locales", false);

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
// This feature sends data about usage, browser performance, user interface features, memory and hardware configurations, as well as real IP to Mozilla servers. In addition, information may be collected about the sites visited.
// [WARNING] This is a serious source of leaks and user tracking, do not turn it on.
// Телеметрия
// Эта функция отправляет на серверы Mozilla данные об использовании, производительности браузера, особенностях пользовательского интерфейса, памяти и конфигурации оборудования, а также реальный IP. Кроме того, может собираться информация о посещаемых сайтах.
// [ВНИМАНИЕ] Это серьезный источник утечек и слежения за пользователем, не включайте его.
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.server_owner", "");
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.debugSlowSql", false);