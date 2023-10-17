## macOS

Dock
```bash
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock size-immutable -bool true
```

Finder
```bash
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ProhibitConnectTo -bool true
defaults write -g NSUseAnimatedFocusRing -bool false
```

General Animations
```bash
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSWindowResizeTime -float 0.01
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
```

Apply Changes
```bash
killall Dock
killall Finder
```

You will need to restart the device or log out for changes to take effect

