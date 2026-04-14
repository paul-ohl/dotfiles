#!/bin/sh
# Cycles through random wallpapers using awww

DEFAULT_INTERVAL=300

if [ $# -lt 1 ] || [ ! -d "$1" ]; then
    printf "Usage:\n\t\e[1m%s\e[0m \e[4mDIRECTORY\e[0m [\e[4mINTERVAL\e[0m]\n" "$0"
    printf "\tChanges the wallpaper to a randomly chosen image in DIRECTORY every\n\tINTERVAL seconds (or every %d seconds if unspecified)." "$DEFAULT_INTERVAL"
    exit 1
fi

TRANSITION_FPS="${AWWW_TRANSITION_FPS:-60}"
TRANSITION_STEP="${AWWW_TRANSITION_STEP:-1}"
TRANSITION_TYPE="${AWWW_TRANSITION_TYPE:-fade}"

while true; do
    find "$1" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) \
    | while read -r img; do
        echo "$(</dev/urandom tr -dc a-zA-Z0-9 | head -c 8):$img"
    done \
    | sort | cut -d':' -f2- \
    | while read -r img; do
        awww img "$img" \
            --resize fit \
            --transition-type "$TRANSITION_TYPE" \
            --transition-fps "$TRANSITION_FPS" \
            --transition-step "$TRANSITION_STEP"
        sleep "${2:-$DEFAULT_INTERVAL}"
    done
done
