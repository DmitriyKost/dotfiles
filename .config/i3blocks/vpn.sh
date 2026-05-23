#!/usr/bin/env bash

OPENCONNECT=$(pgrep -x openconnect)
TUN2SOCKS=$(pgrep -f 'tun2socks|gost|xray|sing-box')

OC_IFACES=$(ip -o link show | awk -F': ' '{print $2}' | grep -E '^(tun|vpn|oc|ppp)')
TUN_IFACES=$(ip -o link show | awk -F': ' '{print $2}' | grep -E '^(tun|tap|tun2socks|sing|xray)')

if [[ -n "$OPENCONNECT" ]]; then
    ICON=""
    COLOR="#7aa2f7"

elif [[ -n "$TUN2SOCKS" ]]; then
    ICON=""
    COLOR="#8aff80"

elif [[ -n "$OC_IFACES" || -n "$TUN_IFACES" ]]; then
    ICON=""
    COLOR="#f3f99d"

else
    ICON=""
    COLOR="#ff5874"
fi

TEXT=$(printf "%8s" "$ICON VPN ")

echo "$TEXT"
echo ""
echo "$COLOR"
