# keeweb

[GitHub](https://github.com/keeweb/keeweb)

Use this to quickly view passwords in a web browser.

# Installing KeePassXC on macOS

[GitHub](https://github.com/keepassxreboot/keepassxc)

```bash
brew install keepassxc
```

Note that `keepassxc-cli` does not install with the dmg package.

See `firefox-setup.md` for instructions on web extensions.

# Installing KeePassDX Android

[GitHub](https://github.com/Kunzisoft/KeePassDX)
[F-Droid](https://f-droid.org/en/packages/com.kunzisoft.keepass.libre/)

F-Droid is the recommended way of installing.

## keepasssc-cli in Termux 

Go to Settings → Apps → All Apps → Termux → Permissions. Grant the permission to access the storage.

**Add the `keepassxc-cli` command**
```bash
pkg install keepassxc
```

# Usage

Run `keepassxc-cli` (example 🔑 Spotify on Android)

```bash
keepassxc-cli show -k "/storage/emulated/0/Syncthing/KeePass Database/passwords_key_file.keyx" -a Password -s "/storage/emulated/0/Syncthing/KeePass Database/passwords.kdbx" Spotify
```

