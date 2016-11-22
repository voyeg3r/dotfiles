// user.js

// references:
// https://github.com/pyllyukko/user.js/


user_pref("network.prefetch-next", false);

// http://kb.mozillazine.org/Network.dns.disablePrefetch
// https://developer.mozilla.org/en-US/docs/Web/HTTP/Controlling_DNS_prefetching
user_pref("network.dns.disablePrefetch", false);
user_pref("network.dns.disablePrefetchFromHTTPS", false);

// http://kb.mozillazine.org/Browser.search.suggest.enabled
user_pref("browser.search.suggest.enabled", false);
// Disable "Show search suggestions in location bar results"
user_pref("browser.urlbar.suggest.searches", false);

// Always use private browsing (good for Lan Houses)
// https://support.mozilla.org/en-US/kb/Private-Browsing
// https://wiki.mozilla.org/PrivateBrowsing
user_pref("browser.privatebrowsing.autostart", false);
user_pref("extensions.ghostery.privateBrowsing", false);

// Clear history when Firefox closes
// https://support.mozilla.org/en-US/kb/Clear%20Recent%20History#w_how-do-i-make-firefox-clear-my-history-automatically
//user_pref("privacy.sanitize.sanitizeOnShutdown", true);
//user_pref("privacy.clearOnShutdown.cache", true);
//user_pref("privacy.clearOnShutdown.cookies", true);
//user_pref("privacy.clearOnShutdown.downloads", true);
//user_pref("privacy.clearOnShutdown.formdata", true);
//user_pref("privacy.clearOnShutdown.history", true);
//user_pref("privacy.clearOnShutdown.offlineApps", true);
//user_pref("privacy.clearOnShutdown.passwords", true);
//user_pref("privacy.clearOnShutdown.sessions", true);
//user_pref("privacy.clearOnShutdown.siteSettings", false);

// http://kb.mozillazine.org/Browser.cache.disk.enable
user_pref("browser.cache.disk.enable", false);
// http://kb.mozillazine.org/Browser.cache.memory.enable
user_pref("browser.cache.memory.enable", true);

// Zero (0) is an indication that no download history is retained for the current profile.
user_pref("browser.download.manager.retention",			0);

// Webpages will not be able to affect the right-click menu
//user_pref("dom.event.contextmenu.enabled",		false);

// always ask the user where to download
// https://developer.mozilla.org/en/Download_Manager_preferences
user_pref("browser.download.useDownloadDir",			false);
