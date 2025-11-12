#!/bin/sh
# Date: 2025/11/12
# Description: Checks if battery exists and displays its capacity percentage.

# Check if battery exists
if [ -d /sys/class/power_supply/BAT* ] 2>/dev/null; then
    capacity=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -1)
    if [ -n "$capacity" ]; then
        echo "#[fg=cyan,bg=brightblack,nobold,noitalics,nounderscore]#[fg=black,bg=cyan] 󰁹 ${capacity}% "
    fi
else
  exit 1
fi
