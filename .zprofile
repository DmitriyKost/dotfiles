# Start i3 automatically if not already running
if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    exec startx
fi
