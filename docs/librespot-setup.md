[GitHub](https://github.com/librespot-org/librespot)

> Spotify Connect receiver

# Installing librespot on macOS

Install librespot

```bash
brew install librespot
```

# Installing librespot on Android Termux

> Using instructions from:
> https://www.reddit.com/r/termux/comments/q8ydao/is_running_a_spotify_connect_client_on_a_phone/

Install `librespot` using the [pulseaudio backend](https://github.com/librespot-org/librespot/wiki/Compiling#features)

```bash
pkg install rust pulseaudio
cargo install librespot --no-default-features --features "pulseaudio-backend"  # ℹ️ run this to update as well
```

`librespot` is in the directory `/data/data/com.termux/files/home/.cargo/bin/librespot`.

To execute just `librespot`, add the Cargo bin directory to `PATH`

```bash
echo export PATH="$HOME/.cargo/bin:$PATH" >> ~/.bashrc && source ~/.bashrc
```

# Usage

Start `librespot` with receiver\* configuration
```bash
librespot --disable-audio-cache --disable-credential-cache -n DEVICENAME -b 320 --format F32 --disable-gapless
```

\* login to `librespot` using the script `spotifydaemon.sh` in the folder `.dotfiles/.librespot`.

See examples of [usage options](https://github.com/librespot-org/librespot/wiki/Options).

