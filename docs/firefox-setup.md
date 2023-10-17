# moz://a Firefox

> https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data

> https://github.com/mozilla/policy-templates/blob/master/README.md#ManualAppUpdateOnly

`.dotfiles/.firefox.defaul.release/extension_backup/failsafe` exists for extensions that encrypt exports. Having a raw version of preferences is important to facilitate re-implementation in the event that the import feature is no longer compatible with my backup.

# Firefox profile 🦊
> See [https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data)

## Bookmarks 📚
- `places.sqlite` This file contains all your Firefox bookmarks and lists of all the files you've downloaded and websites you’ve visited.
- `favicons.sqlite` This file contains all of the favicons for your Firefox bookmarks.

## Site-specific preferences ☕️
- `permissions.sqlite` Stores many of your Firefox permissions. (🍪 Cookie Exceptions etc.)
- `content-prefs.sqlite` MAYBE I DON'T NEED THIS?

## Search engines 🔎
- `search.json.mozlz4` This file stores user-installed search engines.

## Cookies 🍪
- `cookies.sqlite` ❗️ *VERY* **PRIVATE**

## User preferences ⚙️
- `prefs.js` This file stores customized user preference settings, such as changes you make in Firefox Settings dialogs and in customizing toolbars (Customize Firefox controls, buttons and toolbars). The optional `user.js` file, if one exists, will override any modified preferences.

## Containers ⚰️
- `containers.json` This file stores the details of containers used by the Container Tabs feature.

## Extension keybinds
- `extension-settings.json`

