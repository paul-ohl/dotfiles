#!/bin/sh
# Date: 2025/11/12
# Description: Checks if battery exists and displays its capacity percentage with charging status.

# Check if battery exists
if [ -d /sys/class/power_supply/BAT* ] 2>/dev/null; then
    capacity=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -1)
    status=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null | head -1)

    if [ -n "$capacity" ]; then
        # Choose icon based on charging status
        if [ "$status" = "Charging" ]; then
            icon="󰂄"
        else
            icon="󰁹"
        fi

        echo "#[fg=cyan,bg=brightblack,nobold,noitalics,nounderscore]#[fg=black,bg=cyan] ${icon} ${capacity}% "
    fi
else
    exit 1
fi
