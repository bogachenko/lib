// Config for Tor Browser by bogachenko

// Warning in "about:config"
// [NOTE] Page version
//		xul = chrome://global/content/config.xul
//		xhtml = chrome://global/content/config.xhtml
// Предупреждение в "about:config"
// [ЗАМЕТКА] Версия страницы
//		xul = chrome://global/content/config.xul
//		xhtml = chrome://global/content/config.xhtml
user_pref("browser.aboutConfig.showWarning", false);

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

// What elements of the story should be automatically deleted when you close Tor Browser
// Какие элементы истории должны быть автоматически удалены при закрытии браузера Tor
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown.sessions", true);
user_pref("privacy.clearOnShutdown.siteSettings", true);
user_pref("privacy.clearOnShutdown.openWindows", true);

// Master cleaner Firefox
// [NOTE] This dialog window is invoked by hotkeys - Ctrl + Shift + Del.
// Мастер очистки Firefox
// [ЗАМЕТКА] Это диалоговое окно вызывается горячими клавишами - Ctrl + Shift + Del.
user_pref("privacy.cpd.cache", true);
user_pref("privacy.cpd.cookies", false);
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
