# Installing BlackHole macOS

```bash
brew install blackhole-2ch
```

Then restart core audio, for good measure

```bash
sudo launchctl kickstart -kp system/com.apple.coreaudiod
```

`BlackHole 2ch` (2-channel) sound output device should appear. This can be configured the same as any other sound output device.

See `camilladsp-setup.md` for example usage.

