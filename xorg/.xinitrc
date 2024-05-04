dbus-update-activation-environment DISPLAY XAUTHORITY &
gnome-keyring-daemon --start --components=secrets &
pipewire &
wireplumber &
exec i3
