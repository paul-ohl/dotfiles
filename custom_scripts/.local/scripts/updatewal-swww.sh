#!/bin/bash
#  _____ _                           ______        ____        ____        __ 
# |_   _| |__   ___ _ __ ___   ___  / ___\ \      / /\ \      / /\ \      / / 
#   | | | '_ \ / _ \ '_ ` _ \ / _ \ \___ \\ \ /\ / /  \ \ /\ / /  \ \ /\ / /  
#   | | | | | |  __/ | | | | |  __/  ___) |\ V  V /    \ V  V /    \ V  V /   
#   |_| |_| |_|\___|_| |_| |_|\___| |____/  \_/\_/      \_/\_/      \_/\_/    
#                                                                             
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 

# ----------------------------------------------------- 
# Select random wallpaper and create color scheme
# ----------------------------------------------------- 

# if [ "$1" ]; then
# 	wal -q -i "$1"
# else
# 	notify-send "Debug" "$1"
# 	wal -q -i ~/Pictures/wallpapers
# fi
wal -q -i ~/Pictures/wallpapers

# ----------------------------------------------------- 
# Load current pywal color scheme
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"

# ----------------------------------------------------- 
# Copy color file to waybar folder
# ----------------------------------------------------- 
cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/
cp $wallpaper ~/.cache/current_wallpaper.jpg

# ----------------------------------------------------- 
# Set the new wallpaper
# ----------------------------------------------------- 
swww img $wallpaper --transition-step 20 --transition-fps=20
# ~/.config/waybar/launch.sh

# ----------------------------------------------------- 
# Send notification
# ----------------------------------------------------- 
newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")
notify-send "Theme and Wallpaper updated" "With image $newwall"

echo "DONE!"
