## How To Use Windows UK ISO Keyboard Layout on macOS

Execute:

```
sudo rm /Library/Preferences/com.apple.keyboardtype.plist
rm ~/Library/Preferences/com.apple.keyboard.plist ## Sometimes you don't need to do this
```

Restart the mac

Plug in external keyboard (without external mouse\*)

Keyboard Setup Assistant should open automatically.

![image1](https://github.com/skeletony007/.dotfiles/blob/main/docs/images/macos-british-pc-layout-fix-1.png?raw=true)

Select continue.

![image1](https://github.com/skeletony007/.dotfiles/blob/main/docs/images/macos-british-pc-layout-fix-2-1.png?raw=true)

On the Identifying Your Keyboard Screen, press the `#` key three times on the external keyboard.

![image1](https://github.com/skeletony007/.dotfiles/blob/main/docs/images/macos-british-pc-layout-fix-2-2.png?raw=true)

You will see a 'The keys you pressed were not recognised' popup. Select OK

At Select the Keyboard Type, select ISO '(Europe, ...)'

![image1](https://github.com/skeletony007/.dotfiles/blob/main/docs/images/macos-british-pc-layout-fix-3.png?raw=true)

Make sure 'British PC' is selected in System Settings > Keyboard > Text Input > Input Sources.

![image1](https://github.com/skeletony007/.dotfiles/blob/main/docs/images/macos-british-pc-layout-fix-4.png?raw=true)

Re-connect any external mouse and Quit any new Keyboard Setup Assistant instance.

\* External mouse may 'combine' with keyboard on USB Hub.

**Sources**

- https://discussions.apple.com/thread/1012352
- https://apple.stackexchange.com/questions/278729/different-keyboard-mapping-on-external-keyboard

