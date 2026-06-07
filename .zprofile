if [[ -z $WAYLAND_DISPLAY && -z $DISPLAY && $XDG_VTNR == 1 && -n $XDG_RUNTIME_DIR ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export WLR_NO_HARDWARE_CURSORS=1
    exec dbus-run-session sway --unsupported-gpu
fi
