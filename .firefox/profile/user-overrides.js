/*** [SECTION OVERRIDES]: USER OVERRIDES ***/
/** ARKENFOX PART
 * See <a href="https://github.com/arkenfox/user.js/wiki/3.1-Overrides"></a>.
 */

/* 0801: disable location bar using search
 * Don't leak URL typos to a search engine, give an error message instead
 * Examples: "secretplace,com", "secretplace/com", "secretplace com", "secret place.com"
 * [NOTE] This does not affect explicit user action such as using search buttons in the
 * dropdown, or using keyword search shortcuts you configure in options (e.g. "d" for DuckDuckGo)
 * [SETUP-CHROME] Override this if you trust and use a privacy respecting search engine ***/
user_pref("keyword.enabled", true);
/* 2022: disable all DRM content (EME: Encryption Media Extension)
 * Optionally hide the setting which also disables the DRM prompt
 * [SETUP-WEB] e.g. Netflix, Amazon Prime, Hulu, HBO, Disney+, Showtime, Starz, DirectTV
 * [SETTING] General>DRM Content>Play DRM-controlled content
 * [TEST] https://bitmovin.com/demos/drm
 * [1] https://www.eff.org/deeplinks/2017/10/drms-dead-canary-how-we-just-lost-web-what-we-learned-it-and-what-we-need-do-next ***/
user_pref("media.eme.enabled", true);
/* 5003: disable saving passwords
 * [NOTE] This does not clear any passwords already saved
 * [SETTING] Privacy & Security>Logins and Passwords>Ask to save logins and passwords for websites ***/
user_pref("signon.rememberSignons", false);
/* 5010: disable location bar suggestion types
 * [SETTING] Privacy & Security>Address Bar>When using the address bar, suggest ***/
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.bookmark", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.topsites", false); // [FF78+]
/* 5011: disable location bar dropdown
 * This value controls the total number of entries to appear in the location bar dropdown ***/
user_pref("browser.urlbar.maxRichResults", 0);
/* 5012: disable location bar autofill
 * [1] https://support.mozilla.org/kb/address-bar-autocomplete-firefox#w_url-autocomplete ***/
user_pref("browser.urlbar.autoFill", false);
/* 5014: disable Windows jumplist [WINDOWS] ***/
user_pref("browser.taskbar.lists.enabled", false);
user_pref("browser.taskbar.lists.frequent.enabled", false);
user_pref("browser.taskbar.lists.recent.enabled", false);
user_pref("browser.taskbar.lists.tasks.enabled", false);
/* 5018: limit events that can cause a pop-up ***/
user_pref("dom.popup_allowed_events", "click dblclick mousedown pointerdown");


/** OTHER PREFERENCES PART
 * Using some code from
 * <li><a href="https://github.com/yokoffing/Betterfox"></a></li>
 * <li><a href="https://gitlab.com/librewolf-community/settings/-/blob/master/librewolf.cfg"></a></li>
 */

/* set consistent behaviour for clicking links
 * [SETTING] Open in a new tab in the current window, non-destructive ***/
user_pref("browser.bookmarks.openInTabClosesMenu", false);
user_pref("browser.link.open_newwindow.override.external", 3);
user_pref("browser.tabs.loadBookmarksInTabs", true);
/* disable swipe gestures back, forward, etc.
 ***/
user_pref("widget.disable-swipe-tracker", true);
/* disable Reader mode
 * Firefox will not have to parse webpage for Reader when navigating ***/
user_pref("reader.parse-on-load.enabled", false);
/* full screen video player
 ***/
user_pref("full-screen-api.macos-native-full-screen", true);
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.warning.delay", -1);
user_pref("full-screen-api.warning.timeout", 0);
user_pref("media.videocontrols.picture-in-picture.enabled", false);
/* choose what theme Firefox follows by default
 * Dark (0), Light (1), System (2), or Browser (3) (default) ***/
user_pref("layout.css.prefers-color-scheme.content-override", 0);
/* enable Firefox to use userChome, userContent, etc.
 * allow userChrome/userContent ***/
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
/* disable ALT key toggling the menu bar
 ***/
user_pref("ui.key.menuAccessKey", 0);
