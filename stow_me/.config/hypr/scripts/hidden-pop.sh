#!/usr/bin/env bash

# Get the address of the most recently added window in special:hidden
WINDOW=$(hyprctl clients -j | \
  jq -r '[.[] | select(.workspace.name == "special:hidden")] | last | .address')

if [[ -z "$WINDOW" || "$WINDOW" == "null" ]]; then
  exit 0
fi

hyprctl dispatch movetoworkspacesilent "name:$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .activeWorkspace.name'),address:$WINDOW"
