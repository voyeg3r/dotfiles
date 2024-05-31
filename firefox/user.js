// Firefox Performance Settings
//
// ls -d ~/.mozilla/firefox/*.default
// put this file in your default folder
// or make a symlink:
//
//  ln -sfvn ~/.dotfiles/firefox/user.js $(ls -d ~/.mozilla/firefox/*.default)
//
user_pref("gfx.webrender.all", true); // Enable WebRender (if supported)
user_pref("gfx.webrender.enabled", true);
user_pref("gfx.webrender.force-disabled", false); // Use recommended performance settings
user_pref("layers.acceleration.force-enabled", true);
user_pref("layers.acceleration.force", true); // Enable hardware acceleration
user_pref("dom.ipc.processCount", 4); // Limit the number of content processes (adjust to your system's capabilities)
user_pref("dom.ipc.processPrelaunch.enabled", true); // Use the content process priority manager
user_pref("browser.cache.disk.capacity", 10000); // 10MB Tweak HTTP Cache for better performance (adjust according to your needs)
user_pref("browser.cache.memory.capacity", 2048); // 2MB

// Security Settings
user_pref("privacy.trackingprotection.enabled", true); // Enable Tracking Protection
// user_pref("privacy.firstparty.isolate", true); // Block third-party cookies
// user_pref("network.cookie.cookieBehavior", 1);
user_pref("javascript.enabled", false); // Disable JavaScript on untrusted websites
user_pref("dom.security.https_only_mode", true); // Use HTTPS-only mode
// user_pref("extensions.https_everywhere._observatory.proxy.bypass", true); // Strict HTTPS enforcement (requires HTTPS Everywhere extension)
user_pref("signon.autofillForms", true); // Increase the security of your saved logins (secure -> false)
user_pref("signon.rememberSignons", true);
// user_pref("webgl.disabled", true); // Disable WebGL (may affect performance but enhances security)
// user_pref("media.peerconnection.enabled", false); // Enhance your privacy by disabling WebRTC (may break some websites)
user_pref("browser.backspace_action", 1);
user_pref("browser.ctrlTab.previews", true);

user_pref("gfx.use_text_smoothing_setting", true); // smooth fonts
user_pref("browser.tabs.drawInTitlebar", true) // hide title bar
user_pref("browser.sessionstore.restore_pinned_tabs_on_demand", true) // tabs on demand
user_pref("browser.sessionhistory.max_entries", 10) // max history sessions
user_pref("browser.cache.disk.parent_directory", "/var/shm/firefox-cache") // firefox cache in memory
user_pref("geo.enabled", false) // prevent GPS
user_pref("network.IDN_show_punycode", true) // prevent phishing attacks
user_pref("privacy.firstparty.isolate", true) // restrict cookies
user_pref("browser.cache.use_new_backend", 1) // cache in RAM
user_pref("network.dnsCacheEntries", 500) // dns sites cache
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true) // custom css pages
