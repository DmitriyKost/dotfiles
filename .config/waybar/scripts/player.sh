#!/usr/bin/env bash
# Output: "<icon> <title> — <artist>", padded to a constant 40-char width
# so neighboring blocks don't shift when the track changes.

WIDTH=40

meta=$(playerctl metadata --format '{{status}}|{{title}}|{{artist}}' 2>/dev/null)

if [ -z "$meta" ]; then
    text="No player"
else
    status=${meta%%|*}
    rest=${meta#*|}
    title=${rest%%|*}
    artist=${rest#*|}

    case "$status" in
        Playing) icon="▶" ;;
        Paused)  icon="⏸" ;;
        *)       icon="●" ;;
    esac

    if [ -n "$title" ] && [ -n "$artist" ]; then
        body="$title — $artist"
    elif [ -n "$title" ]; then
        body="$title"
    else
        body="(no metadata)"
    fi
    text="$icon $body"
fi

awk -v w="$WIDTH" 'BEGIN { OFS="" }
{
    n = length($0)
    if (n > w)      print substr($0, 1, w-1), "…"
    else if (n < w) printf "%s%*s\n", $0, w-n, ""
    else            print
}' <<<"$text"
