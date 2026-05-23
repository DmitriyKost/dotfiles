#!/usr/bin/env bash

# Full path to gdbus
GDBUS_CMD="/usr/bin/gdbus"

# Bluetooth battery characteristics
LEFT_ATTR="/org/bluez/hci0/dev_F8_36_81_D2_B2_B8/service0010/char0011"
RIGHT_ATTR="/org/bluez/hci0/dev_F8_36_81_D2_B2_B8/service0015/char0016"

# Force a read to update BlueZ cache
force_read() {
    local ATTR="$1"
    "$GDBUS_CMD" call --system \
        --dest org.bluez \
        --object-path "$ATTR" \
        --method org.freedesktop.DBus.Properties.Get \
        org.bluez.GattCharacteristic1 Value >/dev/null 2>&1
}

# Convert hex byte array to decimal battery
get_battery() {
    local ATTR="$1"
    # extract only the first hex number
    local HEX=$("$GDBUS_CMD" call --system \
        --dest org.bluez \
        --object-path "$ATTR" \
        --method org.freedesktop.DBus.Properties.Get \
        org.bluez.GattCharacteristic1 Value 2>/dev/null | grep -o '0x[0-9a-fA-F]\+' | head -n1)
    
    if [ -n "$HEX" ]; then
        printf "%3d" "$((HEX))"   # convert hex to decimal
    else
        echo "  N"              # fixed-width placeholder
    fi
}

# Update cache first
force_read "$LEFT_ATTR"
force_read "$RIGHT_ATTR"

# Get battery levels
LEFT_BAT=$(get_battery "$LEFT_ATTR")
RIGHT_BAT=$(get_battery "$RIGHT_ATTR")

# Output for i3blocks
echo "L:$LEFT_BAT% R:$RIGHT_BAT%"

