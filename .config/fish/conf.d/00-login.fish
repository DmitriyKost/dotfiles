if status is-login; and status is-interactive
    if test -z "$NO_SWAY"; and test -z "$WAYLAND_DISPLAY"; and test -z "$DISPLAY"; and test "$XDG_VTNR" = 1; and test -n "$XDG_RUNTIME_DIR"
        set -gx MOZ_ENABLE_WAYLAND 1
        set -gx WLR_NO_HARDWARE_CURSORS 1
        exec dbus-run-session sway --unsupported-gpu
    end
end
