#!/usr/bin/env bash
# Fixed-width VPN state indicator: "VPN: oc" | "VPN:tun" | "VPN: if" | "VPN:off".

if pgrep -x openconnect >/dev/null; then
    label="oc"
elif pgrep -f 'tun2socks|gost|xray|sing-box' >/dev/null; then
    label="tun"
elif ip -o link show 2>/dev/null | awk -F': ' '{print $2}' | grep -qE '^(tun|tap|vpn|oc|ppp)'; then
    label="if"
else
    label="off"
fi

printf "VPN:%3s\n" "$label"
