#!/bin/bash

FLOATING=$(hyprctl activewindow -j | jq '.floating')

if [ "$FLOATING" = "true" ]; then
    hyprctl dispatch togglefloating
    exit 0
fi

# Get active monitor info
MONITOR=$(hyprctl activeworkspace -j | jq -r '.monitor')
MON=$(hyprctl monitors -j | jq --arg m "$MONITOR" '.[] | select(.name == $m)')

W=$(echo $MON | jq '.width')
H=$(echo $MON | jq '.height')
SCALE=$(echo $MON | jq '.scale')

# Convert to logical pixels (accounts for HiDPI)
LOGICAL_W=$(echo "$W $SCALE" | awk '{printf "%d", $1/$2}')
LOGICAL_H=$(echo "$H $SCALE" | awk '{printf "%d", $1/$2}')

WAYBAR_H=30
MARGINS=10
USABLE_H=$((LOGICAL_H - WAYBAR_H - (MARGINS * 3)))
START_Y=$((WAYBAR_H + (MARGINS * 2)))

HALF_W=$((LOGICAL_W / 2))
CENTER_X=$((LOGICAL_W / 4))

hyprctl dispatch togglefloating
sleep 0.05  # let Hyprland register the float state before resizing
hyprctl dispatch resizeactive exact ${HALF_W} ${USABLE_H}
hyprctl dispatch moveactive exact ${CENTER_X} ${START_Y}
