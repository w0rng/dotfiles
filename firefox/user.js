// Startup: open prevoius windows and tabs
user_pref("browser.startup.page", 3);

// Theme: default syncing light/dark with OS.
user_pref("extensions.activeThemeID", "default-theme@mozilla.org");

// Don't show Mozilla news on new tab pages.
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);

// Don't show sponsored links on Firefox start page.
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Number of rows of frequently visited pages to show on new tab page.
user_pref("browser.newtabpage.activity-stream.topSitesRows", 3);

// Open searches from search bar in a new tab.
user_pref("browser.search.openintab", true);

// Don’t close window when closing the last tab.
user_pref("browser.tabs.closeWindowWithLastTab", false);

// Don't recommend addons on webpages.
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// Enable spellcheck in both single and multiline textfields.
user_pref("layout.spellcheckDefault", 2);

// Don't load URLs from clipboard with mouse wheel click.
user_pref("middlemouse.contentLoadURL", false);

// Enable tracking query parameter stripping also in private mode. Ref: https://www.bleepingcomputer.com/news/security/new-firefox-privacy-feature-strips-urls-of-tracking-parameters/
user_pref("privacy.query_stripping.enabled.pbmode", true);

// Enable blocking of tracking parts of a website.
user_pref("privacy.trackingprotection.enabled", true);

// Needs to be set for Tree Style Tabs userChrome.css hack to hide native tab bar should work. https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules#for-userchromecss
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);