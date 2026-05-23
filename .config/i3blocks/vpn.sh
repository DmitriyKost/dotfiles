#!/usr/bin/env bash

OPENCONNECT=$(pgrep -x openconnect)
TUN2SOCKS=$(pgrep -f 'tun2socks|gost|xray|sing-box')

OC_IFACES=$(ip -o link show | awk -F': ' '{print $2}' | grep -E '^(tun|vpn|oc|ppp)')
TUN_IFACES=$(ip -o link show | awk -F': ' '{print $2}' | grep -E '^(tun|tap|tun2socks|sing|xray)')

if [[ -n "$OPENCONNECT" ]]; then
    ICON=""
    COLOR="#6FA8DC"

elif [[ -n "$TUN2SOCKS" ]]; then
    ICON=""
    COLOR="#8FD39A"

elif [[ -n "$OC_IFACES" || -n "$TUN_IFACES" ]]; then
    ICON=""
    COLOR="#F0B85F"

else
    ICON=""
    COLOR="#FF5F6D"
fi

TEXT=$(printf "%8s" "$ICON VPN ")

echo "$TEXT"
echo ""
echo "$COLOR"
